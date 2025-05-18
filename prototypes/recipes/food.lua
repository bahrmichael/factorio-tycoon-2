-- Food recipes

data:extend({
  {
    type = "recipe",
    name = "grain",
    category = "crafting",
    enabled = true,
    energy_required = 1,
    ingredients = {
      {type = "item", name = "wheat", amount = 2}
    },
    results = {
      {type = "item", name = "grain", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "flour",
    category = "crafting",
    enabled = true,
    energy_required = 2,
    ingredients = {
      {type = "item", name = "grain", amount = 1}
    },
    results = {
      {type = "item", name = "flour", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "dough",
    category = "crafting-with-fluid",
    enabled = true,
    energy_required = 3,
    ingredients = {
      {type = "item", name = "flour", amount = 2},
      {type = "fluid", name = "milk", amount = 20}
    },
    results = {
      {type = "item", name = "dough", amount = 1}
    }
  },
  {
    type = "recipe",
    name = "bread",
    category = "smelting",
    enabled = true,
    energy_required = 3.5,
    ingredients = {
      {type = "item", name = "dough", amount = 1}
    },
    results = {
      {type = "item", name = "bread", amount = 1}
    }
  }
})