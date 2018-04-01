

mobs:register_mob("mobs_war:defender_helicopter", {
	type = "npc",
	passive = false,
	damage = 3,
	pathfinding = 1,
	attack_type = "shoot",
	attacks_monsters = true,
	group_attack = true,
	specific_attack = shooters,
	reach = 2,
	shoot_interval = 0.1,
	arrow = "mobs_war:cannon_shot",
	shoot_offset = 1,
	hp_min = 220,
	hp_max = 550,
	armor = 500,
	collisionbox = {-2.7, 0, -2.7, 2.7, 2.7, 2.7},
	visual = "mesh",
	mesh = "apache.b3d",
	textures = {"vehicles_helicopter2.png"},
	--blood_texture = "mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_war_helicopter_hovering",
		war_cry = "mobs_war_helicopter_hovering",
		death = "mobs_war_explode",
		attack = "mobs_war_helicopter_hovering",
		shoot_attack = "mobs_war_cannon3",
		distance = 50,
	},
	replace_what = {
		{"air", "mobs_war:marker_defender", 0},
		{"mobs_war:marker_shooter", "mobs_war:marker_defender", 0},
		{"default:dirt_with_grass", "default:dirt", -1.5},
		{"default:dirt_with_dry_grass","default:dirt", -1.5},
		{"default:dirt_with_snow","default:dirt", -1.5}
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
	follow = {"tnt:gunpowder", "tnt:tnt", "mobs_war:defender_rifle", "mobs_war:defender_machinegun", "mobs_war:bazooka", "mobs_war:flamethrower", "mobs_war:landmine",},
	on_rightclick = function(self, clicker)
	-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end
	-- feed, tame or heal
		if mobs:feed_tame(self, clicker, 1, false, true) then
			self.order = stand
			self.nametag = "Helicopter"
			self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Helicopter ready and standing ground commander!")
			return
		end

	--order to stand
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() ~= "default:torch" then
				self.order = stand
				self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Helicopter holding ground commander!")
			return
			end
		end

	--order to follow
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() == "default:torch" then
				self.order = follow
				self.object:set_properties({walk_chance = 200})
		minetest.chat_send_player(clicker:get_player_name(),
					"Helicopter following commander!")
			return
			end
		end

end
	})



mobs:register_egg("mobs_war:defender_helicopter", "Helicopter Defender", "mobs_war_drone_launcher.png", 1)




