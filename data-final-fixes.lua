for x, _ in pairs(data.raw["resource"]) do
    data.raw["resource"][x].autoplace = nil
end
for x, _ in pairs(data.raw["unit-spawner"]) do
    data.raw["unit-spawner"][x].autoplace = nil
end
for x, _ in pairs(data.raw["turret"]) do
    if data.raw["turret"][x].autoplace.control == "enemy-base" then
        data.raw["turret"][x].autoplace = nil
    end
end