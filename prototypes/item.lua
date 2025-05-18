-- Item prototypes

data:extend({
  -- Add items here
  {
    type = "item",
    name = "tycoon-worker",
    icon = "__factorio-tycoon-2__/graphics/items/worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[worker]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"},
    localised_name = {"item-name.tycoon-worker"},
    localised_description = {"item-description.tycoon-worker"},
    fuel_value = nil,
    fuel_category = nil,
    burnt_result = nil,
    place_result = nil,
    placed_as_equipment_result = nil,
    allow_decomposition = true,
    fuel_acceleration_multiplier = 1,
    fuel_top_speed_multiplier = 1,
    pictures = nil
  },
  {
    type = "item",
    name = "tycoon-tired-worker",
    icon = "__factorio-tycoon-2__/graphics/items/tired-worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[worker]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"},
    localised_name = {"item-name.tycoon-tired-worker"},
    localised_description = {"item-description.tycoon-tired-worker"},
    fuel_value = nil,
    fuel_category = nil,
    burnt_result = nil,
    place_result = nil,
    placed_as_equipment_result = nil,
    allow_decomposition = true,
    fuel_acceleration_multiplier = 1,
    fuel_top_speed_multiplier = 1,
    pictures = nil
  }
})