-- Workers item prototypes

data:extend({
  {
    type = "item",
    name = "worker",
    icon = "__factorio-tycoon-2__/graphics/items/worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[worker]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"},
    -- Spoil after 1 hour (3600 ticks)
    fuel_value = "0J",
    fuel_category = "chemical",
    burnt_result = "tired-worker",
    fuel_emissions_multiplier = 0,
    fuel_acceleration_multiplier = 1,
    fuel_top_speed_multiplier = 1,
    fuel_glow_color = {0, 0, 0}
  },
  {
    type = "item",
    name = "tired-worker",
    icon = "__factorio-tycoon-2__/graphics/items/tired-worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[worker]-b",
    stack_size = 50,
    flags = {"goes-to-main-inventory"}
  }
})