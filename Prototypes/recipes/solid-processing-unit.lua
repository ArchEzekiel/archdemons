recipes = {
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
}}

data:extend(recipes)