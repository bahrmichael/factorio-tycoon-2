-- House items

data:extend({
  {
    type = "item",
    name = "tycoon-small-house",
    icon = "__tycoon-2__/graphics/items/small-house.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "a[house]-a[small]",
    place_result = "tycoon-small-house",
    stack_size = 50
  },
  {
    type = "item",
    name = "tycoon-medium-house",
    icon = "__tycoon-2__/graphics/items/medium-house.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "a[house]-b[medium]",
    place_result = "tycoon-medium-house",
    stack_size = 50
  },
  {
    type = "item",
    name = "tycoon-large-house",
    icon = "__tycoon-2__/graphics/items/large-house.png",
    icon_size = 64,
    subgroup = "production-machine",
    order = "a[house]-c[large]",
    place_result = "tycoon-large-house",
    stack_size = 50
  }
})