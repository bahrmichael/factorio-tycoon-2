-- Recipe prototypes

data:extend({
  -- Add recipes here
  {
    type = "recipe-category",
    name = "house-crafting"
  },
  {
    type = "recipe",
    name = "refresh-worker",
    category = "house-crafting",
    energy_required = 10,
    ingredients = {{"tired-worker", 1}},
    result = "worker",
    result_count = 1
  },
  {
    type = "recipe",
    name = "house",
    enabled = true,
    ingredients = {
      {"iron-plate", 5},
      {"copper-plate", 5},
      {"stone-brick", 10}
    },
    result = "house",
    result_count = 1
  }
})