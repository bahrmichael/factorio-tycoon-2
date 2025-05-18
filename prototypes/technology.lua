-- Technology prototypes

data:extend({
  -- Add technologies here
  {
    type = "technology",
    name = "tiramisu-dessert",
    icon = "__factorio-tycoon-2__/graphics/technologies/tiramisu-tech.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "tiramisu"
      }
    },
    unit = {
      count = 30,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 15
    },
    order = "c-a"
  }
})