# Farmable Soil Implementation Plan for Nauvis

## Overview

Factorio 2.0 introduced soil mechanics on planet Gleba that allow for farming and agriculture. Our objective is to implement a similar "Farmable Soil" system for Nauvis (the default planet) to enable agriculture without needing to travel to Gleba. This document outlines the implementation plan.

## Implementation Challenges and Learnings

1. **Noise Generation**: The `noise` table is a global variable provided by Factorio, not a module to require. Use declarative noise expressions rather than functional style for map generation.

2. **Recipe Format**: Always use the `results` array format instead of `result/result_count` for compatibility with other mods (especially Quality mod):
   ```lua
   results = {
     {type = "item", name = "tycoon-farmable-soil", amount = 2}
   }
   ```

3. **Tile Placement**: The `place_as_tile` property requires careful configuration. The `condition` property must follow specific format requirements.

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
        {picture = "__factorio-tycoon-2__/graphics/terrain/wetland.png", count = 1, size = 1, scale = 1}
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
  probability_expression = {
    type = "multiply",
    arguments = {
      { type = "constant", value = 0.4 },
      {
        type = "function-application",
        function_name = "clamp",
        arguments = {
          {
            type = "add",
            arguments = {
              {
                type = "function-application",
                function_name = "distance-from",
                arguments = {{ type = "literal-string", value = "water" }}
              },
              { type = "constant", value = -0.3 }
            }
          },
          { type = "constant", value = 0 },
          { type = "constant", value = 1 }
        }
      }
    }
  },
  richness_expression = { type = "constant", value = 1 }
}
```

## Farmable Soil Implementation for Nauvis

### 1. Item Prototypes

Create the following items:

```lua
data:extend({
  -- Wetland soil item (harvested from wetland tiles)
  {
    type = "item",
    name = "tycoon-wetland-soil",
    icon = "__factorio-tycoon-2__/graphics/items/wetland-soil.png",
    icon_size = 64,
    stack_size = 50,
    subgroup = "terrain",
    order = "a[terrain]-a[wetland-soil]"
  },

  -- Basic farmable soil item
  {
    type = "item",
    name = "tycoon-farmable-soil",
    icon = "__factorio-tycoon-2__/graphics/items/farmable-soil.png",
    icon_size = 64,
    stack_size = 50,
    place_as_tile = {
      result = "tycoon-farmable-soil",
      condition_size = 1
    },
    flags = {"hidden-from-flow-stats"},
    subgroup = "terrain",
    order = "a[terrain]-b[farmable-soil]"
  },

  -- Enhanced farmable soil (better fertility)
  {
    type = "item",
    name = "tycoon-enhanced-farmable-soil",
    icon = "__factorio-tycoon-2__/graphics/items/enhanced-farmable-soil.png",
    icon_size = 64,
    stack_size = 50,
    place_as_tile = {
      result = "tycoon-enhanced-farmable-soil",
      condition_size = 1
    },
    flags = {"hidden-from-flow-stats"},
    subgroup = "terrain",
    order = "a[terrain]-c[enhanced-farmable-soil]"
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
    results = {
      {type = "item", name = "tycoon-farmable-soil", amount = 2}
    }
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
    results = {
      {type = "item", name = "tycoon-farmable-soil", amount = 5}
    }
  },

  -- Recipe for enhanced farmable soil
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
    results = {
      {type = "item", name = "tycoon-enhanced-farmable-soil", amount = 2}
    }
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
    icon = "__factorio-tycoon-2__/graphics/technologies/agriculture.png",
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

## Implementation Phases

1. **Phase 1**: Create wetland tiles with autoplace generation on Nauvis
   - Ensure noise generation works properly using declarative syntax
   - Test wetland generation in new game worlds

2. **Phase 2**: Create basic farmable soil items, entities, recipes, and technology
   - Implement all items with proper place_as_tile mechanics
   - Ensure recipes follow the results array format for compatibility

## Testing Strategy

A human engineer will have to do this.

Test the following aspects:
1. Wetland generation in new worlds - verify patches appear near water and in low areas
2. Wetland tile mining to obtain wetland soil
3. Soil placement and removal - especially on different tile types
4. Recipe crafting for all soil types
5. Technology research unlocking appropriate recipes
