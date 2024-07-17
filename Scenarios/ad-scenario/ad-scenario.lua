local util = require("util")

local created_items = function()
    return
    {
        ["pistol"] = 1,
        ["firearm-magazine"] = 50,
        ["ad-drill-head-mk1"] = 10,
        ["ad-solid-processing-unit"] = 3
    }
end

local respawn_items = function()
    return
    {
        ["pistol"] = 1,
        ["firearm-magazine"] = 10
    }
end

local structures = function()
    return
    {
        {name = "ad-portal-fissure", position = {5, 0}, force = "neutral", amount = 666},
        {name = "ad-portal-harvester", position = {5, 0}},
        {name = "gun-turret", position = {14, 6}},
        {name = "gun-turret", position = {14, -7}}
    }
end

local chart_starting_area = function()
    local r = global.chart_distance or 200
    local force = game.forces.player
    local surface = game.surfaces[1]
    local origin = force.get_spawn_position(surface)
    force.chart(surface, {{origin.x - r, origin.y - r}, {origin.x + r, origin.y + r}})
end

local on_player_created = function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    util.insert_safe(player, global.created_items)
    
    if not global.init_ran then
        global.init_ran = true

        chart_starting_area()

        if not global.disable_crashsite then
            local surface = player.surface
            surface.daytime = 0.7
            
            for _, entity in pairs(global.structures) do
                surface.create_entity{name = entity.name, position = entity.position, force = entity.force or player.force, amount = entity.amount}
            end

            player.get_main_inventory().sort_and_merge()
            if player.character then
                player.character.destructible = false
            end
            return
        end
    end

    if not global.skip_intro then
        if game.is_multiplayer() then
            player.print(global.custom_intro_message or {"msg-intro"})
        else
            game.show_message_dialog{text = global.custom_intro_message or {"msg-intro"}}
        end
    end
end

local on_player_respawned = function(event)
    local player = game.get_player(event.player_index)
    util.insert_safe(player, global.respawn_items)
end

local ad_scenario = {}

ad_scenario.events =
{
    [defines.events.on_player_created] = on_player_created,
    [defines.events.on_player_respawned] = on_player_respawned,
}

ad_scenario.on_init = function()
    global.created_items = created_items()
    global.respawn_items = respawn_items()
    global.structures = structures()
end

return ad_scenario