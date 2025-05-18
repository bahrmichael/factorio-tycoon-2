package main

import (
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

// Types of prototypes to look for
var prototypeTypes = []string{"item", "entity", "technology"}

// Image dimensions for different prototype types
var imageDimensions = map[string]struct{width, height string}{
	"item": {"64", "64"},
	"entity": {"128", "128"},
	"technology": {"128", "128"},
}

// Regular expression to find prototype definitions
var prototypeRegex = regexp.MustCompile(`type\s*=\s*["']([^"']+)["'][^}]*name\s*=\s*["']([^"']+)["']`)
// Regular expression to identify commented lines
var commentRegex = regexp.MustCompile(`^\s*--`)

func main() {
	if len(os.Args) > 1 && os.Args[1] == "--auto" {
		// Auto mode - scan the codebase and generate missing images
		fmt.Println("Running in auto mode - scanning for missing images...")
		generateAllMissingImages()
		return
	}

	// Original functionality
	if len(os.Args) != 5 {
		fmt.Println("Usage: ./placeholder-image width height text target-path")
		fmt.Println("       ./placeholder-image --auto (to auto-generate all missing images)")
		os.Exit(1)
	}

	width := os.Args[1]
	height := os.Args[2]
	text := os.Args[3]
	targetPath := os.Args[4]

	generatePlaceholderImage(width, height, text, targetPath)
}

func generatePlaceholderImage(width, height, text, targetPath string) {
	// URL encode the text (replace newlines with %0A)
	text = url.QueryEscape(strings.ReplaceAll(text, "\n", "%0A"))

	// Construct the URL
	imageURL := fmt.Sprintf("https://placehold.co/%sx%s/png?text=%s", width, height, text)

	// Make directory if it doesn't exist
	os.MkdirAll(filepath.Dir(targetPath), 0755)

	// Download the image
	resp, err := http.Get(imageURL)
	if err != nil {
		fmt.Printf("Error downloading image: %v\n", err)
		os.Exit(1)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		fmt.Printf("Error: received status code %d\n", resp.StatusCode)
		os.Exit(1)
	}

	// Create the target file
	file, err := os.Create(targetPath)
	if err != nil {
		fmt.Printf("Error creating file: %v\n", err)
		os.Exit(1)
	}
	defer file.Close()

	// Copy the image data to the file
	_, err = io.Copy(file, resp.Body)
	if err != nil {
		fmt.Printf("Error saving image: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("Image saved to %s\n", targetPath)
}

func generateAllMissingImages() {
	// Start recursively scanning Lua files from data.lua
	prototypes := scanLuaFiles("data.lua")
	fmt.Printf("Found %d prototypes\n", len(prototypes))

	// For each prototype, check if image exists and generate if it doesn't
	for protoType, protoNames := range prototypes {
		for _, name := range protoNames {
			generateImageIfMissing(protoType, name)
		}
	}
}

// Scans Lua files recursively starting from entryPoint
func scanLuaFiles(entryPoint string) map[string][]string {
	prototypes := make(map[string][]string)
	for _, protoType := range prototypeTypes {
		prototypes[protoType] = []string{}
	}

	// Process entry point
	content, err := os.ReadFile(entryPoint)
	if err != nil {
		fmt.Printf("Error reading %s: %v\n", entryPoint, err)
		return prototypes
	}

	// Process requires and gather prototypes
	processLuaFile(string(content), entryPoint, prototypes)

	return prototypes
}

// Processes a Lua file's content, finding both requires and prototype definitions
func processLuaFile(content string, _ string, prototypes map[string][]string) {
	// Find require statements
	requireRegex := regexp.MustCompile(`require\(["']([^"']+)["']\)`)
	matches := requireRegex.FindAllStringSubmatch(content, -1)

	for _, match := range matches {
		requiredFile := match[1]
		// Convert to file path
		requiredPath := strings.ReplaceAll(requiredFile, ".", "/") + ".lua"
		
		// Read and process the required file
		requiredContent, err := os.ReadFile(requiredPath)
		if err != nil {
			fmt.Printf("Warning: Could not read required file %s: %v\n", requiredPath, err)
			continue
		}
		
		processLuaFile(string(requiredContent), requiredPath, prototypes)
	}

	// Remove commented lines
	lines := strings.Split(content, "\n")
	var filteredLines []string
	for _, line := range lines {
		// Skip lines that start with comments
		if commentRegex.MatchString(line) {
			continue
		}
		// Keep other lines
		filteredLines = append(filteredLines, line)
	}
	
	// Rejoin the content without comments
	filteredContent := strings.Join(filteredLines, "\n")
	
	// Find prototype definitions
	protoMatches := prototypeRegex.FindAllStringSubmatch(filteredContent, -1)
	for _, match := range protoMatches {
		if len(match) >= 3 {
			protoType := match[1]
			protoName := match[2]
			
			// Only add if we're tracking this type
			if _, ok := prototypes[protoType]; ok {
				prototypes[protoType] = append(prototypes[protoType], protoName)
			}
		}
	}
}

// Determines if an image should be generated for the given prototype
func generateImageIfMissing(protoType, protoName string) {
	// Only process items with tycoon- prefix
	if !strings.HasPrefix(protoName, "tycoon-") {
		// Skip non-tycoon items
		fmt.Printf("Skipping non-tycoon %s: '%s'\n", protoType, protoName)
		return
	}

	// Strip tycoon- prefix from the name for the image path
	imageBaseName := strings.TrimPrefix(protoName, "tycoon-")
	
	// Determine expected image path based on prototype type and name (without tycoon- prefix)
	var imagePath string
	switch protoType {
	case "item":
		imagePath = fmt.Sprintf("graphics/items/%s.png", imageBaseName)
	case "entity":
		imagePath = fmt.Sprintf("graphics/entities/%s.png", imageBaseName)
	case "technology":
		imagePath = fmt.Sprintf("graphics/technologies/%s.png", imageBaseName)
	default:
		return // Unsupported prototype type
	}

	// Check if image already exists
	if _, err := os.Stat(imagePath); err == nil {
		return // Image already exists
	}

	// Get dimensions for this prototype type
	dims, ok := imageDimensions[protoType]
	if !ok {
		fmt.Printf("Error: Unknown dimensions for prototype type %s\n", protoType)
		return
	}

	// For items, use only the first letter capitalized
	text := imageBaseName // Already stripped tycoon- prefix
	if protoType == "item" && len(text) > 0 {
		text = strings.ToUpper(text[:1])
	}

	// Generate placeholder image
	fmt.Printf("Generating image for %s '%s' at %s\n", protoType, protoName, imagePath)
	generatePlaceholderImage(dims.width, dims.height, text, imagePath)
}