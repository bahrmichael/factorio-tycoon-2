data:extend({
  {
    type = "item",
    name = "tycoon-artificial-nauvis-soil-a",
    icon = "__tycoon-2__/graphics/items/artificial-nauvis-soil-a.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "terrain",
    order = "c[landfill]-b[artificial-nauvis-soil-a]",
    stack_size = 100,
    place_as_tile =
    {
      result = "tycoon-artificial-nauvis-soil-a",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "tycoon-artificial-nauvis-soil-b",
    icon = "__tycoon-2__/graphics/items/artificial-nauvis-soil-b.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "terrain",
    order = "c[landfill]-c[artificial-nauvis-soil-b]",
    stack_size = 100,
    place_as_tile =
    {
      result = "tycoon-artificial-nauvis-soil-b",
      condition_size = 1,
      condition = { "water-tile" }
    }
  },
  {
    type = "item",
    name = "tycoon-wheat-seed",
    icon = "__tycoon-2__/graphics/items/wheat-seed.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "seed",
    order = "a[wheat-seed]",
    stack_size = 100,
    place_result = "tycoon-wheat-plant"
  }
})