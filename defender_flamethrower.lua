

mobs:register_mob("mobs_war:defender_flamethrower", {
	type = "npc",
	passive = false,
	damage = 1,
	pathfinding = 1,
	attack_type = "dogshoot",
	attacks_monsters = true,
	group_attack = true,
	specific_attack = shooters,
	dogshoot_switch = 1,
	dogshoot_count_max = 120,
	dogshoot_count2_max = 20,
	reach = 2,
	shoot_interval = 4,
	arrow = "mobs_war:shot_flamethrower",
	shoot_offset = 1,
	hp_min = 12,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "character.b3d",
	textures = {
		{"mobs_defender.png"},
		{"mobs_defender2.png"},
		{"mobs_defender3.png"},
	},
	blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_war_breathing",
		war_cry = "",
		death = "mobs_war_damage",
		damage = "mobs_war_damage",
		attack = "mobs_war_buzz",
		shoot_attack = "mobs_war_flamethrower",
		distance = 50,
	},
	replace_what = {
		{"air", "mobs_war:marker_defender", 0},
		{"mobs_war:marker_shooter", "mobs_war:marker_defender", 0},
		{"default:dirt_with_grass", "default:dirt", -1.5},
		{"default:dirt_with_dry_grass","default:dirt", -1.5},
		{"default:dirt_with_snow","default:dirt", -1.5}
	},
	replace_rate = 1,
	walk_chance = 6,
	walk_velocity = 3,
	run_velocity = 4,
	runaway = true,
	jump = true,
	jump_height = 1,
	drops = {
		{name = "default:torch", chance = 5, min = 1, max = 5},
		{name = "tnt:tnt", chance = 2, min = 1, max = 10},
		{name = "mobs_war:flamethrower", chance = 1, min = 1, max = 1},
	},
	on_die = function(self, pos)
		local below = {x = pos.x, y = pos.y -1, z = pos.z}
		minetest.set_node(below, {name = "mobs_war:mobs_war_corpse"})
		end,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 15,
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
	follow = {"tnt:gunpowder", "tnt:tnt", "mobs_war:defender_rifle", "mobs_war:defender_machinegun", "mobs_war:bazooka", "mobs_war:flamethrower", "mobs_war:landmine",},
	on_rightclick = function(self, clicker)
	-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end
	-- feed, tame or heal
		if mobs:feed_tame(self, clicker, 1, false, true) then
			self.order = stand
			self.nametag = "Flamethrower"
			self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Flamethrower ready and standing ground commander!")
			return
		end

	--order to stand
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() ~= "default:torch" then
				self.order = stand
				self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Flamethrower holding ground commander!")
			return
			end
		end

	--order to follow
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() == "default:torch" then
				self.order = follow
				self.object:set_properties({walk_chance = 200})
		minetest.chat_send_player(clicker:get_player_name(),
					"Flamethrower following commander!")
			return
			end
		end

end


})






mobs:register_egg("mobs_war:defender_flamethrower", "Flamethrower Defender", "mobs_war_drone_launcher.png", 1)




