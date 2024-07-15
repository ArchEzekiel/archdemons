--[[@as data.RecipePrototype]]
local alt_ammo_recipe = table.deepcopy(data.raw["recipe"]["firearm-magazine"])
alt_ammo_recipe.name = "ad-improved-firearm-magazine"
table.insert(alt_ammo_recipe.ingredients, {"ad-demon-essence",1})
alt_ammo_recipe.result_count = 4

data:extend{alt_ammo_recipe}

---@type data.RecipePrototype[]
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
    --drill head mk1
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
        result = "ad-portal-drill"
    },
    --dummy summoning
    {
        type = "recipe",
        name = "ad-summoning-ritual",
        category = "ad-summoning",
        subgroup = "production-machine",
        icon = "__archdemons__/Graphics/nil.png",
        icon_size = 1,
        ingredients = {},
        results = {},
        enabled = true,
        hidden = false,
        energy_required=10
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
        subgroup = "ad-part-crushing",
        icon = "__archdemons__/Graphics/recipes/BasicScaleToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-scale",5}},
        enabled = true,
        hidden = false,
        energy_required = 1,
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
        subgroup = "ad-part-crushing",
        icon = "__archdemons__/Graphics/recipes/BasicPincerToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-pincer",4}},
        enabled = true,
        hidden = false,
        energy_required = 1,
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
        subgroup = "ad-part-crushing",
        icon = "__archdemons__/Graphics/recipes/BasicBrainToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-brain",3}},
        enabled = true,
        hidden = false,
        energy_required = 1,
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
        subgroup = "ad-part-crushing",
        icon = "__archdemons__/Graphics/recipes/BasicHeartToEssence.png",
        icon_size = 64,
        ingredients = {{"ad-demon-heart",2}},
        enabled = true,
        hidden = false,
        energy_required = 1,
        results = {{type="item", name="ad-demon-essence", amount_min=0,amount_max=10}},
        show_amount_in_title = false,
        always_show_products = true,
        order="ad-essence[4]"
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
        hidden = false,
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