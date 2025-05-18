-- Worker-related recipes

data:extend({
  {
    type = "recipe",
    name = "refresh-worker",
    category = "crafting", -- Default category
    energy_required = 5,
    ingredients = {
      {"tycoon-tired-worker", 1},
      {"bread", 1}
    },
    result = "tycoon-worker",
    result_count = 1,
    enabled = true,
    -- This recipe can only be crafted in houses
    allow_as_intermediate = false,
    allow_decomposition = false,
    hidden = false,
    -- This limits where the recipe can be crafted
    -- We'll need to update the house entities to have this category
    category = "house-crafting"
  }
})