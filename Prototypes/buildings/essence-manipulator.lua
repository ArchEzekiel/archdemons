require("utilities.util")
local entity_shift = {x = 0, y = -0.5}
local shadow_shift = {x = 0.42, y = 0}
shadow_shift = shift_merge(shadow_shift, entity_shift)
local entity = require("graphics.essence-manipulator.entity")
local shadow = require("graphics.essence-manipulator.shadow")
entity["shift"] = shift_merge(entity["shift"], entity_shift)
shadow["shift"] = shift_merge(shadow["shift"], shadow_shift)

data:extend{{
    type = "item",
    name = "ad-essence-manipulator",
    stack_size = 50,
    icon = "__archdemons__/Graphics/essence-manipulator/icon.png",
    icon_size = 64,
    place_result = "ad-essence-manipulator"
},
{
    type = "recipe",
    name = "ad-essence-manipulator",
    category = "crafting",
    subgroup = "production-machine",
    icon = "__archdemons__/Graphics/essence-manipulator/icon.png",
    icon_size = 64,
    ingredients = {{"iron-plate",20},{"iron-gear-wheel",5}},
    enabled = true,
    result = "ad-essence-manipulator",
    energy_required=10
},
{
    type = "assembling-machine",
    name = "ad-essence-manipulator",
    icon = "__archdemons__/Graphics/essence-manipulator/icon.png",
    icon_size = 64,
    collision_box = {{-1.4,-1.4}, {1.4,1.4}},
    selection_box = {{-1.4,-1.4}, {1.4,1.4}},
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "ad-essence-manipulator"},
    subgroup = "production-machine",
    max_health = 300,
    energy_usage = "500KW",
    crafting_speed = 1,
    crafting_categories = {"ad-crushing"},
    energy_source = {
        type = "burner",
        fuel_inventory_size = 1,
        fuel_category = "ad-essence",
        emissions_per_minute = 10
    },
    fluid_boxes =
    {
        {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = 1,
            pipe_connections = {{ type = "output", position = {0, 2} }},
            secondary_draw_orders = { north = -1 }
        },
        off_when_no_fluid_recipe = true
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
        layers = {
            {
                filename = "__archdemons__/Graphics/essence-manipulator/entity.png",
                line_length = entity["line_length"],
                lines_per_file = entity["lines_per_file"],
                animation_speed = 0.5,
                width = entity["width"],
                height = entity["height"],
                scale = entity["scale"],
                shift = entity["shift"],
                frame_count = entity["sprite_count"]
            },
            {
                filename = "__archdemons__/Graphics/essence-manipulator/shadow.png",
                line_length = shadow["line_length"],
                lines_per_file = shadow["lines_per_file"],
                animation_speed = 0.5,
                width = shadow["width"],
                height = shadow["height"],
                scale = shadow["scale"],
                shift = shadow["shift"],
                frame_count = shadow["sprite_count"],
                draw_as_shadow = true,
                repeat_count = entity["sprite_count"]
            }
        }
    },
    module_specification = {
        module_slots = 2
    },
}}