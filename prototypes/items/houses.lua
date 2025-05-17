-- House items

data:extend({
  {
    type = "item",
    name = "small-house",
    icon = "__tycoon-2__/graphics/items/small-house.png",
    icon_size = 64,
    subgroup = "production",
    order = "a[house]-a[small]",
    place_result = "small-house",
    stack_size = 50
  },
  {
    type = "item",
    name = "medium-house",
    icon = "__tycoon-2__/graphics/items/medium-house.png",
    icon_size = 64,
    subgroup = "production",
    order = "a[house]-b[medium]",
    place_result = "medium-house",
    stack_size = 50
  },
  {
    type = "item",
    name = "large-house",
    icon = "__tycoon-2__/graphics/items/large-house.png",
    icon_size = 64,
    subgroup = "production",
    order = "a[house]-c[large]",
    place_result = "large-house",
    stack_size = 50
  }
})