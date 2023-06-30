script.on_event(defines.events.on_runtime_mod_setting_changed, 
  function(event)
    if event.setting == "slowdown-enabled" or event.setting == "slowdown-factor-car" or event.setting == "slowdown-factor-tank" then
      local isTurnedOn = settings.global["slowdown-enabled"].value
      local slowdownFactor = settings.global["slowdown-factor"].value

      -- Perform action based on the new setting value
      if isTurnedOn == false then
        game.print("Turned on default friction")
      else
        game.print("Current friction value: " .. slowdownFactor)
      end
    end
  end
)

script.on_event(defines.events.on_tick, 
  function(event)
      local isTurnedOn = settings.global["slowdown-enabled"].value
      local slowdownFactor = settings.global["slowdown-factor"].value

      if isTurnedOn == false then
        return
      end

      -- Iterate over all surfaces
    for _, surface in pairs(game.surfaces) do
      -- Find all car entities on the current surface
      local cars = surface.find_entities_filtered{
        type = "car"
      }

      -- Process the car entities
      for _, car in ipairs(cars) do
        local driver = car.get_driver()
        if driver == nil then
          -- apply slowdown only if there is no driver present
          car.speed = car.speed - car.speed * slowdownFactor
        end
      end
    end
  end
)