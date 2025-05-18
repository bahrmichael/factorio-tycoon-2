data:extend({
  -- Wetland soil item (harvested from wetland tiles)
  {
    type = "item",
    name = "tycoon-wetland-soil",
    icon = "__factorio-tycoon-2__/graphics/items/wetland-soil.png",
    icon_size = 64,
    stack_size = 50,
    subgroup = "terrain",
    order = "a[terrain]-a[wetland-soil]"
  },

  -- Basic farmable soil item
  {
    type = "item",
    name = "tycoon-farmable-soil",
    icon = "__factorio-tycoon-2__/graphics/items/farmable-soil.png",
    icon_size = 64,
    stack_size = 50,
    place_as_tile = {
      result = "tycoon-farmable-soil",
      condition_size = 1,
      condition = {"ground-tile"}
    },
    flags = {"hidden-from-flow-stats"},
    subgroup = "terrain",
    order = "a[terrain]-b[farmable-soil]"
  },

  -- Enhanced farmable soil (better fertility)
  {
    type = "item",
    name = "tycoon-enhanced-farmable-soil",
    icon = "__factorio-tycoon-2__/graphics/items/enhanced-farmable-soil.png",
    icon_size = 64,
    stack_size = 50,
    place_as_tile = {
      result = "tycoon-enhanced-farmable-soil",
      condition_size = 1,
      condition = {"ground-tile"}
    },
    flags = {"hidden-from-flow-stats"},
    subgroup = "terrain",
    order = "a[terrain]-c[enhanced-farmable-soil]"
  }
})