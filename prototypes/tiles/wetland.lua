-- Wetland tile prototype

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
  
  -- Farmable soil tile
  {
    type = "tile",
    name = "tycoon-farmable-soil",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    layer = 60,
    decorative_removal_probability = 0.9,
    walking_speed_modifier = 0.95,
    pollution_absorption_per_second = 0.0001,
    map_color = {r = 120, g = 95, b = 65},
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
    layer = 60,
    decorative_removal_probability = 0.9,
    walking_speed_modifier = 0.95,
    pollution_absorption_per_second = 0.0001,
    map_color = {r = 80, g = 60, b = 40},
    minable = {mining_time = 0.5, result = "tycoon-enhanced-farmable-soil"},
    mined_sound = {filename = "__base__/sound/walking/dirt-02.ogg"},
    variants = {
      main = {
        {picture = "__factorio-tycoon-2__/graphics/terrain/enhanced-farmable-soil.png", count = 1, size = 1, scale = 1}
      }
    }
  }
})

-- Wetland Autoplace Generation
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