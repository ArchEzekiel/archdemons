--pls ignore my stupidity
local frames = {150}
local idle_frames = {150}
for i = 1, 149 do
	frames[#frames + 1] = i
	idle_frames[#frames + 1] = 150
end

local drill = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
drill.name = "ad-portal-drill"
drill.icon = "__archdemons__/Graphics/artificial-portal/icon.png"
drill.icon_size = 256
drill.icon_mipmaps = nil
drill.integration_patch = nil
drill.graphics_set = {
	animation = {
		north = {
			layers = {
				{
					filename = "__archdemons__/Graphics/artificial-portal/entity.png",
					frame_count = 150,
					frame_sequence = frames,
					line_length = 10,
					animation_speed = 0.5,
					size = 256,
					shift = {0,0},
					scale = 0.6
				},
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
				}
			}
		}
	}
}

drill.collision_box = {{-2.4,-2.4}, {2.4,2.4}}
drill.selection_box = {{-2.4,-2.4}, {2.4,2.4}}
drill.minable = {mining_time = 0.5, result = "ad-portal-drill"}
drill.max_health = 1000
drill.vector_to_place_result = {0,0}
drill.resource_searching_radius = 2.4
drill.energy_usage = "750kW"
drill.mining_speed = 1
drill.resource_categories = {"ad-fissure"}
drill.resistances = {
	{
		type = "fire",
		percent = 70
	}
}
drill.module_specification = {
	module_slots = 8
}
drill.input_fluid_box = nil
--Portal Drill
data:extend({drill})

data:extend({
	{
		type = "item",
		name = "ad-portal-drill",
		stack_size = 5,
		icon = "__archdemons__/Graphics/artificial-portal/icon.png",
		icon_size = 256,
		place_result = "ad-portal-drill"
	},
	--Demonic Artificer
	{
		type = "item",
		name = "ad-demonic-artificer",
		stack_size = 10,
		icon = "__archdemons__/Graphics/demonic-artificer/icon.png",
		icon_size = 256,
		place_result = "ad-demonic-artificer"
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
	},
	--Solid Processing Unit
	
	{
		type = "item",
		name = "ad-solid-processing-unit",
		stack_size = 50,
		icon = "__archdemons__/Graphics/solid-processing-unit/icon.png",
		icon_size = 64,
		place_result = "ad-solid-processing-unit"
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
		crafting_speed = 2,
		crafting_categories = {"ad-crushing"},
		energy_source = {
			type = "electric",
			buffer_capacity = "2MJ",
			usage_priority = "secondary-input"
		},
		fluid_boxes =
		{
			{
				production_type = "output",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type = "output", position = {0, 1.5} }},
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
	}
	--[[Artificial Portal--
	{
		type = "item",
		name = "ad-artificial-portal",
		stack_size = 5,
		icon = "__archdemons__/Graphics/artificial-portal/icon.png",
		icon_size = 256,
		place_result = "ad-artificial-portal"
	},
	{
		type = "rocket-silo",
		name = "ad-artificial-portal",
		icon = "__archdemons__/Graphics/artificial-portal/icon.png",
		icon_size = 256,
		subgroup = "production-machine",
		animation = {
			layers = {
				{
					filename = "__archdemons__/Graphics/artificial-portal/entity.png",
					frame_count = 150,
					frame_sequence = frames,
					line_length = 10,
					animation_speed = 0.5,
					size = 256,
					shift = {0,0},
					scale = 0.6
				},
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
				}
			}
		},
		collision_box = {{-2.4,-2.4}, {2.4,2.4}},
		selection_box = {{-2.4,-2.4}, {2.4,2.4}},
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "ad-artificial-portal"},
		max_health = 1000,
		crafting_speed = 1,
		fixed_recipe = "ad-summoning-ritual",
		crafting_categories = {"ad-summoning"},
		source_inventory_size = 1,
		result_inventory_size = 1,
		ingredient_count = 4,
		energy_usage = "750kW",
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input"
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
	},]]
})