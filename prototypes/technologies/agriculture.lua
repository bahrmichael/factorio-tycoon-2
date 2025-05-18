-- Agriculture technology

data:extend({
  {
    type = "technology",
    name = "tycoon-agriculture",
    icon = "__factorio-tycoon-2__/graphics/technologies/agriculture.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "tycoon-farmable-soil-from-wetland"
      },
      {
        type = "unlock-recipe",
        recipe = "tycoon-farmable-soil"
      },
      {
        type = "unlock-recipe",
        recipe = "tycoon-enhanced-farmable-soil"
      }
    },
    prerequisites = {"automation-2"},
    unit = {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
    order = "c-a"
  }
})