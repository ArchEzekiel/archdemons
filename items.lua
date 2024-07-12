---adds a glow layer to any item prototype.
---@param prototype data.ItemPrototype
make_item_glowing = function(prototype)
    if not prototype then
        error('No prototype provided')
    end
    if prototype.pictures then
        for _, picture in pairs(prototype.pictures) do
            picture.draw_as_glow = true
        end
        return
    end
    if prototype.icon and not prototype.icons then
        prototype.icons = {{icon = prototype.icon, icon_size = prototype.icon_size, icon_mipmaps = prototype.icon_mipmaps}}
        prototype.icon = nil
    end
    if not prototype.icons then
        error('No icon found for ' .. prototype.name)
    end
    local pictures = {}
    for _, picture in pairs(table.deepcopy(prototype.icons)) do
        picture.draw_as_glow = true
        local icon_size = picture.icon_size or prototype.icon_size
        picture.filename = picture.icon
        picture.shift = {0, 0}
        picture.width = icon_size
        picture.height = icon_size
        picture.scale = 16 / icon_size
        picture.icon = nil
        picture.icon_size = nil
        picture.icon_mipmaps = nil
        pictures[#pictures + 1] = picture
    end
    prototype.pictures = pictures
end

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
        name = "ad-drill-head-mk1",
        stack_size = 10,
        icon = "__archdemons__/Graphics/drill-heads/ad-drill.png",
        icon_size = 128,
        rocket_launch_product = {name = "ad-demon-essence", amount = 50}
    },
	{
        type = "item",
        name = "ad-demon-heart",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-heart/icon.png",
        icon_size = 64,
    },
	{
        type = "item",
        name = "ad-dummy-rocket",
        stack_size = 1,
        icon = "__archdemons__/Graphics/nil.png",
        icon_size = 1
    },
    {
        type = "item",
        name = "ad-demon-essence",
        stack_size = 200,
        icon = "__archdemons__/Graphics/demon-essence/0001.png",
        icon_size = 64,
        pictures = demon_essence_icons,
        fuel_value = "10MJ",
        fuel_category = "ad-essence"
    },
    {
        type = "item",
        name = "ad-demon-pincer",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-pincer/0001.png",
        icon_size = 64,
        pictures = demon_pincer_icons,
    },
    {
        type = "item",
        name = "ad-demon-brain",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-brain/icon.png",
        icon_size = 64,
    },
    {
        type = "item",
        name = "ad-demon-scale",
        stack_size = 50,
        icon = "__archdemons__/Graphics/demon-scale/0005.png",
        icon_size = 64,
        pictures = demon_scale_icons,
    },
    {
        type = "item",
        name = "ad-portal-core",
        stack_size = 50,
        icon = "__archdemons__/Graphics/portal-core/icon.png",
        icon_size = 64,
        mipmaps = 4
    }
})

make_item_glowing(data.raw.item["ad-drill-head-mk1"])