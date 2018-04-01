-------------------------------------------------------------
--CORPSE
--Bones:Bones don't blow up so give weird looking results
--use substitute instead

minetest.register_node("mobs_war:mobs_war_corpse", {
	description = "Corpse",
	tiles = {
		"mobs_war_corpse_top.png^[transform2",
		"mobs_war_corpse_bottom.png",
		"mobs_war_corpse_side.png",
		"mobs_war_corpse_side.png",
		"mobs_war_corpse_rear.png",
		"mobs_war_corpse_front.png"
	},
	paramtype2 = "facedir",
	groups = {dig_immediate = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
	})





--NODES For Launcher

minetest.register_node("mobs_war:drone_launcher_defender", {
	description = "Defender Drone Launcher",
	tiles = {"mobs_war_drone_launcher_top.png", "mobs_war_drone_launcher_top.png", "mobs_war_drone_launcher.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 1, level = 2},
	})



minetest.register_node("mobs_war:drone_launcher_shooter", {
	description = "Shooter Drone Launcher",
	tiles = {"mobs_war_drone_launcher_top.png", "mobs_war_drone_launcher_top.png", "mobs_war_drone_launcher_shooter.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {cracky = 1, level = 2},
	})



---Craft enemy drone launcher into friendly

minetest.register_craft({
	output = "mobs_war:drone_launcher_defender",
	recipe = {{"mobs_war:drone_launcher_shooter"}}
})


--BUIDLING NODES
--Bunker

minetest.register_node("mobs_war:bunker", {
	description = "Bunker Concrete",
	tiles = {"mobs_war_bunker.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 3, level = 2},
	on_blast = function(pos)
		minetest.set_node(pos, {name = "mobs_war:bunker_weak"})
	end,
})

--Bunker weak
minetest.register_node("mobs_war:bunker_weak", {
	description = "Bunker Concrete (weakened)",
	tiles = {"mobs_war_bunker_weak.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 3},
	on_blast = function(pos)
		minetest.set_node(pos, {name = "mobs_war:bunker_damaged"})
	end,
})

--Bunker damaged
minetest.register_node("mobs_war:bunker_damaged", {
	description = "Bunker Concrete (damaged)",
	tiles = {"mobs_war_bunker_damaged.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 2, stone = 1},
	on_blast = function(pos)
		minetest.set_node(pos, {name = "mobs_war:bunker_badly_damaged"})
	end,
})


--Bunker badly damaged
minetest.register_node("mobs_war:bunker_badly_damaged", {
	description = "Bunker Concrete (badly damaged)",
	tiles = {"mobs_war_bunker_badly_damaged.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, stone = 1},
	on_blast = function(pos)
		minetest.set_node(pos, {name = "default:gravel"})
	end,
})


---Craft bunker

minetest.register_craft({
	output = "mobs_war:bunker 6",
	recipe = {{"group:stone"}, {"group:sand"}, {"default:gravel"}}
})



--Barbed Wire
minetest.register_node("mobs_war:wire", {
	description = "Barbed Wire",
	drawtype = "firelike",
	paramtype = "light",
	tiles = {"mobs_war_wire.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {snappy = 3},
	walkable = false,
	damage_per_second = 1,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
		},
	})


---Craft wire

minetest.register_craft({
	output = "mobs_war:wire 16",
	recipe = {{"default:steel_ingot"}}
})



--Sandbags

minetest.register_node("mobs_war:sandbags", {
	description = "Sandbags",
	tiles = {"mobs_war_sandbags.png"},
	sounds = default.node_sound_sand_defaults(),
	groups = {crumbly = 3, falling_node = 1},
	on_blast = function(pos)
		minetest.set_node(pos, {name = "default:sand"})
	end,
})


---Craft sandbags

minetest.register_craft({
	output = "mobs_war:sandbags 16",
	recipe = {{"group:sand"}, {"wool:wool"}}
})


