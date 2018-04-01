--make spawning favour the enemy to compensate for spending more time in friendly territory
local base_spawn_rate = minetest.setting_get("mobs_war_friendly_rate") or 5500

local base_spawn_rate_hostile = minetest.setting_get("mobs_war_hostile_rate") or 4000

local spawn_on = {"default:dirt", "default:dirt_with_grass", "default:dirt_with_dry_grass", "default:dirt_with_snow", "default:dirt_with_rainforest_litter", "default:sand",  "default:desert_sand", "default:silver_sand", "default:snow", "default:snowblock", "default:gravel", "default:mossycobble",}

---not currently compatible with squaresville...markers cant get created by regular means...
if minetest.get_modpath("squaresville") then
	spawn_on = {"default:dirt", "default:dirt_with_grass", "default:dirt_with_dry_grass", "default:dirt_with_snow", "default:dirt_with_rainforest_litter", "default:sand",  "default:desert_sand", "default:silver_sand", "default:snow", "default:snowblock", "default:gravel", "default:mossycobble", "squaresville:roof", "squaresville:sidewalk", "squaresville:road", "squaresville:floor_ceiling", "squaresville:concrete_broken", "squaresville:concrete"}
end

--Destructive and large mobs only spawn at front lines i.e. neighbouring enemy
-- DEFENDERS


mobs:spawn({
	name = "mobs_war:defender_drone",
	nodes = "mobs_war:drone_launcher_defender",
	chance = 5,
	active_object_count = 5,
	max_height = 20000,
})



mobs:spawn({
	name = "mobs_war:defender",
	nodes = "mobs_war:marker_defender",
	chance = base_spawn_rate,
	active_object_count = 1,
	max_height = 20000,
})


mobs:spawn({
	name = "mobs_war:defender_cannon",
	nodes = "mobs_war:marker_defender",
	chance = base_spawn_rate * 2,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:defender_bazooka",
	nodes = "mobs_war:marker_defender",
	neighbors = "mobs_war:marker_shooter",
	chance = base_spawn_rate * 3,
	active_object_count = 1,
	max_height = 20000,
})


mobs:spawn({
	name = "mobs_war:defender_sniper",
	nodes = "mobs_war:marker_defender",
	chance = base_spawn_rate * 5,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:defender_flamethrower",
	nodes = "mobs_war:marker_defender",
	neighbors = "mobs_war:marker_shooter",
	chance = base_spawn_rate * 8,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:defender_vehicle",
	nodes = "mobs_war:marker_defender",
	neighbors = "mobs_war:marker_shooter",
	chance = base_spawn_rate * 8,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:defender_helicopter",
	nodes = "mobs_war:marker_defender",
	neighbors = "mobs_war:marker_shooter",
	chance = base_spawn_rate * 13,
	active_object_count = 1,
	max_height = 20000,
	min_height = 10,
})

mobs:spawn({
	name = "mobs_war:defender_engineer",
	nodes = "mobs_war:marker_defender",
	neighbors = "mobs_war:marker_shooter",
	chance = base_spawn_rate * 13,
	active_object_count = 1,
	max_height = 20000,
})


mobs:spawn({
	name = "mobs_war:defender_tank",
	nodes = "mobs_war:marker_defender",
	neighbors = "mobs_war:marker_shooter",
	chance = base_spawn_rate * 21,
	active_object_count = 1,
	max_height = 20000,
})


--SHOOTERS


mobs:spawn({
	name = "mobs_war:shooter_drone",
	nodes = "mobs_war:drone_launcher_shooter",
	chance = 5,
	active_object_count = 5,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:shooter",
	nodes = "mobs_war:marker_shooter",
	chance = base_spawn_rate_hostile,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:shooter_cannon",
	nodes = "mobs_war:marker_shooter",
	chance = base_spawn_rate_hostile * 2,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:shooter_bazooka",
	nodes = "mobs_war:marker_shooter",
	neighbors = "mobs_war:marker_defender",
	chance = base_spawn_rate_hostile * 3,
	active_object_count = 1,
	max_height = 20000,
	})



mobs:spawn({
	name = "mobs_war:shooter_suicide",
	nodes = "mobs_war:marker_shooter",
	chance = base_spawn_rate_hostile * 5,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:shooter_flamethrower",
	nodes = "mobs_war:marker_shooter",
	neighbors = "mobs_war:marker_defender",
	chance = base_spawn_rate_hostile * 8,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:shooter_vehicle",
	nodes = "mobs_war:marker_shooter",
	neighbors = "mobs_war:marker_defender",
	chance = base_spawn_rate_hostile * 8,
	active_object_count = 1,
	max_height = 20000,
})


mobs:spawn({
	name = "mobs_war:shooter_helicopter",
	nodes = "mobs_war:marker_shooter",
	neighbors = "mobs_war:marker_defender",
	chance = base_spawn_rate_hostile * 11,
	active_object_count = 1,
	max_height = 20000,
	min_height = 10,
})

