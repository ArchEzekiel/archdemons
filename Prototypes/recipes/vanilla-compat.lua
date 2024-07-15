--[[@as data.RecipePrototype]]
local alt_ammo_recipe = table.deepcopy(data.raw["recipe"]["firearm-magazine"])
alt_ammo_recipe.name = "ad-improved-firearm-magazine"
table.insert(alt_ammo_recipe.ingredients, {"ad-demon-essence",1})
alt_ammo_recipe.result_count = 4
data:extend{alt_ammo_recipe}

data.raw["recipe"]["military-science-pack"].ingredients[#data.raw["recipe"]["military-science-pack"].ingredients + 1] = {type = "item", name = "ad-demon-essence", amount = 5}
for x, y in pairs(data.raw["recipe"]["military-science-pack"].ingredients) do
    if y[1] == "stone-wall" then
        table.remove(data.raw["recipe"]["military-science-pack"].ingredients, x)
    end
end

--TODO: Make the table of loot modifyable to other mods, so that they can add their own custom loot
function CalculateDiff(inp)
    return {
        {
            item = "ad-demon-scale",
            probability = inp[1],
            count_max = 1
        },
        {
            item = "ad-demon-pincer",
            probability = inp[2],
            count_max = 1
        },
        {
            item = "ad-demon-essence",
            probability = inp[3],
            count_max = 1
        },
        {
            item = "ad-demon-brain",
            probability = inp[4],
            count_max = 1
        },
        {
            item = "ad-demon-heart",
            probability = inp[5],
            count_max = 1
        }
    }
end

function TableIns(key, tbl2, len)
    data.raw.unit[key].loot = data.raw.unit[key].loot or {}
    local loot = {}
    for i = 1, len do
        data.raw.unit[key].loot[#data.raw.unit[key].loot + 1] = tbl2[i]
    end
end

Noob_Diff = CalculateDiff({0.6, 0.3, 0.15, 0.1, 0.05})
Low_Diff = CalculateDiff({0.7, 0.35, 0.2, 0.15, 0.1})
Med_Diff = CalculateDiff({0.8, 0.6, 0.5, 0.3, 0.2})
High_Diff = CalculateDiff({0.85, 0.8, 0.7, 0.5, 0.3})
Boss_Diff = CalculateDiff({0.95, 0.8, 0.75, 0.6, 0.5})

TableIns("behemoth-biter", High_Diff, 5)
TableIns("behemoth-spitter", High_Diff, 5)
TableIns("big-biter", Med_Diff, 5)
TableIns("big-spitter", Med_Diff, 5)
TableIns("medium-biter", Low_Diff, 5)
TableIns("medium-spitter", Low_Diff, 5)
TableIns("small-biter", Noob_Diff, 5)
TableIns("small-spitter", Noob_Diff, 5)