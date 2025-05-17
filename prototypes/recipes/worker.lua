data:extend({
  {
    type = "recipe",
    name = "refresh-worker",
    category = "crafting", -- Default category
    energy_required = 10,
    enabled = true,
    ingredients = {
      {"tired-worker", 1},
      {"water", 1}
    },
    result = "worker",
    result_count = 1,
    crafting_machine_tiers = {
      "small-house",
      "medium-house",
      "large-house"
    },
    allow_as_intermediate = false, -- Don't automatically craft this
    allow_decomposition = false,
    localised_name = {"recipe-name.refresh-worker"},
    localised_description = {"recipe-description.refresh-worker"},
  }
})