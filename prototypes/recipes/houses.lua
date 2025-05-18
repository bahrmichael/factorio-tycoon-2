-- House recipes

data:extend({
  {
    type = "recipe",
    name = "tycoon-small-house",
    enabled = true,
    ingredients = {
      {type = "item", name = "stone-brick", amount = 10},
      {type = "item", name = "wood", amount = 20}
    },
    results = {
      {type = "item", name = "tycoon-small-house", amount = 1}
    },
    energy_required = 5
  },
  {
    type = "recipe",
    name = "tycoon-medium-house",
    enabled = true,
    ingredients = {
      {type = "item", name = "stone-brick", amount = 20},
      {type = "item", name = "wood", amount = 40},
      {type = "item", name = "iron-plate", amount = 10}
    },
    results = {
      {type = "item", name = "tycoon-medium-house", amount = 1}
    },
    energy_required = 10
  },
  {
    type = "recipe",
    name = "tycoon-large-house",
    enabled = true,
    ingredients = {
      {type = "item", name = "stone-brick", amount = 40},
      {type = "item", name = "wood", amount = 60},
      {type = "item", name = "iron-plate", amount = 20},
      {type = "item", name = "copper-plate", amount = 10}
    },
    results = {
      {type = "item", name = "tycoon-large-house", amount = 1}
    },
    energy_required = 15
  }
})