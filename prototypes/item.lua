-- Item prototypes

data:extend({
  -- Add items here
  {
    type = "item",
    name = "worker",
    icon = "__factorio-tycoon-2__/graphics/items/worker.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "a[worker]",
    stack_size = 50,
    fuel_category = "chemical",
    fuel_value = "4MJ",
    burnt_result = "tired-worker",
    fuel_emissions_multiplier = 0.0,
    fuel_acceleration_multiplier = 1.0,
    fuel_top_speed_multiplier = 1.0,
  },
  {
    type = "item",
    name = "tired-worker",
    icon = "__factorio-tycoon-2__/graphics/items/tired-worker.png",
    icon_size = 32,
    subgroup = "raw-material",
    order = "a[worker]",
    stack_size = 50
  },
  {
    type = "item",
    name = "house",
    icon = "__factorio-tycoon-2__/graphics/items/house.png",
    icon_size = 32,
    subgroup = "production-machine",
    order = "a[house]",
    place_result = "house",
    stack_size = 50
  }
})