

mobs:register_mob("mobs_war:shooter_cannon", {
	type = "monster",
	passive = false,
	damage = 2,
	pathfinding = 1,
	attack_type = "dogshoot",
	group_attack = true,
	specific_attack = defenders,
	dogshoot_switch = 1,
	dogshoot_count_max = 3,
	dogshoot_count2_max = 2,
	reach = 2,
	shoot_interval = 0.15,
	arrow = "mobs_war:cannon_shot",
	shoot_offset = 1,
	hp_min = 12,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_shooter.png"},
		{"mobs_shooter2.png"},
		{"mobs_shooter3.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_war_breathing",
		war_cry = "",
		death = "mobs_war_damage",
		damage = "mobs_war_damage",
		attack = "mobs_war_buzz",
		shoot_attack = "mobs_war_cannon2",
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
	walk_velocity = 2,
	run_velocity = 4,
	runaway = true,
	jump = true,
	jump_height = 2,
	drops = {
		{name = "default:axe_steel", chance = 5, min = 1, max = 1},
		{name = "mobs_war:shooter_machinegun", chance = 1, min = 1, max = 1},
		{name = "tnt:gunpowder", chance = 4, min = 1, max = 50},
	},
	on_die = function(self, pos)
		local below = {x = pos.x, y = pos.y -1, z = pos.z}
		minetest.set_node(below, {name = "mobs_war:mobs_war_corpse"})
		end,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 20,
	fear_height = 3,
	floats = 1,
	animation = {
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 189,
		punch_end = 198,
		shoot_start = 200,
		shoot_end = 219,
		speed_normal = 30,
		speed_run = 30,
	},
})



mobs:register_egg("mobs_war:shooter_cannon", "Cannon Shooter", "mobs_war_shot.png", 1)




