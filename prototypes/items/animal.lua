local animals = {}

animals.calf = {
    type = "item",
    name = "tycoon-calf",
    icon = "__tycoon__/graphics/items/tycoon-calf.png",
    icon_size = 32,
    subgroup = "tycoon-animals",
    order = "a[animals]-a[calf]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"},
    expire_time = 10 * 60 * 60, -- 10 minutes in ticks (60 ticks per second)
    expire_result = "tycoon-cow"
}

animals.cow = {
    type = "item",
    name = "tycoon-cow",
    icon = "__tycoon__/graphics/items/tycoon-cow.png",
    icon_size = 32,
    subgroup = "tycoon-animals",
    order = "a[animals]-b[cow]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"}
}

animals.chicken = {
    type = "item",
    name = "tycoon-chicken",
    icon = "__tycoon__/graphics/items/tycoon-chicken.png",
    icon_size = 32,
    subgroup = "tycoon-animals",
    order = "a[animals]-c[chicken]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"},
    expire_time = 10 * 60 * 60, -- 10 minutes in ticks
    expire_result = "tycoon-adult-chicken"
}

animals.adult_chicken = {
    type = "item",
    name = "tycoon-adult-chicken",
    icon = "__tycoon__/graphics/items/tycoon-adult-chicken.png",
    icon_size = 32,
    subgroup = "tycoon-animals",
    order = "a[animals]-d[adult-chicken]",
    stack_size = 50,
    flags = {"goes-to-main-inventory"}
}

data:extend({
    animals.calf,
    animals.cow,
    animals.chicken,
    animals.adult_chicken
})