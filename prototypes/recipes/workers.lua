-- Workers recipe prototypes

data:extend({
  {
    type = "recipe",
    name = "refresh-worker",
    category = "house-crafting", -- Only craftable in houses
    energy_required = 10,
    enabled = true,
    ingredients = {
      {"tired-worker", 1}
    },
    result = "worker",
    result_count = 1
  }
})