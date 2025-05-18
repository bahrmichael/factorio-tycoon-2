-- Terrain entities for Tycoon mod

data:extend({
  -- Wetland tile
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
  },
  
  -- Farmable soil tile
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
        {picture = "__factorio-tycoon-2__/graphics/terrain/farmable-soil.png", count = 1, size = 1, scale = 1}
      }
    }
  },
  
  -- Enhanced farmable soil tile
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
        {picture = "__factorio-tycoon-2__/graphics/terrain/enhanced-farmable-soil.png", count = 1, size = 1, scale = 1}
      }
    }
  }
})

-- Define wetland autoplace generation
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