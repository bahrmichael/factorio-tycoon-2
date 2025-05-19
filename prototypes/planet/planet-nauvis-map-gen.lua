data:extend{
  -- Function to help with selecting ranges of values
  {
    type = "noise-function",
    name = "nauvis_select",
    parameters = {"input", "from", "to", "slope", "min", "max"},
    expression = "clamp(min(input - (from - slope), to + slope - input) / slope, min, max)"
  },

  -- Noise expression to create wobble for variation
  {
    type = "noise-expression",
    name = "nauvis_wobble_x",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000, octaves = 3, input_scale = 1/20}"
  },

  {
    type = "noise-expression",
    name = "nauvis_wobble_y",
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 3000, octaves = 3, input_scale = 1/20}"
  },

  -- Noise expression to define fertile spot areas
  {
    type = "noise-expression",
    name = "nauvis_fertile_spots",
    expression = "spot_noise{ x = x + wobble_noise_x * 15,\z
                              y = y + wobble_noise_y * 15,\z
                              seed0 = map_seed,\z
                              seed1 = 1,\z
                              candidate_spot_count = 80,\z
                              suggested_minimum_candidate_point_spacing = 128,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 1024,\z
                              density_expression = 80,\z
                              spot_quantity_expression = 1000,\z
                              spot_radius_expression = 32,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = 60,\z
                              basement_value = -0.5,\z
                              maximum_spot_basement_radius = 128}",
    local_expressions =
    {
      wobble_noise_x = "multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 3000000, octaves = 2, input_scale = 1/20}",
      wobble_noise_y = "multioctave_noise{x = x, y = y, persistence = 0.5, seed0 = map_seed, seed1 = 4000000, octaves = 2, input_scale = 1/20}"
    }
  },

  -- Create coastal spots
  {
    type = "noise-expression",
    name = "nauvis_fertile_spots_coastal",
    expression = "max(min(1, nauvis_starting_fertile * 4),\z
                      min(exclude_middle, nauvis_fertile_spots) - max(0, (distance_to_water - 10) / 5))",
    local_expressions =
    {
      exclude_middle = "(distance / nauvis_starting_area_multiplier / 150) - 2.2",
      distance_to_water = "2 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 5000000, octaves = 3, input_scale = 1/60})"
    }
  },

  -- Temperature noise used to influence biome mask boundaries
  {
    type = "noise-expression",
    name = "nauvis_temperature",
    expression = "clamp(0.8 * multioctave_noise{x = x + nauvis_wobble_x * 6, y = y + nauvis_wobble_y * 6, persistence = 0.65, octaves = 4, input_scale = 1/4, seed0 = map_seed, seed1 = 18000}, -1, 1)"
  },

  -- Starting area multiplier
  {
    type = "noise-expression",
    name = "nauvis_starting_area_multiplier",
    expression = "1.0"
  },

  -- Define fertile areas based on spots and texture
  {
    type = "noise-expression",
    name = "nauvis_fertile_solid",
    expression = "2 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000000, octaves = 2, input_scale = 1/16})\z
                  * nauvis_fertile_spots_coastal"
  },

  -- Starting area fertile spots
  {
    type = "noise-expression",
    name = "nauvis_starting_fertile",
    expression = "max(starting_soil_a, starting_soil_b)",
    local_expressions =
    {
      starting_soil_a = "starting_spot_at_angle{angle = nauvis_starting_angle + 235,\z
                                                 distance = 310 * nauvis_starting_area_multiplier,\z
                                                 radius = 40 * nauvis_starting_area_multiplier,\z
                                                 x_distortion = nauvis_wobble_x * 15,\z
                                                 y_distortion = nauvis_wobble_x * 15}",
      starting_soil_b = "starting_spot_at_angle{angle = nauvis_starting_angle + 65,\z
                                                distance = 310 * nauvis_starting_area_multiplier,\z
                                                radius = 40 * nauvis_starting_area_multiplier,\z
                                                x_distortion = nauvis_wobble_x * 15,\z
                                                y_distortion = nauvis_wobble_x * 15}",
    }
  },

  -- Define starting angle
  {
    type = "noise-expression",
    name = "nauvis_starting_angle",
    expression = "map_seed_normalized * 3600"
  },

  -- Define biome masks to separate different soil types based on temperature
  {
    type = "noise-expression",
    name = "nauvis_biome_mask_a",
    expression = "nauvis_temperature > 0.3"
  },

  {
    type = "noise-expression",
    name = "nauvis_biome_mask_b",
    expression = "nauvis_temperature < 0.7"
  }
}