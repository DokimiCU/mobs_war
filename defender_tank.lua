

mobs:register_mob("mobs_war:defender_tank", {
	type = "npc",
	passive = false,
	damage = 3,
	pathfinding = 1,
	attack_type = "shoot",
	attacks_monsters = true,
	group_attack = true,
	specific_attack = shooters,
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
	textures = {"vehicles_tank.png"},
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
		{"air", "mobs_war:marker_defender", 0},
		{"mobs_war:marker_shooter", "mobs_war:marker_defender", 0},
		{"default:dirt_with_grass", "default:dirt", -1.5},
		{"default:dirt_with_dry_grass","default:dirt", -1.5},
		{"default:dirt_with_snow","default:dirt", -1.5}
	},
	replace_rate = 1,
	walk_chance = 8,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = false,
	jump = false,
	knock_back = 0,
	--jump_height = 1,
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
	follow = {"tnt:gunpowder", "tnt:tnt", "mobs_war:defender_rifle", "mobs_war:defender_machinegun", "mobs_war:bazooka", "mobs_war:flamethrower", "mobs_war:landmine",},
	on_rightclick = function(self, clicker)
	-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end
	-- feed, tame or heal
		if mobs:feed_tame(self, clicker, 1, false, true) then
			self.order = stand
			self.nametag = "Tank"
			self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Tank ready and standing ground commander!")
			return
		end

	--order to stand
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() ~= "default:torch" then
				self.order = stand
				self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Tank holding ground commander!")
			return
			end
		end

	--order to follow
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() == "default:torch" then
				self.order = follow
				self.object:set_properties({walk_chance = 200})
		minetest.chat_send_player(clicker:get_player_name(),
					"Tank following commander!")
			return
			end
		end

end

	})



mobs:register_egg("mobs_war:defender_tank", "Tank Defender", "mobs_war_drone_launcher.png", 1)




