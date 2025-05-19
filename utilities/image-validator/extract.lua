--[[  
Extraction script to find all image references in Factorio prototypes
]]--

-- Store original data.extend function to intercept it
local original_data = {}
original_data.extend = data.extend

-- Tables to track the expected dimensions for different prototype types
local expected_dimensions = {
    item = {32, 32},
    fluid = {32, 32},
    entity = {32, 32}, -- Default, will be overridden by specific entities
    technology = {128, 128},
    recipe = {32, 32},
    tile = {32, 32}
}

-- Function to recursively scan a table for image paths
local function scan_for_images(t, proto_type)
    if type(t) ~= "table" then return end
    
    -- Check for direct image references (path ending with .png)
    for k, v in pairs(t) do
        if type(k) == "string" and type(v) == "string" and (k == "icon" or k == "icon_path" or k:match("filename$") or k:match("path$")) and v:match(".png$") then
            -- Get expected dimensions based on prototype type
            local width, height = 32, 32 -- Default
            if proto_type and expected_dimensions[proto_type] then
                width, height = expected_dimensions[proto_type][1], expected_dimensions[proto_type][2]
            end
            
            -- Check for explicit size in the same table
            if t.icon_size then
                width, height = t.icon_size, t.icon_size
            elseif t.width and t.height then
                width, height = t.width, t.height
            end
            
            -- Report to Go
            reportImageReference(v, width, height, proto_type or "unknown")
        end
        
        -- Also check nested tables
        scan_for_images(v, proto_type)
    end
    
    -- Special handling for sprites and animations which may contain layers
    if t.layers and type(t.layers) == "table" then
        for _, layer in ipairs(t.layers) do
            scan_for_images(layer, proto_type)
        end
    end
    
    -- Check for icon tables (array of icon specifications)
    if t.icons and type(t.icons) == "table" then
        for _, icon_data in ipairs(t.icons) do
            if icon_data.icon and icon_data.icon:match(".png$") then
                local size = icon_data.icon_size or t.icon_size or 32
                reportImageReference(icon_data.icon, size, size, proto_type or "unknown")
            end
        end
    end
 end

-- Override data.extend to intercept prototype registrations
data.extend = function(prototypes)
    if type(prototypes) ~= "table" then 
        return original_data.extend(prototypes)
    end
    
    for _, prototype in ipairs(prototypes) do
        if prototype.type and prototype.name then
            -- Process this prototype for images
            scan_for_images(prototype, prototype.type)
        end
    end
    
    -- Call the original function
    return original_data.extend(prototypes)
end

-- Load the original data.lua to process all prototypes
dofile("data.lua")

-- Restore original data.extend to avoid side effects
data.extend = original_data.extend