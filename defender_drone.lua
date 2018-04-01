

mobs:register_mob("mobs_war:defender_drone", {
	type = "npc",
	passive = false,
	damage = 1,
	pathfinding = 1,
	attack_type = "explode",
	explosion_radius = 2,
	attacks_monsters = true,
	group_attack = true,
	specific_attack = shooters,
	reach = 3,
	hp_min = 2,
	hp_max = 5,
	armor = 1,
	collisionbox = {-0.5, -0.25, -0.5, 0.5, 0.20, 0.5},
	visual = "mesh",
	mesh = "drone.obj",
	textures = {"mobs_war_drone.png"},
	--blood_texture = "mobs_blood.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_war_drone_hovering",
		war_cry = "mobs_war_drone_hovering",
		explode = "mobs_war_explode",
		attack = "mobs_war_drone_hovering",
		distance = 50,
	},
	replace_rate = 100,
	walk_chance = 20,
	walk_velocity = 4,
	run_velocity = 8,
	runaway = false,
	fall_speed = 1,
	stepheight = 6,
	fly = true,
	fly_mode = "rise",
	fly_in = {"air", "mobs_war:marker_defender", "mobs_war:marker_shooter"}, 
	jump = true,
	jump_height = 10,
	drops = {
		{name = "tnt:tnt", chance = 3, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 2,
	light_damage = 0,
	view_range = 20,
	fear_height = 500,
	floats = 0,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 100, 0, 0, true, "mobs_war:defender_drone")
	end
	})



mobs:register_egg("mobs_war:defender_drone", "Drone Defender", "mobs_war_drone_launcher.png", 1)




