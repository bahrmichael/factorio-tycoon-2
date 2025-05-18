-- Animal breeding recipes

data:extend({
  -- Cow breeding
  {
    type = "recipe",
    name = "tycoon-cow-breeding",
    category = "crafting-with-fluid",
    energy_required = 30,
    enabled = true,
    ingredients = {
      {type = "item", name = "tycoon-cow", amount = 2},
      {type = "item", name = "tycoon-grain", amount = 5},
      {type = "fluid", name = "water", amount = 50}
    },
    results = {
      {type = "item", name = "tycoon-cow", amount = 2},
      {type = "item", name = "tycoon-calf", amount = 1, probability = 0.2}
    },
    main_product = "tycoon-cow",
    icon = "__tycoon-2__/graphics/items/tycoon-cow.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[breeding]-a[cow]"
  },
  
  -- Chicken breeding
  {
    type = "recipe",
    name = "tycoon-chicken-breeding",
    category = "crafting-with-fluid",
    energy_required = 20,
    enabled = true,
    ingredients = {
      {type = "item", name = "tycoon-chicken", amount = 2},
      {type = "item", name = "tycoon-grain", amount = 2},
      {type = "fluid", name = "water", amount = 20}
    },
    results = {
      {type = "item", name = "tycoon-chicken", amount = 2},
      {type = "item", name = "tycoon-chick", amount = 1, probability = 0.2}
    },
    main_product = "tycoon-chicken",
    icon = "__tycoon-2__/graphics/items/tycoon-chicken.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "a[breeding]-b[chicken]"
  }
})