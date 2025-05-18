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
  },
  -- Tiramisu recipes
  {
    type = "recipe",
    name = "tiramisu",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 10,
    ingredients = {
      {"mascarpone", 2},
      {"coffee", 1},
      {"cocoa-powder", 1},
      {"ladyfingers", 2},
      {"sugar", 1}
    },
    result = "tiramisu",
    result_count = 1
  },
  {
    type = "recipe",
    name = "mascarpone",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 5,
    ingredients = {
      {type="fluid", name="milk", amount=30}
    },
    result = "mascarpone",
    result_count = 1
  },
  {
    type = "recipe",
    name = "coffee",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {"coffee-beans", 1},
      {type="fluid", name="water", amount=10}
    },
    result = "coffee",
    result_count = 1
  },
  {
    type = "recipe",
    name = "cocoa-powder",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {"cocoa-beans", 1}
    },
    result = "cocoa-powder",
    result_count = 1
  },
  {
    type = "recipe",
    name = "sugar",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {"sugarcane", 2}
    },
    result = "sugar",
    result_count = 1
  },
  {
    type = "recipe",
    name = "ladyfingers",
    category = "smelting",
    enabled = true,
    energy_required = 5,
    ingredients = {
      {"flour", 2},
      {"sugar", 1},
      {"eggs", 1}
    },
    result = "ladyfingers",
    result_count = 2
  }
})