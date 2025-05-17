-- House recipes

data:extend({
  {
    type = "recipe",
    name = "small-house",
    enabled = true,
    ingredients = {
      {"stone-brick", 10},
      {"wood", 20}
    },
    result = "small-house",
    energy_required = 5
  },
  {
    type = "recipe",
    name = "medium-house",
    enabled = true,
    ingredients = {
      {"stone-brick", 20},
      {"wood", 40},
      {"iron-plate", 10}
    },
    result = "medium-house",
    energy_required = 10
  },
  {
    type = "recipe",
    name = "large-house",
    enabled = true,
    ingredients = {
      {"stone-brick", 40},
      {"wood", 60},
      {"iron-plate", 20},
      {"copper-plate", 10}
    },
    result = "large-house",
    energy_required = 15
  }
})