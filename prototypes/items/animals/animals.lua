-- Animals items

data:extend({
  {
    type = "item",
    name = "calf",
    icon = "__tycoon-2__/graphics/items/animals/calf.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[calf]",
    stack_size = 10,
    flags = {"not-stackable"},
    -- Spoilage properties
    -- In Factorio 2.0, items that can transform use these properties
    spoil_time = 36000, -- 10 minutes (60 ticks/second * 60 seconds * 10 minutes)
    spoil_product = "cow"
  },
  {
    type = "item",
    name = "cow",
    icon = "__tycoon-2__/graphics/items/animals/cow.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "c[cow]",
    stack_size = 10,
    flags = {"not-stackable"}
  }
})