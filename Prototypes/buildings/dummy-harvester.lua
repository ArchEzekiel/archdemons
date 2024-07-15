--pls ignore my stupidity
local frames = {150}
local idle_frames = {150}
for i = 1, 149 do
	frames[#frames + 1] = i
	idle_frames[#frames + 1] = 150
end

local dummy_drill = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
dummy_drill.name = "ad-dummy-harvester"
dummy_drill.icon = "__archdemons__/Graphics/artificial-portal/icon.png"
dummy_drill.icon_size = 256
dummy_drill.icon_mipmaps = nil
dummy_drill.integration_patch = nil
dummy_drill.graphics_set = {
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

dummy_drill.collision_box = {{-2.4,-2.4}, {2.4,2.4}}
dummy_drill.selection_box = {{-2.4,-2.4}, {2.4,2.4}}
dummy_drill.minable = {mining_time = 0.5, result = "ad-portal-harvester"}
dummy_drill.max_health = 1000
dummy_drill.vector_to_place_result = {0,0}
dummy_drill.resource_searching_radius = 0.49
dummy_drill.energy_usage = "750kW"
dummy_drill.mining_speed = 0.001
dummy_drill.resource_categories = {"ad-fissure"}
dummy_drill.resistances = {
	{
		type = "fire",
		percent = 70
	}
}
dummy_drill.module_specification = {
	module_slots = 8
}
dummy_drill.input_fluid_box = nil

local dummy_drill_item =
{
    type = "item",
    name = "ad-dummy-harvester",
    stack_size = 5,
    icon = "__archdemons__/Graphics/artificial-portal/icon.png",
    icon_size = 256,
    place_result = "ad-dummy-harvester"
}

local dummy_drill_recipe = 
{
	type = "recipe",
	name = "ad-dummy-harvester",
	category = "crafting",
	subgroup = "production-machine",
	icon = "__archdemons__/Graphics/artificial-portal/icon.png",
	icon_size = 256,
	ingredients = {
		{"iron-plate",100},
		{"steel-plate",100},
		{"copper-cable",20}
	},
	enabled = true,
	result = "ad-dummy-harvester"
}
--Portal Drill
data:extend({dummy_drill, dummy_drill_item, dummy_drill_recipe})