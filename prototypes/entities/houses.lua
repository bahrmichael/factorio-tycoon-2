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
        name = "tycoon-small-house",
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        crafting_categories = { "house-crafting" },
        crafting_speed = 0.5,
        energy_usage = "50kW",
        icon = "__tycoon-2__/graphics/items/small-house.png",
        icon_size = 64,
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.5, result = "tycoon-small-house" },
        max_health = 200,
        corpse = "small-remnants",
        collision_box = { { -1, -1 }, { 1, 1 } },
        selection_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
        picture = {
            filename = "__tycoon-2__/graphics/entities/small-house.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            shift = { 0, 0 }
        }
    },
    {
        type = "assembling-machine",
        name = "tycoon-medium-house",
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        crafting_categories = { "house-crafting" },
        crafting_speed = 0.75,
        energy_usage = "75kW",
        icon = "__tycoon-2__/graphics/items/medium-house.png",
        icon_size = 64,
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.8, result = "tycoon-medium-house" },
        max_health = 350,
        corpse = "medium-remnants",
        collision_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        selection_box = { { -1.7, -1.7 }, { 1.7, 1.7 } },
        picture = {
            filename = "__tycoon-2__/graphics/entities/medium-house.png",
            priority = "extra-high",
            width = 192,
            height = 192,
            shift = { 0, 0 }
        }
    },
    {
        type = "assembling-machine",
        name = "tycoon-large-house",
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        crafting_categories = { "house-crafting" },
        crafting_speed = 1.0,
        energy_usage = "100kW",
        icon = "__tycoon-2__/graphics/items/large-house.png",
        icon_size = 64,
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 1.0, result = "tycoon-large-house" },
        max_health = 500,
        corpse = "big-remnants",
        collision_box = { { -2, -2 }, { 2, 2 } },
        selection_box = { { -2.2, -2.2 }, { 2.2, 2.2 } },
        picture = {
            filename = "__tycoon-2__/graphics/entities/large-house.png",
            priority = "extra-high",
            width = 256,
            height = 256,
            shift = { 0, 0 }
        }
    }
})
