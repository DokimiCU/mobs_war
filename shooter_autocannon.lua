


mobs:register_mob("mobs_war:shooter_autocannon", {
	type = "monster",
	passive = false,
	damage = 2,
	attack_type = "shoot",
	group_attack = true,
	specific_attack = defenders,
	reach = 2,
	shoot_interval = 0.15,
	arrow = "mobs_war:cannon_shot",
	shoot_offset = 1,
	hp_min = 5000,
	hp_max = 10000,
	armor = 500,
	collisionbox = {-1.2, 0, -1.2, 1.2, 1.2, 1.2},
	visual = "mesh",
	mesh = "autocannon.obj",
	textures = {"mobs_war_autocannon2.png"},
	--blood_texture = "mobs_blood.png",
	makes_footstep_sound = false,
	sounds = {
		random = "",
		war_cry = "",
		death = "mobs_war_explode",
		damage = "",
		attack = "",
		shoot_attack = "mobs_war_cannon4",
		distance = 50,
	},
	replace_what = {
		{"air", "mobs_war:marker_shooter", 0},
		{"mobs_war:marker_defender", "mobs_war:marker_shooter", 0},
		{"default:dirt_with_grass", "default:dirt", -1.5},
		{"default:dirt_with_dry_grass","default:dirt", -1.5},
		{"default:dirt_with_snow","default:dirt", -1.5},
	},
	walk_chance = 0,
	walk_velocity = 0,
	run_velocity = 0,
	runaway = false,
	jump = false,
	jump_height = 0,
	drops = {
		{name = "mobs_war:shooter_machinegun", chance = 1, min = 1, max = 1},
		{name = "tnt:gunpowder", chance = 4, min = 1, max = 50},
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
	knock_back = 0,
	})





mobs:register_egg("mobs_war:shooter_autocannon", "Autocannon Shooter", "mobs_war_shot.png", 1)

