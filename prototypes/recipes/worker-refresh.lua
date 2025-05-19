-- Worker refreshment recipes for houses

data:extend({
  {
    type = "recipe",
    name = "tycoon-refresh-worker-small-house",
    category = "house-crafting",
    energy_required = 2,
    enabled = true,
    ingredients = {
      {type = "item", name = "tycoon-tired-worker", amount = 1}
    },
    results = {
      {type = "item", name = "tycoon-worker", amount = 1},
      {type = "item", name = "tycoon-mixed-waste", amount = 1}
    },
    icon = "__tycoon-2__/graphics/items/worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "d[worker]-a"
  },
  {
    type = "recipe",
    name = "tycoon-refresh-worker-medium-house",
    category = "house-crafting",
    energy_required = 2,
    enabled = true,
    ingredients = {
      {type = "item", name = "tycoon-tired-worker", amount = 2}
    },
    results = {
      {type = "item", name = "tycoon-worker", amount = 2},
      {type = "item", name = "tycoon-mixed-waste", amount = 2}
    },
    icon = "__tycoon-2__/graphics/items/worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "d[worker]-b"
  },
  {
    type = "recipe",
    name = "tycoon-refresh-worker-large-house",
    category = "house-crafting",
    energy_required = 2,
    enabled = true,
    ingredients = {
      {type = "item", name = "tycoon-tired-worker", amount = 4}
    },
    results = {
      {type = "item", name = "tycoon-worker", amount = 4},
      {type = "item", name = "tycoon-mixed-waste", amount = 4}
    },
    icon = "__tycoon-2__/graphics/items/worker.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "d[worker]-c"
  }
})