

mobs:register_mob("mobs_war:defender_vehicle", {
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
	collisionbox = {-1.5, 0, -1.5, 1.5, 1.5, 1.5},
	visual = "mesh",
	mesh = "ute.b3d",
	textures = {"vehicles_ute.png"},
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
		{"air", "mobs_war:marker_defender", 0},
		{"mobs_war:marker_shooter", "mobs_war:marker_defender", 0},
		{"default:dirt_with_grass", "default:dirt", -1.5},
		{"default:dirt_with_dry_grass","default:dirt", -1.5},
		{"default:dirt_with_snow","default:dirt", -1.5}
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
	follow = {"tnt:gunpowder", "tnt:tnt", "mobs_war:defender_rifle", "mobs_war:defender_machinegun", "mobs_war:bazooka", "mobs_war:flamethrower", "mobs_war:landmine",},
	on_rightclick = function(self, clicker)
	-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end
	-- feed, tame or heal
		if mobs:feed_tame(self, clicker, 1, false, true) then
			self.order = stand
			self.nametag = "Vehicle"
			self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Vehicle ready and standing ground commander!")
			return
		end

	--order to stand
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() ~= "default:torch" then
				self.order = stand
				self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Vehicle holding ground commander!")
			return
			end
		end

	--order to follow
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() == "default:torch" then
				self.order = follow
				self.object:set_properties({walk_chance = 200})
		minetest.chat_send_player(clicker:get_player_name(),
					"Vehicle following commander!")
			return
			end
		end

end
	})



mobs:register_egg("mobs_war:defender_vehicle", "Vehicle Defender", "mobs_war_drone_launcher.png", 1)




