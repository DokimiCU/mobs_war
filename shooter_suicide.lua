

mobs:register_mob("mobs_war:shooter_suicide", {
	type = "monster",
	passive = false,
	damage = 1,
	pathfinding = 1,
	attack_type = "explode",
	explosion_radius = 3,
	group_attack = true,
	specific_attack = defenders,
	reach = 2,
	hp_min = 25,
	hp_max = 35,
	armor = 150,
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
		explode = "mobs_war_explode",
		damage = "mobs_war_damage",
		death = "mobs_war_damage",
		attack = "mobs_war_buzz",
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
	walk_chance = 20,
	walk_velocity = 4,
	run_velocity = 6,
	runaway = false,
	jump = true,
	jump_height = 3,
	drops = {
		{name = "default:pick_steel", chance = 7, min = 1, max = 1},
		{name = "tnt:tnt", chance = 1, min = 1, max = 50},
		{name = "tnt:gunpowder", chance = 1, min = 1, max = 50},
	},
	on_die = function(self, pos)
		local below = {x = pos.x, y = pos.y -1, z = pos.z}
		minetest.set_node(below, {name = "mobs_war:mobs_war_corpse"})
		end,
	water_damage = 0,
	lava_damage = 3,
	light_damage = 0,
	view_range = 25,
	fear_height = 5,
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


mobs:register_egg("mobs_war:shooter_suicide", "Suicide Shooter", "mobs_war_shot.png", 1)