--make a little more common than defender
mobs:spawn({
	name = "mobs_war:shooter_engineer",
	nodes = "mobs_war:marker_shooter",
	neighbors = "mobs_war:marker_defender",
	chance = base_spawn_rate_hostile * 8,
	active_object_count = 1,
	max_height = 20000,
})

mobs:spawn({
	name = "mobs_war:shooter_tank",
	nodes = "mobs_war:marker_shooter",
	neighbors = "mobs_war:marker_defender",
	chance = base_spawn_rate_hostile * 20,
	active_object_count = 1,
	max_height = 20000,
})

--MAP SPAWN MARKERS
--Main blocks... divides up the landscape into seperate zones
--give shooters a slight advantage for a challange...

--shooter
--give them larger areas to compensate for player being better at taking territory
minetest.register_decoration({
		deco_type = "simple",
		place_on = spawn_on,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 5,
			spread = {x = 300, y = 300, z = 300},
			seed = 666,
			octaves = 4,
			persist = 1
		},
		y_min = -10,
		y_max = 31000,
		decoration = "mobs_war:marker_shooter",
	})


--defender
minetest.register_decoration({
		deco_type = "simple",
		place_on = spawn_on,
		noise_params = {
			offset = 0,
			scale = 3,
			spread = {x = 250, y = 200, z = 250},
			seed = 777,
			octaves = 4,
			persist = 1
		},
		y_min = -10,
		y_max = 31000,
		decoration = "mobs_war:marker_defender",
	})


--Rogues... to scatter through no man's lands and infiltrate
--defender
minetest.register_decoration({
		deco_type = "simple",
		place_on = spawn_on,
		noise_params = {
			offset = 0,
			scale = 0.05,
			spread = {x = 300, y = 300, z = 300},
			seed = 777,
			octaves = 2,
			persist = 0.1
		},
		y_min = -20,
		y_max = 31000,
		decoration = "mobs_war:marker_defender",
	})

--shooter
minetest.register_decoration({
		deco_type = "simple",
		place_on = spawn_on,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.05,
			spread = {x = 300, y = 300, z = 300},
			seed = 666,
			octaves = 2,
			persist = 0.1
		},
		y_min = -20,
		y_max = 31000,
		decoration = "mobs_war:marker_shooter",
	})

--shooter Drones
minetest.register_decoration({
		deco_type = "simple",
		place_on = spawn_on,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.004,
			spread = {x = 300, y = 300, z = 300},
			seed = 666,
			octaves = 1,
			persist = 0.1
		},
		y_min = -20,
		y_max = 31000,
		decoration = "mobs_war:drone_launcher_shooter",
	})







-------------------------------------------------------------
---BUILDINGS
------------------------------------------------------------

local spawn_on_building = {"default:dirt", "default:dirt_with_grass", "default:dirt_with_dry_grass", "default:dirt_with_snow", "default:dirt_with_rainforest_litter", "default:sand",  "default:desert_sand", "default:silver_sand", "default:snow", "default:snowblock",}


---Sandbag Cross
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 550, y = 250, z = 550},
			seed = 6661,
			octaves = 1,
			persist = 0.45
		},
		y_min = -1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bag_crosswire.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---Sandbag house
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 550, y = 250, z = 550},
			seed = 7772,
			octaves = 1,
			persist = 0.45
		},
		y_min = -1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bag_house.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---Sandbag pit
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 550, y = 250, z = 550},
			seed = 6663,
			octaves = 2,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bag_pit.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})

---Sandbag pit covered
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 550, y = 250, z = 550},
			seed = 7774,
			octaves = 2,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bag_pit_covered.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---Sandbag pit covered large
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 6665,
			octaves = 2,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bag_pit_covered_large.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---Sandbag trench
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0002,
			spread = {x = 250, y = 250, z = 250},
			seed = 7776,
			octaves = 2,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bag_trench.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker 1
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 6667,
			octaves = 1,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_1.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker 2
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 7778,
			octaves = 1,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_2.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker 3
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 6669,
			octaves = 1,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_3.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker pillbox 1
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 77710,
			octaves = 1,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_pillbox_1.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker pillbox 2
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 66611,
			octaves = 1,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_pillbox_2.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker tower
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 77712,
			octaves = 1,
			persist = 0.45
		},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_tower.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker underground
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 250, z = 550},
			seed = 66613,
			octaves = 1,
			persist = 0.45
		},
		y_min = -20,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_underground.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker underground large
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 550, z = 550},
			seed = 77714,
			octaves = 1,
			persist = 0.45
		},
		y_min = -20,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_underground_large.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})


---bunker underground lit
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = spawn_on_building,
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.0001,
			spread = {x = 550, y = 550, z = 550},
			seed = 66615,
			octaves = 1,
			persist = 0.45
		},
		y_min = -20,
		y_max = 31000,
		schematic = minetest.get_modpath("mobs_war") .. "/schematics/bunker_underground_lit.mts",
		flags = {place_center_x = true, place_center_y = true, place_center_z = true, force_placement = true},
	})