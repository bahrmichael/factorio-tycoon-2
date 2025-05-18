-- Item prototypes

data:extend({
  -- Add items here
  {
    type = "item",
    name = "ladyfingers",
    icon = "__factorio-tycoon-2__/graphics/items/ladyfingers.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[ladyfingers]",
    stack_size = 100
  },
  {
    type = "item",
    name = "mascarpone",
    icon = "__factorio-tycoon-2__/graphics/items/mascarpone.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[mascarpone]",
    stack_size = 50
  },
  {
    type = "item",
    name = "coffee",
    icon = "__factorio-tycoon-2__/graphics/items/coffee.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[coffee]",
    stack_size = 50
  },
  {
    type = "item",
    name = "cocoa-powder",
    icon = "__factorio-tycoon-2__/graphics/items/cocoa-powder.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "a[cocoa-powder]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tiramisu",
    icon = "__factorio-tycoon-2__/graphics/items/tiramisu.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[tiramisu]",
    stack_size = 10,
    fuel_value = "12MJ",
    fuel_category = "chemical",
    burnt_result = nil,
    flags = {"hidden-from-fuel-tooltip"},
    -- Tiramisu spoils fast
    localised_description = {"item-description.tiramisu-spoils-fast"},
    -- In a real implementation, we'd add script logic to handle spoilage
  }
})