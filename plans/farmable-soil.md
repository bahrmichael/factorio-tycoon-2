# Farmable Soil Implementation Plan for Nauvis

## Overview

Factorio 2.0 introduced soil mechanics on planet Gleba that allow for farming and agriculture. Our objective is to implement a similar "Farmable Soil" system for Nauvis (the default planet) to enable agriculture without needing to travel to Gleba. This document outlines the implementation plan.

## Research from Gleba's Soil Mechanics

Gleba uses several types of soil for farming:

1. **Natural Fertile Soil** - Exists around Jellystems and Yumako trees
2. **Wetland Tiles** - Can be made fertile with artificial soil
3. **Regular Biome Tiles** - Can be made farmable with more expensive overgrowth soil

Soil types on Gleba:
- **Artificial Jellynut Soil** - For wetland tiles
- **Artificial Yumako Soil** - For wetland tiles
- **Overgrowth Jellynut Soil** - For regular tiles
- **Overgrowth Yumako Soil** - For regular tiles

## Nauvis Wetland Implementation

To create a system similar to Gleba, we need to generate wetland patches on Nauvis that can be converted into farmable soil more easily than regular terrain.

### 1. Wetland Tile Prototype

```lua
data:extend({
  {
    type = "tile",
    name = "tycoon-wetland",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    layer = 60,
    decorative_removal_probability = 0.9,
    walking_speed_modifier = 0.8, -- slightly slower to walk on
    pollution_absorption_per_second = 0.0002, -- better pollution absorption
    map_color = {r = 76, g = 105, b = 113},
    minable = {mining_time = 0.5, result = "tycoon-wetland-soil"},
    mined_sound = {filename = "__base__/sound/walking/dirt-02.ogg"},
    variants = {
      main = {
        -- Define tile graphics here
        -- Will use placeholder images initially
      }
    }
  }
})
```

### 2. Wetland Autoplace Generation

```lua
data:extend({
  {
    type = "autoplace-control",
    name = "tycoon-wetland",
    richness = true,
    order = "b-a",
    category = "terrain"
  },
  {
    type = "noise-layer",
    name = "tycoon-wetland"
  }
})

data.raw["tile"]["tycoon-wetland"].autoplace = {
  probability_expression = noise.define_noise_function(function(x, y, tile, map)
    -- Generate patches near water
    local water_proximity = noise.distance_from("water")
    -- More likely to appear in low elevation areas
    local elevation = noise.get_control_setting("elevation")

    -- Generate wetland patches with higher probability near water and in low areas
    return noise.max(0, noise.min(
      0.35,
      noise.function_application("exponential", noise.distance_from("water") * -0.05) * 0.4 +
      noise.random_penalty(map.seed, 0.1) +
      noise.absolute_value(elevation) * -0.2
    ))
  end),
  richness_expression = noise.define_noise_function(function(x, y, tile, map)
    -- Higher richness means larger, more continuous patches
    return noise.random_penalty(map.seed + 100, 0.25) + 0.5
  end)
}
```

## Farmable Soil Implementation for Nauvis

### 1. Item Prototypes

Create the following items:

```lua
-- Wetland soil item (harvested from wetland tiles)
data:extend({
  {
    type = "item",
    name = "tycoon-wetland-soil",
    icon = "__tycoon__/graphics/items/wetland-soil.png",
    icon_size = 64,
    stack_size = 50,
    subgroup = "terrain",
    order = "a[terrain]-a[wetland-soil]"
  },

  -- Basic farmable soil item
  {
    type = "item",
    name = "tycoon-farmable-soil",
    icon = "__tycoon__/graphics/items/farmable-soil.png",
    icon_size = 64,
    stack_size = 50,
    place_result = "tycoon-farmable-soil",
    subgroup = "terrain",
    order = "a[terrain]-b[farmable-soil]"
  },

  -- Enhanced farmable soil (better fertility)
  {
    type = "item",
    name = "tycoon-enhanced-farmable-soil",
    icon = "__tycoon__/graphics/items/enhanced-farmable-soil.png",
    icon_size = 64,
    stack_size = 50,
    place_result = "tycoon-enhanced-farmable-soil",
    subgroup = "terrain",
    order = "a[terrain]-c[enhanced-farmable-soil]"
  }
})
```

