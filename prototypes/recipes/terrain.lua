-- Terrain recipes for Tycoon mod

data:extend({
  -- Recipe for farmable soil from wetland soil (easier/cheaper)
  {
    type = "recipe",
    name = "tycoon-farmable-soil-from-wetland",
    energy_required = 1,
    enabled = false,  -- Unlocked by technology
    category = "crafting",
    ingredients = {
      {type = "item", name = "tycoon-wetland-soil", amount = 1},
      {type = "item", name = "wood", amount = 1}
    },
    result = "tycoon-farmable-soil",
    result_count = 2
  },

  -- Standard recipe for farmable soil (more expensive)
  {
    type = "recipe",
    name = "tycoon-farmable-soil",
    energy_required = 2,
    enabled = false,  -- Unlocked by technology
    category = "crafting",
    ingredients = {
      {type = "item", name = "stone", amount = 2},
      {type = "item", name = "wood", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    result = "tycoon-farmable-soil",
    result_count = 5
  },

  -- Recipe for enhanced farmable soil
  {
    type = "recipe",
    name = "tycoon-enhanced-farmable-soil",
    energy_required = 5,
    enabled = false,  -- Unlocked by technology
    category = "crafting-with-fluid",
    ingredients = {
      {type = "item", name = "tycoon-farmable-soil", amount = 2},
      {type = "item", name = "coal", amount = 1},
      {type = "fluid", name = "water", amount = 100}
    },
    result = "tycoon-enhanced-farmable-soil",
    result_count = 2
  }
})