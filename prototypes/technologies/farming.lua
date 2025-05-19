data:extend({
  {
    type = "technology",
    name = "tycoon-farming",
    icon = "__tycoon-2__/graphics/technologies/farming.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = {"automation"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tycoon-artificial-nauvis-soil-a"
      },
      {
        type = "unlock-recipe",
        recipe = "tycoon-artificial-nauvis-soil-b"
      },
      {
        type = "unlock-recipe",
        recipe = "tycoon-wheat-seed"
      }
    },
    unit =
    {
      count = 30,
      ingredients =
      {
        {"automation-science-pack", 1}
      },
      time = 15
    },
    order = "c-a"
  }
})