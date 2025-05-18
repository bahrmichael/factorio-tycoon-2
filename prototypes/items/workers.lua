-- Worker items

data:extend({
    {
        type = "item",
        name = "tycoon-worker",
        icon = "__tycoon-2__/graphics/items/worker.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "c[worker]",
        stack_size = 50,
        fuel_value = "1MJ",
        fuel_category = "chemical",
        spoil_time = 3600, -- 1 hour in ticks (60 ticks per second, 3600 = 60 seconds)
        spoil_result = "tycoon-tired-worker"
    },
    {
        type = "item",
        name = "tycoon-tired-worker",
        icon = "__tycoon-2__/graphics/items/tired-worker.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "c[worker]-b",
        stack_size = 50
    }
})
