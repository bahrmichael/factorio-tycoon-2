-- Recipe prototypes

data:extend({
  -- Add recipes here
  {
    type = "recipe",
    name = "tycoon-refresh-worker",
    category = "crafting-in-house",
    energy_required = 5,
    enabled = true,
    ingredients = {
      {"tycoon-tired-worker", 1}
    },
    result = "tycoon-worker",
    result_count = 1
  }
})