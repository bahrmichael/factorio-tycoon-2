local util = require("__factorio-tycoon-2__/utilities/util")

data:extend({
  {
    type = "item",
    name = "worker",
    icon = "__factorio-tycoon-2__/graphics/items/worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[worker]",
    stack_size = 50,
    fuel_category = nil,
    fuel_value = nil,
    burnt_result = nil,
    place_result = nil,
    flags = {},
    localised_name = {"item-name.worker"},
    localised_description = {"item-description.worker"},
    -- Spoil after 1 hour (3600 seconds / 60 ticks per second)
    fuel_emissions_multiplier = 1,
    fuel_acceleration_multiplier = 1,
    fuel_top_speed_multiplier = 1,
    durability = 216000, -- 1 hour
    durability_description_key = "description.durability",
    durability_description_value = "1 hour",
    "dummy_field", -- FACTORIO-370 won't let me leave an empty LuaObject
  },
  {
    type = "item",
    name = "tired-worker",
    icon = "__factorio-tycoon-2__/graphics/items/tired-worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[worker]-b[tired]",
    stack_size = 50,
    flags = {},
    localised_name = {"item-name.tired-worker"},
    localised_description = {"item-description.tired-worker"},
  }
})

-- Set up worker to spoil into tired worker
data.raw["item"]["worker"].burnt_result = "tired-worker"