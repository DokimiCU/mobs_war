
local path = minetest.get_modpath("mobs_war")

dofile(path .. "/weapons.lua")
dofile(path .. "/weapons_player.lua")
dofile(path .. "/spawn.lua")
dofile(path .. "/nodes.lua")

dofile(path .. "/shooter.lua")
dofile(path .. "/defender.lua")
dofile(path .. "/shooter_bazooka.lua")
dofile(path .. "/defender_bazooka.lua")
dofile(path .. "/shooter_suicide.lua")
dofile(path .. "/defender_sniper.lua")
dofile(path .. "/defender_cannon.lua")
dofile(path .. "/shooter_cannon.lua")
dofile(path .. "/defender_flamethrower.lua")
dofile(path .. "/shooter_flamethrower.lua")
dofile(path .. "/defender_vehicle.lua")
dofile(path .. "/shooter_vehicle.lua")
dofile(path .. "/defender_helicopter.lua")
dofile(path .. "/shooter_helicopter.lua")
dofile(path .. "/defender_engineer.lua")
dofile(path .. "/shooter_engineer.lua")
dofile(path .. "/defender_tank.lua")
dofile(path .. "/shooter_tank.lua")
dofile(path .. "/defender_autocannon.lua")
dofile(path .. "/shooter_autocannon.lua")
dofile(path .. "/defender_drone.lua")
dofile(path .. "/shooter_drone.lua")




print ("[MOD] Mobs Redo 'War' loaded")


--Mob lists

local defenders = {"player", "mobs_war:defender", "mobs_war:defender_bazooka", "mobs_war:defender_cannon", "mobs_war:defender_sniper", "mobs_war:defender_flamethrower", "mobs_war:defender_vehicle", "mobs_war:defender_helicopter", "mobs_war:defender_engineer", "mobs_war:defender_tank", "mobs_war:defender_autocannon", "mobs_war:defender_drone"}

local shooters = {"mobs_war:shooter", "mobs_war:shooter_bazooka", "mobs_war:shooter_suicide", "mobs_war:shooter_cannon", "mobs_war:shooter_flamethrower", "mobs_war:shooter_vehicle", "mobs_war:shooter_helicopter", "mobs_war:shooter", "mobs_war:shooter_tank", "mobs_war:shooter_autocannon", "mobs_war:shooter_drone"}

  

------------------------------------------------------------------MARKER NODES
-- So that the sides can gain and lose territory
--placed in air by mobs
--spawning can only occur near their markers
-------------------------------------------------------------

minetest.register_node("mobs_war:marker_defender", {
	description = "Marker Defender",
	tiles = {"mobs_war_defender_marker.png"},
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	protected = true,
	on_blast = function(pos)
	end,
	})

minetest.register_node("mobs_war:marker_shooter", {
	description = "Marker Shooter",
	drawtype = "airlike",
	tiles = {"mobs_war_shooter_marker.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	protected = true,
	on_blast = function(pos)
	end,
	})


--DISAPPATE MARKERS
--so that ground can be lost

minetest.register_abm{
     	nodenames = {"mobs_war:marker_defender"},
	interval = 60,
	chance = 240,
	catch_up = false,
	action = function(pos)

		minetest.set_node(pos, {name = "air"})
	end
	}


minetest.register_abm{
     	nodenames = {"mobs_war:marker_shooter"},
	interval = 60,
	chance = 240,
	catch_up = false,
	action = function(pos)

		minetest.set_node(pos, {name = "air"})
	end
	}


-- SET MARKER AROUND PLAYER if armed with friendly light arms



--set in air around player
minetest.register_abm{
    nodenames = {"air"},
    interval = 5,
    chance = 1,
    action = function(pos, node, active_object_count, active_object_count_wider)
			
	local objs = minetest.env:get_objects_inside_radius(pos, 1)
		for k, player in pairs(objs) do

		if player:get_player_name() ~=nil then

		local pname = player:get_player_name()
		local inv = minetest.get_inventory({type="player", name=pname})
		if inv ~=nil then
		if inv:contains_item("main", "mobs_war:defender_machinegun") or inv:contains_item("main", "mobs_war:defender_rifle") then

	
		minetest.set_node(pos, {name = "mobs_war:marker_defender"}) 
	end
	end
	end		
	end
	
end,
}

--set in hostile around player
minetest.register_abm{
    nodenames = {"mobs_war:marker_shooter"},
    interval = 5,
    chance = 1,
    action = function(pos, node, active_object_count, active_object_count_wider)
	local objs = minetest.env:get_objects_inside_radius(pos, 1)
		for k, player in pairs(objs) do

		if player:get_player_name() ~=nil then

		local pname = player:get_player_name()
		local inv = minetest.get_inventory({type="player", name=pname})
		if inv ~=nil then
		if inv:contains_item("main", "mobs_war:defender_machinegun") or inv:contains_item("main", "mobs_war:defender_rifle") then

	
		minetest.set_node(pos, {name = "mobs_war:marker_defender"}) 
	end
	end
	end		
	end
	
end,
}



