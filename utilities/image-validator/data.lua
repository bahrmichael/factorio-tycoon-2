-- Dummy data.lua file with sample prototypes
print("Loading data.lua file...")

-- Force data to be an empty table to avoid conflicts
data = {}
print("Data table initialized in data.lua")

-- Define the extend function if it doesn't exist
data.extend = function(prototypes)
    print("data.extend called from data.lua with " .. #prototypes .. " prototypes")
end

print("About to call data.extend with sample prototypes")

-- Call data.extend with sample prototypes
data.extend({
    {
        type = "item",
        name = "example-item",
        icon = "__base__/graphics/icons/example.png",
        icon_size = 32
    },
    {
        type = "fluid",
        name = "example-fluid",
        icon = "__base__/graphics/icons/fluid.png",
        icon_size = 64
    },
    {
        type = "technology",
        name = "example-tech",
        icon = "__base__/graphics/technology/tech.png",
        icon_size = 128,
        icon_mipmaps = 4
    }
})

print("Finished loading data.lua")