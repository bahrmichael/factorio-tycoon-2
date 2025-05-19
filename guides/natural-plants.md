# Creating Naturally-Occurring Plants for Nauvis: A Beginner's Guide

This guide will walk you through implementing plants that generate naturally in your Factorio world as part of the map generation process. We'll focus on techniques similar to how the Space Age mod places yumako trees and jellystem plants on Gleba soil.

> **Note:** This guide uses the `plant` prototype type which requires the Space Age mod to function. See the [official PlantPrototype documentation](https://lua-api.factorio.com/latest/prototypes/PlantPrototype.html).

## Understanding Plant Generation in Factorio

Plants in Factorio are entities that can be placed during world generation using the autoplace system. The same system that places ore patches and starting resources can place your custom plants. Plants can be restricted to specific tile types (like our custom soil), creating specialized biomes that encourage exploration and resource gathering.

## Step 1: Define the Noise Expression for Plant Distribution

First, let's create a noise expression that will determine where plants appear. Add this to your `prototypes/planet/planet-nauvis-map-gen.lua` file:

```lua
data:extend({
  -- Noise pattern for plant distribution
  {
    type = "noise-expression",
    name = "tycoon_plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/20 * control:tycoon_plants:frequency} * \
               multioctave_noise{x = x, y = y, persistence = 0.8, seed0 = map_seed, seed1 = 200000, octaves = 3, input_scale = 1/6 * control:tycoon_plants:frequency})"
  }
})
```

**Why this works:**
- `multioctave_noise` creates fractal noise patterns that look natural
- Multiplying two noise patterns creates more interesting variation
- `persistence` controls how quickly detail diminishes at each scale
- Using different seed values ensures the patterns don't mirror each other
- `input_scale` connects to the frequency control in map generation settings

## Step 2: Create an Autoplace Control

Now we need an autoplace control to manage plant density. Add to `prototypes/autoplace-controls.lua`:

```lua
data:extend({
  {
    type = "autoplace-control",
    name = "tycoon_plants",
    order = "d-a",
    category = "terrain",
    can_be_disabled = true,
    richness = true -- Allow adjusting both density and richness
  }
})
```

**Why this matters:**
- Creates a slider in map generation settings for players to adjust plant density
- The `category` places it in the terrain section alongside other natural features
- Setting `can_be_disabled` to true lets players disable plants entirely if desired
- Setting `richness` to true adds another slider for controlling plant cluster sizes

## Step 3: Define Your Plant Entity

Now we'll create the plant entity itself. Create a file at `prototypes/entity/plants.lua`:

```lua
local util = require("util")
local sounds = require("__base__.prototypes.entity.sounds")

local seconds = 60
local minutes = 60 * seconds

-- Define flags and properties for your plant
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}
local plant_emissions = { pollution = -0.001 } -- Plants absorb pollution
local plant_harvest_emissions = { spores = 15 } -- Plants release spores when harvested

data:extend({
  {
    type = "plant", -- Requires Space Age mod
    name = "tycoon-berry-bush",
    icon = "__tycoon__/graphics/icons/berry-bush.png",
    icon_size = 64,
    flags = plant_flags,
    minable = {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "tycoon-berries", amount = 5}}
    },
    max_health = 20,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -0.8}, {0.5, 0.5}},
    subgroup = "trees",
    order = "a[tree]-b[tycoon]-a[berry-bush]",
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions, -- Unique to plant prototype
    autoplace = {
      control = "tycoon_plants",
      order = "a[plant]-a[berry-bush]",
      probability_expression = "min(0.1, 0.2 * (1 - tycoon_plants_noise) * control:tycoon_plants:size)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"natural-tycoon-soil"} -- Only grows on our custom soil
    },
    map_color = {r = 0.2, g = 0.8, b = 0.2},
    pictures = {
      {
        filename = "__tycoon__/graphics/entity/berry-bush/berry-bush-1.png",
        width = 64,
        height = 64,
        shift = util.by_pixel(0, -16)
      },
      {
        filename = "__tycoon__/graphics/entity/berry-bush/berry-bush-2.png",
        width = 64,
        height = 64,
        shift = util.by_pixel(0, -16)
      },
      {
        filename = "__tycoon__/graphics/entity/berry-bush/berry-bush-3.png",
        width = 64,
        height = 64,
        shift = util.by_pixel(0, -16)
      }
    },
    walking_sound = sounds.plant,
    growth_ticks = 5 * minutes, -- Required for plant prototype - time to regrow
    agricultural_tower_tint = { -- Used by agricultural tower
      primary = {r = 0.7, g = 0.3, b = 0.3, a = 1.0},
      secondary = {r = 0.5, g = 0.5, b = 0.1, a = 1.0},
    },
  }
})
```

**Key configuration points:**
- `type = "plant"` marks this as a harvestable plant (Space Age feature)
- `growth_ticks` (required for plants) controls regrowth time after harvesting
- `harvest_emissions` (plant-specific) defines pollution released during harvesting 
- `agricultural_tower_tint` defines how the plant appears in agricultural towers
- `autoplace` configuration connects to our noise expression and limits to our soil type
- `probability_expression` determines how common the plant is
- `richness_expression` uses the built-in `random_penalty_at` function
- `tile_restriction` ensures plants only grow on our custom soil type

## Step 4: Create an Item for Harvested Plants

When players mine your plant, they need to get something. Add to `prototypes/item.lua`:

```lua
data:extend({
  {
    type = "item",
    name = "tycoon-berries",
    icon = "__tycoon__/graphics/icons/berries.png",
    icon_size = 64,
    subgroup = "raw-resource",
    order = "b[tycoon]-a[berries]",
    stack_size = 100,
    fuel_value = "1MJ", -- Plants can be used as fuel
    fuel_category = "chemical",
  }
})
```

## Step 5: Registering Everything in Your data.lua

Make sure all your files are loaded by adding to the root `data.lua`:

```lua
require("prototypes.planet.planet-nauvis-map-gen") -- For noise expressions
require("prototypes.autoplace-controls") -- For plant controls
require("prototypes.entity.plants") -- For plant entities
require("prototypes.item") -- For plant items
```

## Step 6: Creating Graphics

For your plant to appear in the game, you need to create these graphics:

1. `__tycoon__/graphics/icons/berry-bush.png` - Icon for the plant
2. `__tycoon__/graphics/icons/berries.png` - Icon for the harvested item
3. `__tycoon__/graphics/entity/berry-bush/berry-bush-1.png` - Plant appearance variation 1
4. `__tycoon__/graphics/entity/berry-bush/berry-bush-2.png` - Plant appearance variation 2
5. `__tycoon__/graphics/entity/berry-bush/berry-bush-3.png` - Plant appearance variation 3

## Understanding Autoplace Configurations

The autoplace system uses several key components:

1. **Noise Expressions:** Create patterns of where plants can grow
2. **Autoplace Controls:** Allow players to adjust density via map settings
3. **Probability Expression:** Determines likelihood of a plant at each tile
4. **Richness Expression:** Controls density/quantity in an area
5. **Tile Restriction:** Limits plants to specific tile types

## Advanced Techniques from Space Age

The Space Age mod uses some more advanced techniques that you can apply as you become more comfortable:

### Using Tree Type as an Alternative

If you don't want to depend on the Space Age mod, you can use the standard `tree` prototype type instead of `plant`. Trees can't regrow after harvesting, but otherwise support similar autoplace settings:

```lua
data:extend({
  {
    type = "tree", -- Available in base Factorio
    name = "tycoon-berry-bush",
    -- Most settings are the same as for plants
    -- But remove growth_ticks, harvest_emissions, and agricultural_tower_tint
  }
})
```

### Multiple Variations with Helper Functions

Instead of listing picture variations directly, Space Age uses a helper function to generate them:

```lua
-- Example simplified from Space Age
local function plant_variations(name, variation_count)
  local variations = {}
  for i = 1, variation_count do
    -- Generate different visual styles based on the index
    table.insert(variations, {
      -- Configuration for this variation
    })
  end
  return variations
end
```

### Complex Probability Expressions

Space Age uses complex probability expressions to place plants in specific biome patterns:

```lua
-- Example from yumako-tree
probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)"

-- Example from stingfrond (more complex)
probability_expression = "max(main_probability, invasion_top_probability)",
local_expressions = {
  main_box = "min(gleba_select(gleba_aux, 0, 0.5, 0.15, -10, 1), gleba_select(gleba_moisture, 0.25, 0.5, 0.01, -10, 1)) - 1",
  main_probability = "min(0.05, 0.1 * (main_box + gleba_plants_noise - 0.25) * control:gleba_plants:size)",
  invasion_top_box = "min(gleba_select(gleba_aux, 0, 0.5, 0.15, -10, 1), gleba_select(gleba_moisture, 0.1, 0.25, 0.01, -10, 1)) - 1",
  invasion_top_probability = "min(0.05, 0.1 * (invasion_top_box + gleba_plants_noise - 0.55) * control:gleba_plants:size)"
}
```

## Testing Your Plants

To test your plants:

1. Start a new game with your mod enabled
2. Ensure you've adjusted the autoplace settings for your plants
3. Look for your custom soil (plants will only appear there)
4. If plants aren't appearing or are too sparse:
   - Increase the value in the probability expression
   - Check that your tile restrictions match your soil name exactly
   - Ensure graphics files exist with the correct paths

## Going Further

Once your plants are working, consider these enhancements:

- Add special effects when harvesting (particle effects, sounds)
- Create recipes that use your harvested plants
- Implement growth stages for plants to evolve over time
- Add plant-specific decorative elements that appear nearby
- Create specialized tools for harvesting plants more efficiently