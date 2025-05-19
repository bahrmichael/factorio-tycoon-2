print("Starting extraction script")

-- Create data table if it doesn't exist
data = data or {}
print("Created data table")

-- Create a counter for debugging
local extend_calls = 0

-- Initial function to count calls
data.extend = function(prototypes)
    extend_calls = extend_calls + 1
    print("Original data.extend called " .. extend_calls .. " times with " .. #prototypes .. " prototypes")
    
    -- Process prototypes directly here as a safety measure
    if type(prototypes) == "table" then
        for _, prototype in ipairs(prototypes) do
            if prototype.type and prototype.name then
                print("Initial scan - found prototype: " .. prototype.name .. " (" .. prototype.type .. ")")
            end
        end
    end
end

local original_data = {}
original_data.extend = data.extend


local expected_dimensions = {
    item = { 32, 32 },
    fluid = { 32, 32 },
    entity = { 32, 32 },
    technology = { 128, 128 },
    recipe = { 32, 32 },
    tile = { 32, 32 }
}


local function scan_for_images(t, proto_type)
    if type(t) ~= "table" then return end


    for k, v in pairs(t) do
        if type(k) == "string" and type(v) == "string" and (k == "icon" or k == "icon_path" or k:match("filename$") or k:match("path$")) and v:match(".png$") then
            local width, height = 32, 32
            if proto_type and expected_dimensions[proto_type] then
                width, height = expected_dimensions[proto_type][1], expected_dimensions[proto_type][2]
            end


            if t.icon_size then
                width, height = t.icon_size, t.icon_size
            elseif t.width and t.height then
                width, height = t.width, t.height
            end


            print("Found image: " .. v .. " (" .. (proto_type or "unknown") .. ") with dimensions " .. width .. "x" .. height)
            reportImageReference(v, width, height, proto_type or "unknown")
        end


        scan_for_images(v, proto_type)
    end


    if t.layers and type(t.layers) == "table" then
        for _, layer in ipairs(t.layers) do
            scan_for_images(layer, proto_type)
        end
    end


    if t.icons and type(t.icons) == "table" then
        for _, icon_data in ipairs(t.icons) do
            if icon_data.icon and icon_data.icon:match(".png$") then
                local size = icon_data.icon_size or t.icon_size or 32
                print("Found icon: " .. icon_data.icon .. " (" .. (proto_type or "unknown") .. ") with size " .. size)
                reportImageReference(icon_data.icon, size, size, proto_type or "unknown")
            end
        end
    end
end


data.extend = function(prototypes)
    if type(prototypes) ~= "table" then
        return original_data.extend(prototypes)
    end

    print("Processing " .. #prototypes .. " prototypes")
    
    for _, prototype in ipairs(prototypes) do
        if prototype.type and prototype.name then
            print("Scanning prototype: " .. prototype.name .. " (" .. prototype.type .. ")")
            scan_for_images(prototype, prototype.type)
        end
    end


    return original_data.extend(prototypes)
end


-- Try to load data.lua if it exists
print("Attempting to load data.lua file...")
local success, err = pcall(function() dofile("data.lua") end)
if success then
    print("Successfully loaded data.lua")
    print("Total extend calls recorded: " .. extend_calls)
else
    print("Failed to load data.lua: " .. tostring(err))
end

-- Find counts of prototypes in the registry as a test
if global_prototype_registry then
    local count = 0
    for _ in pairs(global_prototype_registry) do count = count + 1 end
    print("Found " .. count .. " prototypes in global registry")
else
    print("No global prototype registry found")
end


data.extend = original_data.extend
