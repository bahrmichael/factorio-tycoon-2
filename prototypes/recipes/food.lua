-- Food recipes

data:extend({
  {
    type = "recipe",
    name = "tycoon-grain",
    category = "crafting",
    enabled = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "tycoon-wheat", amount = 2}
    },
    results = {
      {type = "item", name = "tycoon-grain", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "tycoon-flour",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {type = "item", name = "tycoon-grain", amount = 1}
    },
    results = {
      {type = "item", name = "tycoon-flour", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "tycoon-dough",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 3,
    ingredients = {
      {type = "item", name = "tycoon-flour", amount = 2},
      {type = "fluid", name = "tycoon-milk", amount = 20}
    },
    results = {
      {type = "item", name = "tycoon-dough", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "tycoon-bread",
    category = "smelting",
    enabled = true,
    energy_required = 3.5,
    ingredients = {
      {type = "item", name = "tycoon-dough", amount = 1}
    },
    results = {
      {type = "item", name = "tycoon-bread", amount = 1}
    }
  }
})