-- Animal items

data:extend({
  {
    type = "item",
    name = "tycoon-calf",
    icon = "__tycoon-2__/graphics/items/tycoon-calf.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "d[animals]-a[calf]",
    stack_size = 50,
    spoil_time = 36000, -- 10 minutes in ticks (60 ticks per second * 60 seconds * 10 minutes)
    spoil_result = "tycoon-cow"
  },
  {
    type = "item",
    name = "tycoon-cow",
    icon = "__tycoon-2__/graphics/items/tycoon-cow.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "d[animals]-a[cow]",
    stack_size = 50
  },
  {
    type = "item",
    name = "tycoon-chick",
    icon = "__tycoon-2__/graphics/items/tycoon-chick.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "d[animals]-b[chick]",
    stack_size = 50,
    spoil_time = 36000, -- 10 minutes in ticks (60 ticks per second * 60 seconds * 10 minutes)
    spoil_result = "tycoon-chicken"
  },
  {
    type = "item",
    name = "tycoon-chicken",
    icon = "__tycoon-2__/graphics/items/tycoon-chicken.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "d[animals]-b[chicken]",
    stack_size = 50
  }
})