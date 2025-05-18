local tiles = {}

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
  },
  {
    type = "tile",
    name = "tycoon-farmable-soil",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    layer = 61,
    decorative_removal_probability = 0.9,
    walking_speed_modifier = 1.0,
    pollution_absorption_per_second = 0.0001,
    map_color = {r = 120, g = 85, b = 40},
    minable = {mining_time = 0.5, result = "tycoon-farmable-soil"},
    mined_sound = {filename = "__base__/sound/walking/dirt-02.ogg"},
    variants = {
      main = {
        {picture = "__factorio-tycoon-2__/graphics/terrain/farmable-soil.png", count = 1, size = 1, scale = 1}
      }
    }
  },
  {
    type = "tile",
    name = "tycoon-enhanced-farmable-soil",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    layer = 62,
    decorative_removal_probability = 0.9,
    walking_speed_modifier = 1.0,
    pollution_absorption_per_second = 0.0001,
    map_color = {r = 90, g = 65, b = 25},
    minable = {mining_time = 0.5, result = "tycoon-enhanced-farmable-soil"},
    mined_sound = {filename = "__base__/sound/walking/dirt-02.ogg"},
    variants = {
      main = {
        {picture = "__factorio-tycoon-2__/graphics/terrain/enhanced-farmable-soil.png", count = 1, size = 1, scale = 1}
      }
    }
  }
})

return tiles