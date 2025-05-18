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
  {
    type = "recipe",
    name = "tycoon-coffee",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {"tycoon-coffee-beans", 4}
    },
    result = "tycoon-coffee",
    result_count = 1
  },
  {
    type = "recipe",
    name = "tycoon-cocoa-powder",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {"tycoon-cocoa-beans", 2}
    },
    result = "tycoon-cocoa-powder",
    result_count = 1
  },
  {
    type = "recipe",
    name = "tycoon-sugar",
    category = "crafting",
    enabled = true,
    energy_required = 3,
    ingredients = {
      {"tycoon-sugar-cane", 4}
    },
    result = "tycoon-sugar",
    result_count = 1
  },
  {
    type = "recipe",
    name = "tycoon-mascarpone",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 5,
    ingredients = {
      {type="fluid", name="milk", amount=40}
    },
    result = "tycoon-mascarpone",
    result_count = 1
  },
  {
    type = "recipe",
    name = "tycoon-ladyfingers",
    category = "crafting",
    enabled = true,
    energy_required = 4,
    ingredients = {
      {"flour", 3},
      {"tycoon-sugar", 1},
      {"tycoon-eggs", 2}
    },
    result = "tycoon-ladyfingers",
    result_count = 2
  },
  {
    type = "recipe",
    name = "tycoon-tiramisu",
    category = "crafting",
    enabled = true,
    energy_required = 8,
    ingredients = {
      {"tycoon-mascarpone", 2},
      {"tycoon-coffee", 1},
      {"tycoon-cocoa-powder", 1},
      {"tycoon-ladyfingers", 3},
      {"tycoon-sugar", 2},
      {"tycoon-eggs", 1}
    },
    result = "tycoon-tiramisu",
    result_count = 1
  }
})