-- Food items

data:extend({
  {
    type = "item",
    name = "tycoon-wheat",
    icon = "__tycoon-2__/graphics/items/wheat.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[wheat]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-grain",
    icon = "__tycoon-2__/graphics/items/grain.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[grain]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-flour",
    icon = "__tycoon-2__/graphics/items/flour.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[flour]",
    stack_size = 100
  },
  {
    type = "fluid",
    name = "tycoon-milk",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {r=0.9, g=0.9, b=0.9},
    flow_color = {r=0.9, g=0.9, b=1.0},
    icon = "__tycoon-2__/graphics/items/milk.png",
    icon_size = 64,
    order = "a[fluid]-b[milk]"
  },
  {
    type = "item",
    name = "tycoon-dough",
    icon = "__tycoon-2__/graphics/items/dough.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[dough]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-bread",
    icon = "__tycoon-2__/graphics/items/bread.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[bread]",
    stack_size = 100,
    fuel_value = "2MJ",
    fuel_category = "chemical"
  }
},
  {
    type = "item",
    name = "tycoon-mascarpone",
    icon = "__tycoon-2__/graphics/items/tycoon-mascarpone.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[mascarpone]",
    stack_size = 50
  },
  {
    type = "item",
    name = "tycoon-coffee",
    icon = "__tycoon-2__/graphics/items/tycoon-coffee.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[coffee]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-cocoa-powder",
    icon = "__tycoon-2__/graphics/items/tycoon-cocoa-powder.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[cocoa-powder]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-ladyfingers",
    icon = "__tycoon-2__/graphics/items/tycoon-ladyfingers.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[ladyfingers]",
    stack_size = 50
  },
  {
    type = "item",
    name = "tycoon-sugar",
    icon = "__tycoon-2__/graphics/items/tycoon-sugar.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[sugar]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-coffee-beans",
    icon = "__tycoon-2__/graphics/items/tycoon-coffee-beans.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[coffee-beans]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-cocoa-beans",
    icon = "__tycoon-2__/graphics/items/tycoon-cocoa-beans.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[cocoa-beans]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-sugar-cane",
    icon = "__tycoon-2__/graphics/items/tycoon-sugar-cane.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[sugar-cane]",
    stack_size = 100
  },
  {
    type = "item",
    name = "tycoon-eggs",
    icon = "__tycoon-2__/graphics/items/tycoon-eggs.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "b[eggs]",
    stack_size = 50
  },
  {
    type = "item",
    name = "tycoon-tiramisu",
    icon = "__tycoon-2__/graphics/items/tycoon-tiramisu.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "d[tiramisu]",
    stack_size = 20,
    fuel_value = "4MJ",
    fuel_category = "chemical"
  }
})