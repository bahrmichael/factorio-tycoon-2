-- House entity (for worker refreshing)

data:extend({
  {
    type = "assembling-machine",
    name = "house",
    icon = "__factorio-tycoon-2__/graphics/entities/house.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "house"},
    max_health = 200,
    corpse = "small-remnants",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    crafting_categories = {"house-crafting"},
    crafting_speed = 1.0,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 0
    },
    energy_usage = "50kW",
    animation = {
      filename = "__factorio-tycoon-2__/graphics/entities/house.png",
      width = 32,
      height = 32,
      frame_count = 1,
      shift = {0, 0}
    },
    working_sound = {
      sound = {
        filename = "__base__/sound/assembling-machine-t1-1.ogg",
        volume = 0.5
      },
      apparent_volume = 0.5
    },
  }
})