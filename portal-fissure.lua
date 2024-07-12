local noise = require("noise")
local resource_autoplace = require("resource-autoplace")
local enemy_autoplace = require("__base__/prototypes/entity/enemy-autoplace-utils")


--The section below was an attempt to get the resource to spawn alongside bite bases, but I couldnt get this to work
--if youre reading this and you have insight on how to make it work, Im all ears
---------------------------------
--[[
--setup the richness expression using the resource_autoplace library
fissure_autoplace = resource_autoplace.resource_autoplace_settings{
    patch_set_name = "ad-portal-fissure",
    autoplace_control_name = "enemy-base",
    order = "a",
    base_density = 1,
    richness_multiplier = 1,
    richness_multiplier_distance_bonus = 1.5,
    base_spots_per_km2 = 0.2,
    has_starting_area_placement = false,
    random_spot_size_minimum = 0.01,
    random_spot_size_maximum = 0.1,
    regular_blob_amplitude_multiplier = 1,
    richness_post_multiplier = 1.0,
    additional_richness = 3500,
    regular_rq_factor_multiplier = 0.1,
    candidate_spot_count = 22,
}
fissure_autoplace.probability_expression = something I cant figure out

--probability_expression = noise.max(0, noise.var("enemy-base-frequency")) * noise.max(0, noise.var("enemy-base-radius"))
local distance_unit = 312
local distance_outside_starting_area = noise.var("distance") - noise.var("starting_area_radius")

-- Units with a higher distance_factor will appear farther out by one
-- distance_unit per distance_factor
local distance_height_multiplier = noise.max(0, 1 + (distance_outside_starting_area - distance_unit * distance_factor) * 0.002 * distance_factor)

local probability_expression = noise.var("enemy_base_probability") * distance_height_multiplier
-- limit probability so that it never quite reaches 1,
-- because that would result in stupid-looking squares of biter bases:
probability_expression = noise.min(probability_expression, 0.25 + distance_factor * 0.05)
-- Add randomness to the probability so that there's a little bit of a gradient
-- between different units:
probability_expression = noise.random_penalty(probability_expression, 0.1, {
  x = noise.var("x") + new_random_seed() -- Include distance_factor in random seed!
})

resource_autoplace.probability_expression = enemy_autoplace{}.
]]
local fissure = {
    {
        type = "resource-category",
        name = "ad-fissure"
    },
    {
        type = "resource",
        name = "ad-portal-fissure",
        category = "ad-fissure",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/portal-fissure/icon.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        order = "a",
        map_color = {r = 0.15, g = 1, b = 0.15},
        highlight = true,
        map_grid = false,
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        map_generator_bounding_box = {{-2.41, -2.41}, {2.41, 2.41}},
        selection_box = {{-2.4, -2.4}, {2.4, 2.4}},
        minable = {
            mining_time = 5,
            results = {},
        },
        stage_counts = {0},
        stages = {
            sheet = {
                filename = "__archdemons__/Graphics/portal-fissure/entity.png",
                priority = "extra-high",
                width = 192,
                height = 192,
                frame_count = 1,
                variation_count = 1,
                shift = util.by_pixel(0, 0)
            }
        }
    }
}
data:extend(fissure)