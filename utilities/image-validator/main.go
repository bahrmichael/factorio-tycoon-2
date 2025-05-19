package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"strings"

	"image"
	_ "image/png"

	golua "github.com/Shopify/go-lua"
	"github.com/Shopify/goluago/util"
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
		path := l.CheckString(1)
		width := int(l.CheckNumber(2))
		height := int(l.CheckNumber(3))
		protoType := l.CheckString(4)

		full := validateImage(path, width, height, protoType)
		if !full {
			invalidPaths = append(invalidPaths, path)
		}

		return 0
	})

	// Execute our extraction script
	extractionScript, err := ioutil.ReadFile("utilities/image-validator/extract.lua")
	if err != nil {
		fmt.Printf("Error reading extraction script: %v\n", err)
		os.Exit(1)
	}

	// Run the extraction script
	if err := util.DoString(l, string(extractionScript)); err != nil {
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