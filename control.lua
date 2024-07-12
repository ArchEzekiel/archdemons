local function register_drill(drill)
    drill.force = game.forces["ad-drill"]
    global.registeredDrills[drill.unit_number] = drill
end

script.on_event(defines.events.on_built_entity,function(event)
    register_drill(event.created_entity)end,
{{filter="name", name="ad-portal-drill"}})
script.on_event(defines.events.on_robot_built_entity,function(event)
    register_drill(event.created_entity)end,
{{filter="name", name="ad-portal-drill"}})

local function calcQuality(item)
    local sacrifices = {["ad-demon-scale"]=2, ["ad-demon-pincer"]=3, ["ad-demon-essence"]=4, ["ad-demon-brain"]=5, ["ad-demon-heart"]=6}
    for x, y in pairs(sacrifices) do
        if x == item then
            return y
        end
    end
end

local function calcQuantity(evolution, weights)
    local last_weight = 0
    for _, z in ipairs(weights) do
        if z["evolution_factor"] > evolution then
            local ratio = evolution / z["evolution_factor"]
            return math.ceil((last_weight + z["weight"]) * ratio) * 5
        else
            last_weight = z["weight"]
        end
    end
    return 0
end

local function calcSpawn(spawner)
    local range_x = {spawner.bounding_box.left_top["x"], spawner.bounding_box.right_bottom["x"]}
    local range_y = {spawner.bounding_box.left_top["y"], spawner.bounding_box.right_bottom["y"]}
    local range_x_mod = (range_x[2] - range_x[1]) / 4
    local range_y_mod = (range_y[2] - range_y[1]) / 4
    range_x = {range_x[1] - range_x_mod, range_x[2] + range_x_mod}
    range_y = {range_y[1] - range_y_mod, range_y[2] + range_y_mod}
    local position = {}
    if math.random(2) == 1 then
        position = {x=(math.random() * (range_x[2] - range_x[1])) + range_x[1], y = range_y[math.random(2)]}
    else
        position = {x=range_x[math.random(2)], y = (math.random() * (range_y[2] - range_y[1])) + range_y[1]}
    end
    return position
end

local function processSpawning(evolution, spawner, multiplier)
    --Deprecated Spawning, moving over to spawning bases instead
    for _, x in pairs(game.entity_prototypes) do
        if x.result_units ~= nil then
            for _, y in pairs(x.result_units) do
                for i = 1, calcQuantity(evolution, y["spawn_points"]) * multiplier, 1 do
                    game.surfaces[spawner.surface_index].create_entity{name = y["unit"], position = calcSpawn(spawner), force = game.forces.enemy}
                end
            end
        end
    end
end

script.on_init(function()
    game.create_force("ad-drill")
    game.forces["ad-drill"].set_friend("player", true)
    game.forces["ad-drill"].set_friend("enemy", true)
    game.forces["player"].set_friend("ad-drill", true)
    game.forces["enemy"].set_friend("ad-drill", true)
    global.registeredDrills = {} --[[@as table<LuaEntity>]]
    --registeredDrills[unit-number] = entity
end)

script.on_event(defines.events.on_rocket_launched, function(event)
    if event.rocket_silo.name == "ad-artificial-portal" and event.rocket_silo.valid then
        local multiplier = 0.0
        local quality = 1
        if event.rocket.get_inventory(defines.inventory.rocket).is_empty() == false then
            for x, y in pairs(event.rocket.get_inventory(defines.inventory.rocket).get_contents()) do
                quality = calcQuality(x)
                multiplier = y
            end
        end
        local evolution = game.forces.enemy.evolution_factor
        local pollution = game.surfaces[event.rocket_silo.surface_index].get_pollution(event.rocket_silo.position)
        game.surfaces[event.rocket_silo.surface_index].pollute(event.rocket_silo.position,-pollution)
        multiplier = multiplier + (pollution / 100)
        multiplier = (multiplier > 5) and 5 or multiplier
        while quality > 0 do
            processSpawning(evolution, event.rocket_silo, multiplier)
            evolution = evolution - (evolution / 5)
            quality = quality - 1
            multiplier = multiplier / 2
        end
    end
end)

local index = 1
script.on_event(defines.events.on_tick, function(event)--[[
    if (next(global.registeredDrills)) then
        local drill = global.registeredDrills[next(global.registeredDrills, index)] --[[@as LuaEntity
        if not drill then global.registeredDrills[drill.unit_number] = nil return end
        if drill.get_main_inventory() and not drill.get_main_inventory().is_empty() then
            local pollution = game.surfaces[drill.surface_index].get_pollution(drill.position)
            local multiplier = (pollution / 100) > 5 and 5 or (pollution / 100)
            multiplier = drill.get_main_inventory().get_item_count() * multiplier
            local evolution = game.forces.enemy.evolution_factor
            game.surfaces[drill.surface_index].pollute(drill.position, pollution * -1)
            while multiplier > 0.5 do
                processSpawning(evolution, drill, multiplier)
                evolution = evolution - (evolution / 5)
                multiplier = multiplier / 2
            end
            drill.get_main_inventory().clear()
        end
        index = index + 1
    else index = 1 end]]
end)

local function avg_position(spawners)
    local avg = {x = 0, y = 0} 
    for _, spawner--[[@as LuaEntity]] in pairs(spawners) do
        avg.x = avg.x + spawner.position.x
        avg.y = avg.y + spawner.position.y
    end
    avg.x = avg.x / #spawners
    avg.y = avg.y / #spawners
    return avg
end

script.on_event(defines.events.on_chunk_generated, function(event)
    local map_position = {x = event.position.x * 32, y = event.position.y * 32}
    local biter_bases = event.surface.find_entities_filtered{
        area = {{map_position.x - 16, map_position.y - 16}, {map_position.x + 16, map_position.y + 16}},
        type = "unit-spawner"
    }
    if next(biter_bases) ~= nil then
        local resources_nearby = event.surface.find_entities_filtered{
            area = {{map_position.x - 48, map_position.y - 48}, {map_position.x + 48, map_position.y + 48}},
            type = "resource",
            name = "ad-portal-fissure"
        }
        if next(resources_nearby) == nil then
            event.surface.create_entity
            {
                name = "ad-portal-fissure",
                position = avg_position(biter_bases),
                force = "neutral",
                amount = math.sqrt((map_position.x * map_position.x) + (map_position.y * map_position.y))
            }
        end
    end
end)