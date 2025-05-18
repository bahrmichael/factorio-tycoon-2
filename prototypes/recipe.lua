-- Recipe prototypes

data:extend({
  -- Add recipes here
  {
    type = "recipe",
    name = "tiramisu",
    category = "crafting",
    energy_required = 10,
    enabled = false,
    ingredients = {
      {"ladyfingers", 4},
      {"mascarpone", 2},
      {"coffee", 1},
      {"cocoa-powder", 1}
    },
    result = "tiramisu",
    result_count = 1
  },
  -- Base ingredients recipes would go here
  -- In a full implementation, we would add recipes for the ingredients too
})