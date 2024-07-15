local demon_essence_icons = {}
local demon_pincer_icons = {}
local demon_scale_icons = {}
for i = 1, 30 do
    local file = "00"
    if file.len(i) == 1 then
        file = file .. "0" .. i
    else
        file = file .. i
    end
    file = file .. ".png"
    table.insert(demon_essence_icons, {
        filename = "__archdemons__/Graphics/demon-essence/" .. file,
        size = 64,
        scale = 16.0/64.0
    })
end
for i = 1, 8 do
    local file = "000" .. i .. ".png"
    table.insert(demon_pincer_icons, {
        filename = "__archdemons__/Graphics/demon-pincer/" .. file,
        size = 64,
        scale = 16.0/64.0
    })
end
for i = 1, 12 do
    local file = "00"
    if file.len(i) == 1 then
        file = file .. "0" .. i
    else
        file = file .. i
    end
    local file = file .. ".png"
    table.insert(demon_scale_icons, {
        filename = "__archdemons__/Graphics/demon-scale/" .. file,
        size = 64,
        scale = 16/64
    })
end

data:extend({
    {
        type = "item",
        name = "ad-demon-essence",
        stack_size = 1000,
        icon = "__archdemons__/Graphics/demon-essence/0001.png",
        icon_size = 64,
        pictures = demon_essence_icons,
        fuel_value = "10MJ",
        fuel_category = "ad-essence",
        group = "intermediate-products",
        subgroup = "ad-part-crushing"
    },
	{
        type = "item",
        name = "ad-demon-heart",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-heart/icon.png",
        icon_size = 64,
        rocket_launch_product = {name = "ad-demon-essence", amount = 10},
        group = "intermediate-products",
        subgroup = "ad-part-crushing"
    },
    {
        type = "item",
        name = "ad-demon-pincer",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-pincer/0001.png",
        icon_size = 64,
        pictures = demon_pincer_icons,
        rocket_launch_product = {name = "ad-demon-essence", amount = 6},
        group = "intermediate-products",
        subgroup = "ad-part-crushing"
    },
    {
        type = "item",
        name = "ad-demon-brain",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-brain/icon.png",
        icon_size = 64,
        rocket_launch_product = {name = "ad-demon-essence", amount = 8},
        group = "intermediate-products",
        subgroup = "ad-part-crushing"
    },
    {
        type = "item",
        name = "ad-demon-scale",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-scale/0005.png",
        icon_size = 64,
        pictures = demon_scale_icons,
        rocket_launch_product = {name = "ad-demon-essence", amount = 4},
        group = "intermediate-products",
        subgroup = "ad-part-crushing"
    }
})