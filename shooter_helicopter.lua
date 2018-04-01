

mobs:register_mob("mobs_war:shooter_helicopter", {
	type = "monster",
	passive = false,
	damage = 3,
	pathfinding = 1,
	attack_type = "shoot",
	attacks_monsters = true,
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
	mesh = "helicopter.b3d",
	textures = {"mobs_war_vehicles_helicopter_shooter.png"},
	--blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_war_helicopter_hovering",
		war_cry = "mobs_war_helicopter_hovering",
		death = "mobs_war_explode",
		attack = "mobs_war_helicopter_hovering",
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
	replace_rate = 100,
	walk_chance = 10,
	walk_velocity = 30,
	run_velocity = 50,
	runaway = false,
	fall_speed = 1,
	stepheight = 5,
	fly = true,
	fly_mode = "rise",
	fly_in = {"air", "mobs_war:marker_defender", "mobs_war:marker_shooter"}, 
	jump = true,
	jump_height = 10,
	drops = {
		{name = "default:steelblock", chance = 1, min = 1, max = 1},
		{name = "tnt:gunpowder", chance = 3, min = 1, max = 50},
	},
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
		end,
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	view_range = 50,
	fear_height = 500,
	floats = 0,
	animation = {
		stand_start = 2,
		stand_end = 18,
		walk_start = 2,
		walk_end = 18,
		run_start = 2,
		run_end = 18,
		punch_start = 2,
		punch_end = 18,
		shoot_start = 2,
		shoot_end = 18,
		speed_normal = 35,
		speed_run = 35,
	},
	})



mobs:register_egg("mobs_war:shooter_helicopter", "Helicopter Shooter", "mobs_war_shot.png", 1)




