local item_utils = require("prototypes.item")

data:extend({
    -- Worker item
    {
        type = "item",
        name = "worker",
        icon = "__factorio-tycoon-2__/graphics/items/worker.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "a[worker]",
        stack_size = 50,
        flags = {"hidden-from-flow-stats"},
        fuel_value = nil,
        fuel_category = nil,
        burnt_result = "tired-worker",
        fuel_acceleration_multiplier = 1.0,
        fuel_top_speed_multiplier = 1.0,
        fuel_emissions_multiplier = 1.0,
        fuel_glow_color = nil,
        automated_crafting_only = false,
        rocket_launch_product = nil,
        rocket_launch_products = nil,
        place_result = nil,
        placed_as_equipment_result = nil,
        localised_name = nil,
        localised_description = nil,
        limitations = nil,
        can_be_mod_opened = false,
        default_request_amount = nil,
        wire_count = nil,
        durability_description_key = nil,
        durability = nil,
    },
    -- Tired worker item
    {
        type = "item",
        name = "tired-worker",
        icon = "__factorio-tycoon-2__/graphics/items/tired-worker.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "a[worker]-b[tired]",
        stack_size = 50,
        flags = {"hidden-from-flow-stats"},
    }
})