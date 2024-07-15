data:extend{{
    type = "item",
    name = "ad-demonic-artificer",
    stack_size = 10,
    icon = "__archdemons__/Graphics/demonic-artificer/icon.png",
    icon_size = 256,
    place_result = "ad-demonic-artificer"
},
{
    type = "recipe",
    name = "ad-demonic-artificer",
    category = "crafting",
    subgroup = "production-machine",
    icon = "__archdemons__/Graphics/demonic-artificer/icon.png",
    icon_size = 256,
    ingredients = {{"ad-demon-heart",10},{"ad-demon-scale",50},{"ad-demon-essence",200},{"ad-demon-pincer",10}},
    enabled = true,
    result = "ad-demonic-artificer",
    energy_required=10
},
{
    type = "assembling-machine",
    name = "ad-demonic-artificer",
    icon = "__archdemons__/Graphics/demonic-artificer/icon.png",
    icon_size = 256,
    collision_box = {{-2.4,-2.4}, {2.4,2.4}},
    selection_box = {{-2.4,-2.4}, {2.4,2.4}},
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "ad-demonic-artificer"},
    subgroup = "production-machine",
    max_health = 300,
    energy_usage = "5MW",
    crafting_speed = 2,
    crafting_categories = {"crafting", "crafting-with-fluid", "ad-artificer-crafting"},
    energy_source = {
        type = "burner",
        fuel_inventory_size = 1,
        fuel_category = "ad-essence",
        emissions_per_minute = 10
    },
    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = -1,
            pipe_connections = { { type = "input", position = {0, -3} } },
            secondary_draw_orders = { north = -1 }
        },
        {
            production_type = "output",
            pipe_picture = assembler2pipepictures(),
            pipe_covers = pipecoverspictures(),
            base_area = 10,
            base_level = 1,
            pipe_connections = {{ type = "output", position = {0, 3} }},
            secondary_draw_orders = { north = -1 }
        },
        off_when_no_fluid_recipe = true
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
        layers = {
            {
                filename = "__archdemons__/Graphics/demonic-artificer/entity.png",
                frame_count = 30,
                line_length = 6,
                animation_speed = 1.0/3.0,
                size = 256,
                shift = {0,0},
                scale = 0.6
            },
            {
                filename = "__archdemons__/Graphics/demonic-artificer/shadow.png",
                frame_count = 30,
                line_length = 6,
                size = 256,
                shift = {2.5,0.5},
                scale = 0.6,
                draw_as_shadow = true
            }
        }
    },
    module_specification = {
        module_slots = 8
    },
}}