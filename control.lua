-- This file is executed during the control stage (runtime)
-- Add game event handlers and control logic here

-- script.on_init(function()
--   -- Code to run when mod is first loaded into a save
-- end)

-- script.on_event(defines.events.on_built_entity, function(event)
--   -- Code to run when player builds an entity
-- end)

-- Add spoilage mechanic for workers
script.on_event(defines.events.on_tick, function(event)
  if event.tick % 60 == 0 then  -- Check every second
    for _, surface in pairs(game.surfaces) do
      for _, player in pairs(game.players) do
        local inventory = player.get_main_inventory()
        if inventory then
          for i = 1, #inventory do
            local stack = inventory[i]
            if stack.valid_for_read and stack.name == "tycoon-worker" then
              if not stack.custom_data then
                stack.custom_data = { created_at = game.tick }
              end
              
              -- Worker spoils after 1 hour (216000 ticks = 60 minutes * 60 seconds * 60 ticks)
              if game.tick - stack.custom_data.created_at >= 216000 then
                local count = stack.count
                stack.clear()
                inventory.insert({name = "tycoon-tired-worker", count = count})
              end
            end
          end
        end
      end
    end
  end
end)