---Merges two shifts together
---@param shift_a Vector
---@param shift_b Vector
---@return Vector
function shift_merge(shift_a, shift_b)
    if not (shift_a and shift_b) then error("shift_merge(): Missing input") end
    return {x = shift_a.x + shift_b.x, y = shift_a.y + shift_b.y}
end