require("utilities.glow-layers")

data:extend{
    {---@as data.ItemPrototype
        type = "item",
        name = "ad-drill-head-mk1",
        stack_size = 10,
        icon = "__archdemons__/Graphics/drill-heads/ad-drill.png",
        icon_size = 128,
        fuel_value = "66.6MJ",
        fuel_category = "ad-drilling",
        group = "intermediate-products"
    },
    {
        type = "recipe",
        name = "ad-drill-head-mk1",
        category = "crafting",
        subgroup = "production-machine",
        icon = "__archdemons__/Graphics/drill-heads/ad-drill.png",
        icon_size = 128,
        ingredients = {
            {"iron-plate",10},
            {"steel-plate",2},
            {"ad-demon-essence",5},
            {"ad-demon-pincer",2}
        },
        enabled = true,
        result = "ad-drill-head-mk1"
    }
}

make_item_glowing(data.raw.item["ad-drill-head-mk1"])