data:extend{{
    type = "item",
    name = "ad-solid-processing-unit",
    stack_size = 50,
    icon = "__archdemons__/Graphics/solid-processing-unit/icon.png",
    icon_size = 64,
    place_result = "ad-solid-processing-unit"
},
{
    type = "recipe",
    name = "ad-solid-processing-unit",
    category = "crafting",
    subgroup = "production-machine",
    icon = "__archdemons__/Graphics/solid-processing-unit/icon.png",
    icon_size = 64,
    ingredients = {{"iron-plate",20},{"iron-gear-wheel",5}},
    enabled = true,
    result = "ad-solid-processing-unit",
    energy_required=10
},
{
    type = "assembling-machine",
    name = "ad-solid-processing-unit",
    icon = "__archdemons__/Graphics/solid-processing-unit/icon.png",
    icon_size = 64,
    collision_box = {{-1.4,-1.4}, {1.4,1.4}},
    selection_box = {{-1.4,-1.4}, {1.4,1.4}},
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "ad-solid-processing-unit"},
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
                filename = "__archdemons__/Graphics/solid-processing-unit/entity.png",
                frame_count = 15,
                line_length = 3,
                animation_speed = 1.0/3.0,
                size = 192,
                shift = {0,-0.5},
                scale = 0.6
            },
            --[[{
                filename = "__archdemons__/Graphics/demonic-artificer/shadow.png",
                frame_count = 30,
                line_length = 6,
                size = 256,
                shift = {2.5,0.5},
                scale = 0.6 ,
                draw_as_shadow = true
            }]]
        }
    },
    module_specification = {
        module_slots = 2
    },
}}