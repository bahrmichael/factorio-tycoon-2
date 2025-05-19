# Factorio Mod Image Validator

This utility checks all image references in a Factorio mod to ensure they exist and have the correct dimensions.

## Requirements

- Go 1.16 or later
- The following Go packages:
  - `github.com/Shopify/go-lua`
  - `github.com/Shopify/goluago`

## Usage

```bash
# Build the utility
go build -o image-validator

# Run the validator
./image-validator
```

## How it works

1. The utility executes a Lua script that wraps Factorio's `data.extend` function
2. As the mod loads, the script captures all image references along with their expected dimensions
3. The Go program validates that each referenced image exists and has the correct dimensions
4. If any issues are found, they are reported and the program exits with code 1