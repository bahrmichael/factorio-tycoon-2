# Creating Natural Soil for Nauvis: A Beginner's Guide

This guide will walk you through implementing natural soil that generates in your Factorio world without player intervention. We'll focus on having your custom soil appear in natural patches on Nauvis (the default Factorio planet), similar to how soil appears on Gleba in the Space Age mod.

## Understanding Natural Soil

Natural soil in Factorio mods is a special tile type that's placed during world generation. Unlike player-placeable tiles, natural soil should be discovered as part of the landscape. For example, in Space Age, you'll find patches of Yumako or Jellynut soil in specific areas of Gleba, encouraging exploration and specialized building.

## Step 1: Creating the Basic Tile Definition

First, we need to define our soil as a tile type. Create a file at `prototypes/tile/tiles-nauvis.lua` (or add to an existing file):

```lua
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")

data:extend({
  {
    type = "tile",
    name = "natural-tycoon-soil",
    order = "a[tycoon]-b[natural-tycoon-soil]",
    collision_mask = {"ground-tile"},
    layer = 61,
    decorative_removal_probability = 0.9,
    variants = {
      main = {
        {  
          picture = "__tycoon__/graphics/terrain/natural-tycoon-soil.png",
          count = 8,
          size = 1
        }
      },
      empty_transitions = true
    },
    map_color = {r = 158, g = 120, b = 75},
    pollution_absorption_per_second = 0.0002,
    walking_sound = tile_sounds.dirt_walking,
  }
})
```

**Why these settings?**
- `collision_mask` allows entities to be built on the soil
- `layer` determines how it draws compared to other tiles (experiment with this value)
- `map_color` helps players identify soil patches on the map
- We use a simplified variant structure with just one tile graphic and no transitions
- `empty_transitions = true` tells the game not to worry about corner/edge transitions

## Step 2: Creating Noise Expressions for Placement

Next, we need to define how and where our soil will appear in the world. Create or modify `prototypes/planet/planet-nauvis-map-gen.lua`:

```lua
data:extend({
  -- Helper function for smooth transitions
  {
    type = "noise-function",
    name = "tycoon_select",
    parameters = {"input", "from", "to", "slope", "min", "max"},
    expression = "clamp(min(input - (from - slope), to + slope - input) / slope, min, max)"
  },
  
  -- Noise patterns for soil distribution
  {
    type = "noise-expression",
    name = "tycoon_soil_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20})"
  },
  
  -- This expression determines where our soil will appear
  {
    type = "noise-expression",
    name = "tycoon_soil_region",
    expression = "clamp(moisture, 0.45, 0.65, 0.1, 0, 1) * clamp(elevation, 15, 35, 10, 0, 1) * (1 + tycoon_soil_noise - 0.5)"
  },
})
```

**Why this approach?**
- `tycoon_select` creates smooth transitions between different terrain types (similar to the `clamp` built-in function)
- `multioctave_noise` is a built-in Factorio function that generates fractal noise patterns
- We reference standard map variables like `moisture` and `elevation` to place soil in realistic locations
- The combination of multiple factors creates more natural distribution patterns

## Step 3: Creating an Autoplace Control

Now we need an autoplace control to manage the generation of our soil. Add to `prototypes/autoplace-controls.lua`:

```lua
data:extend({
  {
    type = "autoplace-control",
    name = "tycoon_soil",
    order = "b-a",
    category = "terrain",
    can_be_disabled = true
  }
})
```

**Why an autoplace control?**
- Allows players to adjust frequency, size, and richness of your soil in map generation settings
- Creates a category in the map generator UI for your feature
- Makes your mod more flexible and user-friendly

## Step 4: Connecting the Tile to Autoplace Settings

Now we need to configure the actual autoplace settings for our soil tile. Go back to your tile definition in `tiles-nauvis.lua` and add:

```lua
-- Add this inside your tile definition
autoplace = {
  probability_expression = "tycoon_soil_region * control:tycoon_soil:size * control:tycoon_soil:frequency",
  richness_expression = "1",
  order = "a[tycoon-soil]",
}
```

**Why this setup?**
- Links the soil's placement to our noise expression
- Integrates with the autoplace control we created
- Allows players to adjust the `size` and `frequency` parameters in map settings

## Step 5: Registering Everything in Your Data.lua

Make sure all your files are loaded by adding to the root `data.lua`:

```lua
require("prototypes.planet.planet-nauvis-map-gen")
require("prototypes.autoplace-controls")
require("prototypes.tile.tiles-nauvis")
```

## Step 6: Creating Graphics

You'll need to create these graphics files:
1. `__tycoon__/graphics/terrain/natural-tycoon-soil.png` - Base tile
2. `__tycoon__/graphics/terrain/natural-tycoon-soil-2.png` - 2x2 variant
3. `__tycoon__/graphics/terrain/natural-tycoon-soil-4.png` - 4x4 variant
4. `__tycoon__/graphics/terrain/natural-tycoon-soil-inner-corner.png` - For transitions
5. `__tycoon__/graphics/terrain/natural-tycoon-soil-outer-corner.png` - For transitions
6. `__tycoon__/graphics/terrain/natural-tycoon-soil-side.png` - For transitions

The base game and Space Age mod are good references for the correct formats and sizes.

## Understanding Noise Expressions

Noise expressions are the heart of natural terrain generation. Here's what's happening in our code:

- **Base Noise Function**: `multioctave_noise` creates fractal patterns that look natural
- **Parameters**:
  - `persistence`: Controls how quickly detail diminishes at each scale
  - `octaves`: Number of detail layers (more = more detail but more calculation)
  - `input_scale`: Controls the scale of patterns (smaller = larger features)
  - `seed`: Ensures different worlds have different patterns

- **Combining Factors**: We multiply several conditions to determine where soil appears:
  - Moisture in a specific range (drier than swamps, wetter than deserts)
  - Elevation in a specific range (not too low/high)
  - Random noise variation for natural patchiness

## Testing Your Soil

To test your soil:
1. Start a new game
2. Check the map view for colored soil patches
3. Explore to find your soil

If your soil isn't appearing:
- Make sure your graphics files exist and are correct
- Try increasing the `size` and `frequency` settings in map generation
- Adjust your noise expressions to make the soil more common

## Going Further

Once your natural soil is working, you might want to:
- Add plants that only grow on your soil
- Create artificial versions that can be crafted by players
- Add special effects when players walk on the soil
- Make resources like oil more common near your soil

Remember that soil is just the beginning - it creates opportunities for specialized buildings, unique resources, and interesting gameplay mechanics!