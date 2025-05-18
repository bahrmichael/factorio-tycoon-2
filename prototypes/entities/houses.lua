-- House entities

-- Define a new category for house crafting
data:extend({
  {
    type = "recipe-category",
    name = "house-crafting"
  }
})

data:extend({
  {
    type = "assembling-machine",
    name = "small-house",
    crafting_categories = {"crafting", "house-crafting"},
    crafting_speed = 0.5,
    icon = "__tycoon-2__/graphics/items/small-house.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "small-house"},
    max_health = 200,
    corpse = "small-remnants",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1.2, -1.2}, {1.2, 1.2}},
    inventory_size = 20,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.5 },
    picture = {
      filename = "__tycoon-2__/graphics/entities/small-house.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      shift = {0, 0}
    }
  },
  {
    type = "assembling-machine",
    name = "medium-house",
    crafting_categories = {"crafting", "house-crafting"},
    crafting_speed = 0.75,
    icon = "__tycoon-2__/graphics/items/medium-house.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.8, result = "medium-house"},
    max_health = 350,
    corpse = "medium-remnants",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_box = {{-1.7, -1.7}, {1.7, 1.7}},
    inventory_size = 40,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.5 },
    picture = {
      filename = "__tycoon-2__/graphics/entities/medium-house.png",
      priority = "extra-high",
      width = 192,
      height = 192,
      shift = {0, 0}
    }
  },
  {
    type = "assembling-machine",
    name = "large-house",
    crafting_categories = {"crafting", "house-crafting"},
    crafting_speed = 1.0,
    icon = "__tycoon-2__/graphics/items/large-house.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1.0, result = "large-house"},
    max_health = 500,
    corpse = "big-remnants",
    collision_box = {{-2, -2}, {2, 2}},
    selection_box = {{-2.2, -2.2}, {2.2, 2.2}},
    inventory_size = 60,
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.5 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.5 },
    picture = {
      filename = "__tycoon-2__/graphics/entities/large-house.png",
      priority = "extra-high",
      width = 256,
      height = 256,
      shift = {0, 0}
    }
  }
})