### 2. Entity Prototypes

Create tile entities for the farmable soil:

```lua
data:extend({
  {
    type = "tile",
    name = "tycoon-farmable-soil",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    layer = 61,
    decorative_removal_probability = 0.9,
    walking_speed_modifier = 1.0,
    pollution_absorption_per_second = 0.00015,
    map_color = {r = 121, g = 93, b = 66},
    minable = {mining_time = 0.5, result = "tycoon-farmable-soil"},
    mined_sound = {filename = "__base__/sound/walking/dirt-02.ogg"},
    variants = {
      main = {
        -- Define tile graphics here
        -- Will use placeholder images initially
      }
    }
  },

  {
    type = "tile",
    name = "tycoon-enhanced-farmable-soil",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    layer = 62,  -- Higher layer to override regular farmable soil
    decorative_removal_probability = 0.95,
    walking_speed_modifier = 1.0,
    pollution_absorption_per_second = 0.00025,  -- Better pollution absorption
    map_color = {r = 101, g = 83, b = 56},
    minable = {mining_time = 0.5, result = "tycoon-enhanced-farmable-soil"},
    mined_sound = {filename = "__base__/sound/walking/dirt-02.ogg"},
    variants = {
      main = {
        -- Define tile graphics here
        -- Will use placeholder images initially
      }
    }
  }
})
```

### 3. Recipe Prototypes

Create recipes for crafting the farmable soil:

```lua
data:extend({
  -- Recipe for farmable soil from wetland soil (easier/cheaper)
  {
    type = "recipe",
    name = "tycoon-farmable-soil-from-wetland",
    energy_required = 1,
    enabled = false,  -- Unlocked by technology
    category = "crafting",
    ingredients = {
      {type = "item", name = "tycoon-wetland-soil", amount = 1},
      {type = "item", name = "wood", amount = 1}
    },
    result = "tycoon-farmable-soil",
    result_count = 2
  },

  -- Standard recipe for farmable soil (more expensive)
  {
    type = "recipe",
    name = "tycoon-farmable-soil",
    energy_required = 2,
    enabled = false,  -- Unlocked by technology
    category = "crafting",
    ingredients = {
      {type = "item", name = "stone", amount = 2},
      {type = "item", name = "wood", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    result = "tycoon-farmable-soil",
    result_count = 5
  },

  {
    type = "recipe",
    name = "tycoon-enhanced-farmable-soil",
    energy_required = 5,
    enabled = false,  -- Unlocked by technology
    category = "crafting-with-fluid",
    ingredients = {
      {type = "item", name = "tycoon-farmable-soil", amount = 2},
      {type = "item", name = "coal", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    result = "tycoon-enhanced-farmable-soil",
    result_count = 2
  }
})
```

### 4. Technology

Create a technology to unlock the farmable soil:

```lua
data:extend({
  {
    type = "technology",
    name = "tycoon-agriculture",
    icon = "__tycoon__/graphics/technologies/agriculture.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "tycoon-farmable-soil-from-wetland"
      },
      {
        type = "unlock-recipe",
        recipe = "tycoon-farmable-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "tycoon-enhanced-farmable-soil"
      }
    },
    prerequisites = {"automation-2"},
    unit = {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    order = "c-a"
  }
})
```

### 5. Locale Entries

Add locale entries to locale/en/base.cfg.

## Implementation Phases

1. **Phase 1**: Create wetland tiles with autoplace generation on Nauvis
2. **Phase 2**: Create basic farmable soil items, entities, recipes, and technology

## Testing Strategy

Test the following aspects:
1. Wetland generation in new worlds
2. Wetland tile mining to obtain wetland soil
3. Soil placement and removal
4. Recipe crafting for all soil types
