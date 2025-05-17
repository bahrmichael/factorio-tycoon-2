package main

import (
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"strings"
)

func main() {
	if len(os.Args) != 5 {
		fmt.Println("Usage: ./placeholder-image width height text target-path")
		os.Exit(1)
	}

	width := os.Args[1]
	height := os.Args[2]
	text := os.Args[3]
	targetPath := os.Args[4]

	// URL encode the text (replace newlines with %0A)
	text = url.QueryEscape(strings.ReplaceAll(text, "\n", "%0A"))

	// Construct the URL
	imageURL := fmt.Sprintf("https://placehold.co/%sx%s/png?text=%s", width, height, text)

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