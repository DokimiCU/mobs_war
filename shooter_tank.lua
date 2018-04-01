

mobs:register_mob("mobs_war:shooter_tank", {
	type = "monster",
	passive = false,
	damage = 3,
	pathfinding = 1,
	attack_type = "shoot",
	group_attack = true,
	specific_attack = defenders,
	reach = 2,
	shoot_interval = 2,
	arrow = "mobs_war:shot_bazooka",
	shoot_offset = 1,
	hp_min = 1000,
	hp_max = 2000,
	armor = 700,
	collisionbox = {-1.7, 0, -1.7, 1.7, 2.6, 1.7},
	visual = "mesh",
	mesh = "tank.b3d",
	textures = {"vehicles_tank2.png"},
	--blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_war_tank_engine",
		war_cry = "mobs_war_tank_engine",
		death = "mobs_war_explode",
		attack = "mobs_war_tank_engine",
		shoot_attack = "mobs_war_shot_tank",
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
	walk_chance = 8,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = false,
	jump = false,
	--jump_height = 1,
	knock_back = 0,
	drops = {
		{name = "tnt:tnt", chance = 1, min = 1, max = 50},
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
	fear_height = 2,
	floats = 0,
	animation = {
		stand_start = 1,
		stand_end = 1,
		walk_start = 3,
		walk_end = 8,
		run_start = 3,
		run_end = 8,
		punch_start = 1,
		punch_end = 1,
		shoot_start = 1,
		shoot_end = 11,
		speed_normal = 35,
		speed_run = 35,
	},
	})



mobs:register_egg("mobs_war:shooter_tank", "Tank Shooter", "mobs_war_shot.png", 1)




