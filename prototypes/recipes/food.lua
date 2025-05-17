-- Food recipes

data:extend({
  {
    type = "recipe",
    name = "grain",
    category = "crafting",
    enabled = true,
    energy_required = 1,
    ingredients = {
      {"wheat", 2}
    },
    result = "grain",
    result_count = 1
  },
  {
    type = "recipe",
    name = "flour",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {"grain", 1}
    },
    result = "flour",
    result_count = 1
  },
  {
    type = "recipe",
    name = "dough",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 3,
    ingredients = {
      {"flour", 2},
      {type="fluid", name="milk", amount=20}
    },
    result = "dough",
    result_count = 1
  },
  {
    type = "recipe",
    name = "bread",
    category = "smelting",
    enabled = true,
    energy_required = 3.5,
    ingredients = {
      {"dough", 1}
    },
    result = "bread"
  }
})