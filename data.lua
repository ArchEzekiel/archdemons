require("Prototypes.buildings.demonic-artificer")
require("Prototypes.buildings.dummy-harvester")
require("Prototypes.buildings.portal-harvester")
--require("Prototypes.buildings.solid-processing-unit") Deprecated
require("Prototypes.buildings.crust-cracker")
require("prototypes.buildings.essence-manipulator")

require("Prototypes.items.drill-head-mk1")
require("Prototypes.items.mob-drops")

require("Prototypes.recipes.solid-processing-unit")
require("Prototypes.recipes.vanilla-compat")

require("Prototypes.resources.portal-fissure")

require("Prototypes.categories")

---Arch_Demons global table containing variables and functions intended for compatability
Arch_Demons =
{
  ---list of things that get exclusive recipes but are less essence efficient
  ---@type table<string, table<string, integer>>
  exclusive_resources = {},
  ---list of things that are also exclusive but arent in the "mix" recipe 
  ---@type table<string, table<string, integer>>
  excluded_resources  = {},
  ---list of all affected resources
  ---@type table<string, table<string, integer>>
  affected_resources  = {},

  ---initializing global function to be used to add resources to different resource tables, table format is as follows: 
  ---["resource-name"] = {type, scale}
  ---@param t table exclusive_resources, excluded_resources, or affected_resources are the intended tables
  ---@param resource_name string name of resource being added
  ---@param type string type of resource - "fluid" or "item" only
  ---@param scale int scale of output, 100 equals unchanged from my default
  add_resource = function(t, resource_name, type, scale)
    if type ~= "fluid" and type ~= "item" then error("add_resource() only takes \"fluid\" or \"item\" as inputs") end
    t[resource_name] = {type = type, scale = scale}
  end
}

Arch_Demons.add_resource(Arch_Demons.exclusive_resources, "iron-ore", "item", 100)
Arch_Demons.add_resource(Arch_Demons.exclusive_resources, "copper-ore", "item", 100)

Arch_Demons.add_resource(Arch_Demons.excluded_resources, "uranium-ore", "item", 80)
Arch_Demons.add_resource(Arch_Demons.excluded_resources, "crude-oil", "fluid", 100)

Arch_Demons.add_resource(Arch_Demons.affected_resources, "iron-ore", "item", 100)
Arch_Demons.add_resource(Arch_Demons.affected_resources, "copper-ore", "item", 100)
Arch_Demons.add_resource(Arch_Demons.affected_resources, "uranium-ore", "item", 80)
Arch_Demons.add_resource(Arch_Demons.affected_resources, "crude-oil", "fluid", 100)
Arch_Demons.add_resource(Arch_Demons.affected_resources, "stone", "item", 100)
Arch_Demons.add_resource(Arch_Demons.affected_resources, "coal", "item", 100)
