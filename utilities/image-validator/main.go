package main

import (
	"fmt"
	"os"
	"strings"

	"image"
	_ "image/png"

	golua "github.com/Shopify/go-lua"
)

type ImageReference struct {
	Path   string
	Width  int
	Height int
	Type   string
}

var invalidPaths []string

func main() {
	// Create Lua state
	l := golua.NewState()
	golua.OpenLibraries(l)

	// Register Go functions for Lua
	l.Register("reportImageReference", func(l *golua.State) int {
		path, pathOk := l.ToString(1)
		if !pathOk {
			fmt.Println("Error: Invalid path parameter")
			return 0
		}

		widthFloat, widthOk := l.ToNumber(2)
		if !widthOk {
			fmt.Println("Error: Invalid width parameter")
			return 0
		}
		width := int(widthFloat)

		heightFloat, heightOk := l.ToNumber(3)
		if !heightOk {
			fmt.Println("Error: Invalid height parameter")
			return 0
		}
		height := int(heightFloat)

		protoType, typeOk := l.ToString(4)
		if !typeOk {
			fmt.Println("Error: Invalid type parameter")
			return 0
		}

		full := validateImage(path, width, height, protoType)
		if !full {
			invalidPaths = append(invalidPaths, path)
		}

		return 0
	})

	// Execute our extraction script
	extractionScript, err := os.ReadFile("utilities/image-validator/extract.lua")
	if err != nil {
		fmt.Printf("Error reading extraction script: %v\n", err)
		os.Exit(1)
	}

	// First register a print function to see Lua output
	l.Register("print", func(l *golua.State) int {
		msg, ok := l.ToString(1)
		if ok {
			fmt.Printf("LUA: %s\n", msg)
		}
		return 0
	})

	// Run the extraction script
	if err := golua.DoString(l, string(extractionScript)); err != nil {
		fmt.Printf("Error executing Lua script: %v\n", err)
		os.Exit(1)
	}

	// Check results
	if len(invalidPaths) > 0 {
		fmt.Println("The following image paths are invalid:")
		for _, path := range invalidPaths {
			fmt.Println(" -", path)
		}
		os.Exit(1)
	}

	fmt.Println("All image references are valid.")
	os.Exit(0)
}

func validateImage(path string, expectedWidth, expectedHeight int, protoType string) bool {
	// Print all images being checked for debugging
	fmt.Printf("DEBUG: Checking image %s (%s) with expected dimensions %dx%d\n", path, protoType, expectedWidth, expectedHeight)

	// Remove any "__base__" placeholders in the path
	cleanPath := strings.Replace(path, "__base__", "", -1)

	// Check if file exists
	if _, err := os.Stat(cleanPath); os.IsNotExist(err) {
		fmt.Printf("Missing image: %s (%s)\n", cleanPath, protoType)
		return false
	}

	// Open and decode the image
	file, err := os.Open(cleanPath)
	if err != nil {
		fmt.Printf("Error opening image %s: %v\n", cleanPath, err)
		return false
	}
	defer file.Close()

	img, _, err := image.DecodeConfig(file)
	if err != nil {
		fmt.Printf("Error decoding image %s: %v\n", cleanPath, err)
		return false
	}

	// Check dimensions
	if img.Width != expectedWidth || img.Height != expectedHeight {
		fmt.Printf("Invalid dimensions for %s (%s): expected %dx%d, got %dx%d\n",
			cleanPath, protoType, expectedWidth, expectedHeight, img.Width, img.Height)
		return false
	}

	return true
}
