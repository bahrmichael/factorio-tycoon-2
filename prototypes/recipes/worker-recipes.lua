data:extend({
    -- Recipe to refresh tired workers
    {
        type = "recipe",
        name = "refresh-worker",
        category = "house-crafting", -- Custom category for house crafting
        energy_required = 10,
        enabled = false, -- Will be unlocked by technology
        ingredients = {
            {"tired-worker", 1},
            {"raw-fish", 1}  -- Food for the worker
        },
        result = "worker",
        result_count = 1,
        crafting_machine_tints = {
            primary = {r = 0.8, g = 0.8, b = 0.8, a = 0},
            secondary = {r = 0.3, g = 0.3, b = 0.3, a = 0},
            tertiary = {r = 0.5, g = 0.5, b = 0.5, a = 0}
        }
    }
})