-- Food items

data:extend({
  {
    type = "item",
    name = "wheat",
    icon = "__tycoon-2__/graphics/items/wheat.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[wheat]",
    stack_size = 100
  },
  {
    type = "item",
    name = "grain",
    icon = "__tycoon-2__/graphics/items/grain.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[grain]",
    stack_size = 100
  },
  {
    type = "item",
    name = "flour",
    icon = "__tycoon-2__/graphics/items/flour.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[flour]",
    stack_size = 100
  },
  {
    type = "fluid",
    name = "milk",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2KJ",
    base_color = {r=0.9, g=0.9, b=0.9},
    flow_color = {r=0.9, g=0.9, b=1.0},
    icon = "__tycoon-2__/graphics/items/milk.png",
    icon_size = 64,
    order = "a[fluid]-b[milk]"
  },
  {
    type = "item",
    name = "dough",
    icon = "__tycoon-2__/graphics/items/dough.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[dough]",
    stack_size = 100
  },
  {
    type = "item",
    name = "bread",
    icon = "__tycoon-2__/graphics/items/bread.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[bread]",
    stack_size = 100,
    fuel_value = "2MJ",
    fuel_category = "chemical"
  }
  },
  -- Tiramisu ingredients
  {
    type = "item",
    name = "tiramisu",
    icon = "__tycoon-2__/graphics/items/tiramisu.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[tiramisu]",
    stack_size = 50,
    fuel_value = "3MJ",
    fuel_category = "chemical"
  },
  {
    type = "item",
    name = "mascarpone",
    icon = "__tycoon-2__/graphics/items/mascarpone.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[mascarpone]",
    stack_size = 100
  },
  {
    type = "item",
    name = "coffee",
    icon = "__tycoon-2__/graphics/items/coffee.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[coffee]",
    stack_size = 100
  },
  {
    type = "item",
    name = "coffee-beans",
    icon = "__tycoon-2__/graphics/items/coffee-beans.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "c[coffee-beans]",
    stack_size = 100
  },
  {
    type = "item",
    name = "cocoa-powder",
    icon = "__tycoon-2__/graphics/items/cocoa-powder.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[cocoa-powder]",
    stack_size = 100
  },
  {
    type = "item",
    name = "cocoa-beans",
    icon = "__tycoon-2__/graphics/items/cocoa-beans.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "c[cocoa-beans]",
    stack_size = 100
  },
  {
    type = "item",
    name = "eggs",
    icon = "__tycoon-2__/graphics/items/eggs.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "c[eggs]",
    stack_size = 100
  },
  {
    type = "item",
    name = "sugar",
    icon = "__tycoon-2__/graphics/items/sugar.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[sugar]",
    stack_size = 100
  },
  {
    type = "item",
    name = "sugarcane",
    icon = "__tycoon-2__/graphics/items/sugarcane.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "c[sugarcane]",
    stack_size = 100
  },
  {
    type = "item",
    name = "ladyfingers",
    icon = "__tycoon-2__/graphics/items/ladyfingers.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[ladyfingers]",
    stack_size = 100
  }
})