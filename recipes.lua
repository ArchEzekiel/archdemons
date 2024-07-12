local variable_name = { --WHY????
    --[[artificial portal
    {
        type = "recipe",
        name = "ad-artificial-portal",
        category = "crafting",
        subgroup = "production-machine",
        icon = "__archdemons__/Graphics/artificial-portal/icon.png",
        icon_size = 256,
        ingredients = {
            {"iron-plate",100},
            {"steel-plate",100},
            {"ad-portal-core",1},
            {"copper-cable",20}
        },
        enabled = true,
        result = "ad-artificial-portal"
    },]]
    --portal drill
    {
        type = "recipe",
        name = "ad-portal-drill",
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
        result = "ad-portal-drill"
    },
    --demonic artificer
    {
        type = "recipe",
        name = "ad-demonic-artificer",
        category = "crafting",
        subgroup = "production-machine",
        icon = "__archdemons__/Graphics/demonic-artificer/icon.png",
        icon_size = 256,
        ingredients = {{"ad-demon-heart",10},{"ad-demon-scale",50},{"ad-demon-essence",200},{"ad-demon-pincer",10}},
        enabled = true,
        result = "ad-demonic-artificer",
        energy_required=10
    },
    --solid processing unit
    {
        type = "recipe",
        name = "ad-solid-processing-unit",
        category = "crafting",
        subgroup = "production-machine",
        icon = "__archdemons__/Graphics/solid-processing-unit/icon.png",
        icon_size = 64,
        ingredients = {{"iron-plate",20},{"iron-gear-wheel",5}},
        enabled = true,
        result = "ad-solid-processing-unit",
        energy_required=10
    },
    --scale to essence
    {
        type = "recipe",
        name = "ad-basic-scale-to-essence",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/BasicScaleToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-scale",5}},
        enabled = true,
        results = {{type="item", name="ad-demon-essence",amount_min=0,amount_max=5}},
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[1]"
    },
    --pincer to essence
    {
        type = "recipe",
        name = "ad-basic-pincer-to-essence",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/BasicPincerToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-pincer",4}},
        enabled = true,
        results = {{type="item", name="ad-demon-essence", amount_min=0,amount_max=5}},
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[2]"
    },
    --brain to essence
    {
        type = "recipe",
        name = "ad-basic-brain-to-essence",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/BasicBrainToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-brain",3}},
        enabled = true,
        results = {{type="item", name="ad-demon-essence", amount_min=0,amount_max=5}},
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[3]"
    },
    --heart to essence
    {
        type = "recipe",
        name = "ad-basic-heart-to-essence",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/BasicHeartToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-heart",2}},
        enabled = true,
        results = {{type="item", name="ad-demon-essence", amount_min=0,amount_max=10}},
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[4]"
    },
    --essence to ores
    {
        type = "recipe",
        name = "ad-basic-essence-to-ores",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/EssenceToOresRecipe1.png",
        icon_size = 64,
        mipmaps = 4,
        ingredients = {{"ad-demon-essence",50}},
        enabled = true,
        results = {
            {type="item", name="iron-ore", amount_min=25,amount_max=75,},
            {type="item", name="copper-ore", amount_min=25,amount_max=75,},
            {type="item", name="coal", amount_min=25,amount_max=75,},
        },
        energy_required=10,
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[5]"
    },
    --essence to iron
    {
        type = "recipe",
        name = "ad-basic-essence-to-iron-ore",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/EssenceToIronRecipe1.png",
        icon_size = 64,
        mipmaps = 4,
        ingredients = {{"ad-demon-essence",50}},
        enabled = true,
        results = {
            {type="item", name="iron-ore", amount_min=50,amount_max=100,},
        },
        energy_required=10,
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[6]"
    },
    --essence to copper ore
    {
        type = "recipe",
        name = "ad-basic-essence-to-copper-ore",
        category = "ad-crushing",
        subgroup = "raw-resource",
        icon = "__archdemons__/Graphics/recipes/EssenceToCopperRecipe1.png",
        icon_size = 64,
        ingredients = {{"ad-demon-essence",50}},
        enabled = true,
        results = {
            {type="item", name="copper-ore", amount_min=50,amount_max=100,},
        },
        energy_required=10,
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[7]"
    },
    --portal core
    {
        type = "recipe",
        name = "ad-temp-portal-core-recipe",
        category = "crafting",
        subgroup = "intermediate-product",
        icon = "__archdemons__/Graphics/portal-core/icon.png",
        icon_size = 64,
        mipmaps = 4,
        ingredients = {
            {"ad-demon-heart",10},
            {"ad-demon-scale",50},
            {"ad-demon-essence",50}
        },
        enabled = true,
        result = "ad-portal-core",
        energy_required=10,
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-intermediate[1]"
    }
}

data:extend(variable_name)

data.raw["recipe"]["military-science-pack"].ingredients[#data.raw["recipe"]["military-science-pack"].ingredients + 1] = {type = "item", name = "ad-demon-essence", amount = 5}
for x, y in pairs(data.raw["recipe"]["military-science-pack"].ingredients) do
    if y[1] == "stone-wall" then
        table.remove(data.raw["recipe"]["military-science-pack"].ingredients, x)
    end
end