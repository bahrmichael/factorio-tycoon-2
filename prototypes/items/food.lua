-- Food items

data:extend({
    {
        type = "item",
        name = "tycoon-wheat",
        icon = "__tycoon-2__/graphics/items/wheat.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "b[wheat]",
        stack_size = 100,
        fuel_value = "500kJ",
        fuel_category = "food",
    },
    {
        type = "item",
        name = "tycoon-grain",
        icon = "__tycoon-2__/graphics/items/grain.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b[grain]",
        stack_size = 100,
        fuel_value = "500kJ",
        fuel_category = "food",
    },
    {
        type = "item",
        name = "tycoon-flour",
        icon = "__tycoon-2__/graphics/items/flour.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b[flour]",
        stack_size = 100,
        fuel_value = "500kJ",
        fuel_category = "food",
        spoil_ticks = 432000, -- 2 hours
    },
    {
        type = "fluid",
        name = "tycoon-milk",
        default_temperature = 15,
        max_temperature = 100,
        heat_capacity = "0.2kJ",
        base_color = { r = 0.9, g = 0.9, b = 0.9 },
        flow_color = { r = 0.9, g = 0.9, b = 1.0 },
        icon = "__tycoon-2__/graphics/items/milk.png",
        icon_size = 64,
        order = "a[fluid]-b[milk]",
    },
    {
        type = "item",
        name = "tycoon-dough",
        icon = "__tycoon-2__/graphics/items/dough.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b[dough]",
        stack_size = 100,
        fuel_value = "500kJ",
        fuel_category = "food",
        spoil_ticks = 108000, -- 30 minutes
    },
    {
        type = "item",
        name = "tycoon-bread",
        icon = "__tycoon-2__/graphics/items/bread.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b[bread]",
        stack_size = 100,
        fuel_value = "500kJ",
        fuel_category = "food",
        spoil_ticks = 216000, -- 1 hour in ticks (60 ticks per second, 3600 = 60 seconds)
    }
})
