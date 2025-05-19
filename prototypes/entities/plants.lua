data:extend({
  {
    type = "simple-entity",
    name = "tycoon-wheat-plant",
    icon = "__tycoon-2__/graphics/items/wheat.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "tycoon-wheat", count = 3},
    max_health = 20,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -0.8}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    placeable_by = {item = "tycoon-wheat-seed", count = 1},
    tiles_allowed = {"tycoon-artificial-nauvis-soil-a", "tycoon-natural-nauvis-soil-a", "tycoon-artificial-nauvis-soil-b", "tycoon-natural-nauvis-soil-b"},
    pictures =
    {
      {
        filename = "__tycoon-2__/graphics/entities/wheat-plant/wheat-plant-1.png",
        width = 32,
        height = 64,
        scale = 1,
        shift = {0, -1}
      }
    }
  }
})