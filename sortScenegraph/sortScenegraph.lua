-- Author:[NMC]T-Bone
-- Name:sortScenegraph
-- Description:Sort all children objects of selected object alphabeticaly.
-- Icon:iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAMxJREFUeNpiZsAECkC8HogTgPgjEN9AEi+Ash8w4AEgRf+B+D7UIBhwgIo3ICtmwmJAPNSGDUAcAMQC+GxjwuJ8AyD+gKQxgBQDYIoNoGEAAv6kGBAPpRmh+AAhb7Cg8Q3R+I4MBAATA4Vg8BnQAE0syNiBFAMWQAMuEJoWLkAxLH2AgDwSGysARdl5IH6PpNABzVXzSdEMA/Ohmt/jSxf9UEXroeHRAHU+LJm/R8qRYMCMZoAHEP8AYg6oBhA+CMQvoGFyExpOcAAQYADNCC5aBHp2kwAAAABJRU5ErkJggg==
-- Hide: no


--- Store children in a table
local function reorderChildren(parent)
    local numChildren = getNumOfChildren(parent)
    local children = {}

    for i = 0, numChildren-1 do
        local childID = getChildAt(parent, i)
        local childName = getName(childID)
        table.insert(children, {id = childID, name = childName})
    end

    -- Sorting the children by name
    table.sort(children, function(a, b)
        return a.name < b.name
    end)

    -- Detach and then reattach children in the sorted order
    for i, child in ipairs(children) do
        unlink(child.id)
        link(parent, child.id)
    end
end

local nodeParent = getSelection(0)
if nodeParent == 0 then
    print("Select 1 object")
    return
end
reorderChildren(nodeParent)
