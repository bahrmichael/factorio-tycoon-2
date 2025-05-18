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

## Farmable Soil Implementation for Nauvis

### 1. Item Prototypes

Create the following items:

```lua
-- Basic farmable soil item
data:extend({
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

### 5. Crop Growth System

Implement a basic crop growing system:

1. Create crop items (seeds, growing crops, harvested crops)
2. Create crop entities that have different stages of growth
3. Use control.lua to handle crop growth based on time
4. Ensure crops can only be planted on farmable soil tiles

### 6. Images and Graphics

Create placeholder images using the utility:

```
placeholder-image 64 64 "Farmable Soil" graphics/items/farmable-soil.png
placeholder-image 64 64 "Enhanced Soil" graphics/items/enhanced-farmable-soil.png
placeholder-image 256 256 "Agriculture" graphics/technologies/agriculture.png
```

### 7. Locale Entries

Add locale entries to locale/en/base.cfg:

```
[item-name]
tycoon-farmable-soil=Farmable Soil
tycoon-enhanced-farmable-soil=Enhanced Farmable Soil

[entity-name]
tycoon-farmable-soil=Farmable Soil
tycoon-enhanced-farmable-soil=Enhanced Farmable Soil

[recipe-name]
tycoon-farmable-soil=Farmable Soil
tycoon-enhanced-farmable-soil=Enhanced Farmable Soil

[technology-name]
tycoon-agriculture=Agriculture

[technology-description]
tycoon-agriculture=Allows the creation of farmable soil to grow crops on Nauvis.
```

## Implementation Phases

1. **Phase 1**: Create basic farmable soil items, entities, recipes, and technology
2. **Phase 2**: Implement graphics and visuals
3. **Phase 3**: Develop the crop growth system
4. **Phase 4**: Add advanced farming features (fertilizers, irrigation)
5. **Phase 5**: Balancing and optimization

## Testing Strategy

Test the following aspects:
1. Soil placement and removal
2. Recipe crafting for both soil types
3. Technology research progression
4. Crop planting and harvesting on different soil types
5. Growth rates and yields

## Future Extensions

1. Add special crop types that only grow on enhanced soil
2. Implement irrigation systems to improve crop growth
3. Create specialized farming machines
4. Add seasonal effects on crop growth
5. Implement a composting system for organic waste