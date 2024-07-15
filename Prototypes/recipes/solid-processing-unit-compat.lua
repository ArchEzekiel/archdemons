local function calculateResult(input, output)
    output = output or {}
    for x, y in pairs(input) do
        local scale = y.scale / 100
        table.insert(output,
        {
            type        = y.type,
            name        = x,
            amount_min  = math.ceil(50 * scale),
            amount_max  = math.ceil(100 * scale)
        })
    end
    return output
end

for x, _ in pairs(Arch_Demons.excluded_resources) do
    Arch_Demons.affected_resources[x] = nil
end
local gen_results = calculateResult(Arch_Demons.affected_resources)
--essence to ores
local general_essence_to_ores =
{
    type = "recipe",
    name = "ad-basic-essence-to-ores",
    category = "ad-crushing",
    subgroup = "raw-resource",
    icon = "__archdemons__/Graphics/recipes/basic-essence-to-ores.png",
    icon_size = 64,
    mipmaps = 4,
    ingredients = {{"ad-demon-essence",50}},
    enabled = true,
    hidden = false,
    results = gen_results,
    energy_required=10,
    show_amount_in_title = false,
    always_show_products = true,
    order="ad-essence[1]"
}
data:extend{general_essence_to_ores}

local exclusive_results = calculateResult(Arch_Demons.exclusive_resources)
exclusive_results = calculateResult(Arch_Demons.excluded_resources, exclusive_results)
local order = 2
for _, x in pairs(exclusive_results) do
    data:extend
        {{
            type = "recipe",
            name = "ad-basic-essence-to-" .. x.name,
            category = "ad-crushing",
            subgroup = "raw-resource",
            --[[icon = "__archdemons__/Graphics/recipes/basic-essence-to-"..x.name".png",
            icon_size = 64,]]
            mipmaps = 4,
            ingredients = {{"ad-demon-essence",50}},
            enabled = true,
            hidden = false,
            results = {x},
            energy_required=10,
            show_amount_in_title = false,
            always_show_products = true,
            order="ad-essence["..order.."]"
        }}
    order = order + 1
end