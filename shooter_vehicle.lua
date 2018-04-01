

mobs:register_mob("mobs_war:shooter_vehicle", {
	type = "monster",
	passive = false,
	damage = 3,
	pathfinding = 1,
	attack_type = "shoot",
	group_attack = true,
	specific_attack = defenders,
	reach = 2,
	shoot_interval = 0.1,
	arrow = "mobs_war:cannon_shot",
	shoot_offset = 1,
	hp_min = 220,
	hp_max = 550,
	armor = 500,
	collisionbox = {-1.7, 0, -1.7, 1.7, 1.7, 1.7},
	visual = "mesh",
	mesh = "ute.b3d",
	textures = {"mobs_war_vehicles_ute_shooter.png"},
	--blood_texture = "mobs_blood.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_war_engine",
		war_cry = "mobs_war_engine",
		death = "mobs_war_explode",
		attack = "mobs_war_engine",
		shoot_attack = "mobs_war_cannon5",
		distance = 50,
	},
	replace_what = {
		{"air", "mobs_war:marker_shooter", 0},
		{"mobs_war:marker_defender", "mobs_war:marker_shooter", 0},
		{"default:dirt_with_grass", "default:dirt", -1.5},
		{"default:dirt_with_dry_grass","default:dirt", -1.5},
		{"default:dirt_with_snow","default:dirt", -1.5},
	},
	replace_rate = 1,
	walk_chance = 10,
	walk_velocity = 8,
	run_velocity = 15,
	runaway = true,
	jump = false,
	--jump_height = 1,
	knock_back = 0,
	drops = {
		{name = "tnt:gunpowder", chance = 3, min = 1, max = 50},
	},
	on_die = function(self, pos)
		local below = {x = pos.x, y = pos.y -1, z = pos.z}
		minetest.set_node(below, {name = "default:steelblock"})
		minetest.set_node(pos, {name = "fire:basic_flame"})
		end,
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	view_range = 20,
	fear_height = 3,
	floats = 0,
	})



mobs:register_egg("mobs_war:shooter_vehicle", "Vehicle Shooter", "mobs_war_shot.png", 1)




