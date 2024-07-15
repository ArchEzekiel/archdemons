

data:extend{{
	type = "item",
	name = "ad-crust-cracker",
	stack_size = 5,
	icon = "__archdemons__/Graphics/crust-crusher/icon.png",
	icon_size = 256,
	place_result = "ad-crust-cracker"
},
{
	type = "rocket-silo",
	name = "ad-crust-cracker",
	icon = "__archdemons__/Graphics/crust-crusher/icon.png",
	icon_size = 256,
	subgroup = "production-machine",
	animation = {
		layers = {
			{
				filename = "__archdemons__/Graphics/crust-crusher/icon.png",
				frame_count = 1,
				line_length = 1,
				animation_speed = 0.5,
				size = 256,
				shift = {0,0},
				scale = 0.6
			},--[[
			{
				filename = "__archdemons__/Graphics/artificial-portal/shadow.png",
				frame_count = 150,
				frame_sequence = frames,
				line_length = 10,
				animation_speed = 0.5,
				height = 128,
				width = 256,
				shift = {2.5,0.5},
				scale = 1.2,
				draw_as_shadow = true
			}]]
		}
	},
	collision_box = {{-2.4,-2.4}, {2.4,2.4}},
	selection_box = {{-2.4,-2.4}, {2.4,2.4}},
	flags = {"placeable-player", "player-creation"},
	minable = {mining_time = 0.5, result = "ad-dummy-harvester"},
	max_health = 1000,
	crafting_speed = 0.1,
	fixed_recipe = "ad-summoning-ritual",
	crafting_categories = {"ad-summoning"},
	source_inventory_size = 1,
	result_inventory_size = 1,
	ingredient_count = 4,
	energy_usage = "33.33MW",
	energy_source = {
		type = "burner",
		fuel_inventory_size = 1,
		fuel_category = "ad-drilling"
	},
	emissions_per_second = -0.1,
	active_energy_usage = "1J",
	lamp_energy_usage = "0J",
	rocket_entity = "ad-dummy-rocket",
	arm_02_right_animation = util.empty_sprite(1),
	arm_01_back_animation = util.empty_sprite(1),
	arm_03_front_animation = util.empty_sprite(1),
	shadow_sprite = util.empty_sprite(1),
	hole_sprite = util.empty_sprite(1),
	hole_light_sprite = util.empty_sprite(1),
	rocket_shadow_overlay_sprite = util.empty_sprite(1),
	rocket_glow_overlay_sprite = util.empty_sprite(1),
	door_back_sprite = util.empty_sprite(1),
	door_front_sprite = util.empty_sprite(1),
	base_day_sprite = util.empty_sprite(1),
	base_front_sprite = util.empty_sprite(1),
	red_lights_back_sprites = util.empty_sprite(1),
	red_lights_front_sprites = util.empty_sprite(1),
	hole_clipping_box = {{0,0},{0,0}},
	door_back_open_offset = {0,0},
	door_front_open_offset = {0,0},
	silo_fade_out_start_distance = 0,
	silo_fade_out_end_distance = 0,
	times_to_blink = 1,
	light_blinking_speed = 1,
	door_opening_speed = 1,
	rocket_parts_required = 1,
	rocket_rising_delay = 1,
	launch_wait_time = 1,
	rocket_result_inventory_size = 1,
	--raise_rocket_trigger = {type = "script", effect_id = "ad-summon"},
	resistances = {
		{
			type = "fire",
			percent = 70
		}
	},
	module_specification = {
		module_slots = 8
	},
	allowed_effects = {"consumption", "speed", "productivity", "pollution"}
}}