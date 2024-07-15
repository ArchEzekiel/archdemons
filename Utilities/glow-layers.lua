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