package main

import (
	"regexp"
	"strings"
	"testing"
)

func TestPrototypeRegex(t *testing.T) {
	// Define regex patterns here to avoid dependencies on the main package variables
	prototypePattern := `type\s*=\s*["']([^"']+)["'][^}]*name\s*=\s*["']([^"']+)["']`
	commentPattern := `^\s*--`
	prototypeRegex := regexp.MustCompile(prototypePattern)
	commentRegex := regexp.MustCompile(commentPattern)

	tests := []struct {
		name     string
		input    string
		expected bool
		type_    string
		name_    string
	}{
		{
			name: "Simple item definition",
			input: `data:extend({
				{
					type = "item",
					name = "tycoon-egg",
					icon = "__base__/graphics/icons/iron-plate.png",
					icon_size = 64,
				}
			})
			`,
			expected: true,
			type_:    "item",
			name_:    "tycoon-egg",
		},
		{
			name: "Entity definition with single quotes",
			input: `data:extend({
				{
					type = 'entity',
					name = 'tycoon-farm',
					-- other properties
				}
			})
			`,
			expected: true,
			type_:    "entity",
			name_:    "tycoon-farm",
		},
		{
			name: "Technology definition with multiple items",
			input: `data:extend({
				{
					type = "technology",
					name = "tycoon-farming",
					prerequisites = {"automation"},
					effects = {
						{
							type = "unlock-recipe",
							recipe = "tycoon-farm"
						}
					},
				}
			})
			`,
			expected: true,
			type_:    "technology",
			name_:    "tycoon-farming",
		},
		{
			name: "Order reversed - name before type",
			input: `data:extend({
				{
					name = "tycoon-wheat",
					type = "item",
				}
			})
			`,
			expected: false, // Our regex expects type to be first
			type_:    "",
			name_:    "",
		},
		{
			name: "Multiple items in one data:extend",
			input: `data:extend({
				{
					type = "item",
					name = "tycoon-flour",
				},
				{
					type = "item",
					name = "tycoon-bread",
				}
			})
			`,
			expected: true,
			type_:    "item",
			name_:    "tycoon-flour", // Should match the first one
		},
		{
			name: "No type or name fields",
			input: `data:extend({
				{
					id = "test",
					value = 123
				}
			})
			`,
			expected: false,
			type_:    "",
			name_:    "",
		},
		{
			name: "Commented-out prototype",
			input: `data:extend({
				{
					-- This line is a comment
					-- type = "item",
					-- name = "tycoon-test",
					id = "something-else"
				}
			})
			`,
			expected: false,
			type_:    "",
			name_:    "",
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			// Remove commented lines
			lines := strings.Split(tc.input, "\n")
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
			matches := prototypeRegex.FindStringSubmatch(filteredContent)
			gotMatch := len(matches) > 0

			if gotMatch != tc.expected {
				t.Errorf("Expected match: %v, got: %v", tc.expected, gotMatch)
				return
			}

			if !gotMatch {
				return // No need to check captured groups if we didn't expect a match
			}

			// Extract matched values
			gotType := matches[1]
			gotName := matches[2]

			if gotType != tc.type_ {
				t.Errorf("Expected type: %q, got: %q", tc.type_, gotType)
			}

			if gotName != tc.name_ {
				t.Errorf("Expected name: %q, got: %q", tc.name_, gotName)
			}
		})
	}
}

// Test for our modified regex that handles name-before-type case
func TestImprovedPrototypeRegex(t *testing.T) {
	// A more flexible regex that doesn't depend on field order
	commentPattern := `^\s*--`
	improvedRegex := regexp.MustCompile(`(?s)type\s*=\s*["']([^"']+)["'][^}]*name\s*=\s*["']([^"']+)["']|name\s*=\s*["']([^"']+)["'][^}]*type\s*=\s*["']([^"']+)["']`)
	commentRegex := regexp.MustCompile(commentPattern)

	input := `data:extend({
	{
		name = "tycoon-wheat",
		type = "item",
	}
})
`

	// Remove commented lines
	lines := strings.Split(input, "\n")
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
	matches := improvedRegex.FindStringSubmatch(filteredContent)
	if len(matches) == 0 {
		t.Fatal("Failed to match input with improved regex")
	}

	// With the improved regex, we either have matches in groups 1&2 (type-first)
	// or in groups 3&4 (name-first)
	var typeVal, nameVal string
	if matches[1] != "" {
		// Type first
		typeVal = matches[1]
		nameVal = matches[2]
	} else {
		// Name first 
		nameVal = matches[3]
		typeVal = matches[4]
	}

	expectedType := "item"
	expectedName := "tycoon-wheat"

	if typeVal != expectedType {
		t.Errorf("Expected type: %q, got: %q", expectedType, typeVal)
	}

	if nameVal != expectedName {
		t.Errorf("Expected name: %q, got: %q", expectedName, nameVal)
	}
}