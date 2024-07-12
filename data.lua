require("items")
require("buildings")
require("recipes")
require("entities")
require("portal-fissure")

local ad_tile = table.deepcopy(data.raw["tile"]["hazard-concrete-left"])
ad_tile.name = "ad-hazard"

data:extend({
  ad_tile,
  {
    type = "fuel-category",
    name = "ad-essence"
  },
  {
    type = "recipe-category",
    subgroup = "rocket-building",
    name = "ad-summoning"
  },
  {
    type = "recipe-category",
    subgroup = "rocket-building",
    name = "ad-drilling"
  },
  {
    type = "recipe-category",
    subgroup = "crafting-category",
    name = "ad-artificer-crafting"
  },
  {
    type = "recipe-category",
    subgroup = "crafting-category",
    name = "ad-crushing"
  },
  {
    type = "rocket-silo-rocket",
    name = "ad-dummy-rocket",
    flags = {"not-on-map"},
    rocket_sprite	= {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_shadow_sprite = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_glare_overlay_sprite	= {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_smoke_bottom1_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_smoke_bottom2_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_smoke_top1_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_smoke_top2_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_smoke_top3_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_flame_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_flame_left_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_flame_right_animation = {size = 1, filename = "__archdemons__/graphics/nil.png"},
    rocket_rise_offset = {0,0},
    rocket_flame_left_rotation = 0,
    rocket_flame_right_rotation = 0,
    rocket_render_layer_switch_distance = 0,
    full_render_layer_switch_distance = 0,
    rocket_launch_offset = {0,0},
    effects_fade_in_start_distance =0,
    effects_fade_in_end_distance =0,
    shadow_fade_out_start_ratio =0,
    shadow_fade_out_end_ratio =0,
    rocket_visible_distance_from_center = 0,
    rising_speed = 100,
    engine_starting_speed =100,
    flying_speed = 100,
    flying_acceleration = 100,
    inventory_size = 1,
  }
})
