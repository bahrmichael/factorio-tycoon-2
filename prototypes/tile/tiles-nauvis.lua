local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")

-- Set a tile offset for Nauvis farmable tiles
local nauvis_farmable_tile_offset = 25

data:extend({
  -- Natural Soil A - Appears in warmer regions
  {
    type = "tile",
    name = "tycoon-natural-nauvis-soil-a",
    order = "d[nauvis]-c[natural-soil-a]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "nauvis_fertile_solid * 50000 - 40000 - nauvis_biome_mask_a * 1000000"},
    layer_group = "ground-natural",
    layer = nauvis_farmable_tile_offset + 1,
    searchable = true,

    transitions = data.raw["tile"]["grass-1"].transitions,
    transitions_between_transitions = data.raw["tile"]["grass-1"].transitions_between_transitions,
    walking_sound = base_sounds.dirt,
    map_color={121, 90, 38},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000}
  },

  -- Natural Soil B - Appears in cooler regions
  {
    type = "tile",
    name = "tycoon-natural-nauvis-soil-b",
    order = "e[nauvis]-b[natural-soil-b]",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "nauvis_fertile_solid * 50000 - 40000 - nauvis_biome_mask_b * 1000000"},
    layer_group = "ground-natural",
    layer = nauvis_farmable_tile_offset + 2,
    searchable = true,

    transitions = data.raw["tile"]["grass-1"].transitions,
    transitions_between_transitions = data.raw["tile"]["grass-1"].transitions_between_transitions,
    walking_sound = base_sounds.dirt,
    map_color={90, 121, 38},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000}
  },

  -- Artificial Soil A - Can be crafted and placed
  {
    type = "tile",
    name = "tycoon-artificial-nauvis-soil-a",
    order = "d[nauvis]-d[artificial-soil-a]",
    minable = {mining_time = 0.5, result = "tycoon-artificial-nauvis-soil-a"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = nauvis_farmable_tile_offset + 3,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    walking_sound = base_sounds.dirt,
    map_color={135, 100, 43},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000}
  },

  -- Artificial Soil B - Can be crafted and placed
  {
    type = "tile",
    name = "tycoon-artificial-nauvis-soil-b",
    order = "e[nauvis]-c[artificial-soil-b]",
    minable = {mining_time = 0.5, result = "tycoon-artificial-nauvis-soil-b"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = nauvis_farmable_tile_offset + 4,
    searchable = true,

    transitions = data.raw["tile"]["landfill"].transitions,
    transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
    walking_sound = base_sounds.dirt,
    map_color={100, 135, 43},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000}
  },
})