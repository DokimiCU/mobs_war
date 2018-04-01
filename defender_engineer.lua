

mobs:register_mob("mobs_war:defender_engineer", {
	type = "npc",
	passive = false,
	damage = 1,
	pathfinding = 2,
	attack_type = "dogfight",
	attacks_monsters = true,
	group_attack = true,
	specific_attack = shooters,
	reach = 2,
	hp_min = 40,
	hp_max = 50,
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
		shoot_attack = "mobs_war_shot2",
		distance = 50,
	},
	replace_what = {
		{"mobs_war:drone_launcher_shooter", "default:steelblock", 0.5},
		{"air", "mobs_war:marker_defender", 0.5},
		{"mobs_war:marker_shooter", "mobs_war:marker_defender", 0},
		{"default:dirt_with_grass", "mobs_war:landmine", -1.5},
		{"default:dirt_with_dry_grass","mobs_war:landmine", -1.5},
		{"default:dirt_with_snow","mobs_war:landmine", -1.5}
	},
	replace_rate = 1,
	walk_chance = 30,
	walk_velocity = 5,
	run_velocity = 7,
	runaway = true,
	jump = true,
	jump_height = 2,
	drops = {
		{name = "mobs_war:landmine", chance = 1, min = 1, max = 10},
		{name = "default:pick_steel", chance = 5, min = 1, max = 1},
		{name = "mobs_war:defender_autocannon", chance = 3, min = 1, max = 2},
		{name = "mobs_war:drone_launcher_defender", chance = 4, min = 1, max = 2},
		{name = "tnt:gunpowder", chance = 2, min = 1, max = 50},
	},
	on_die = function(self, pos)
		local below = {x = pos.x, y = pos.y -1, z = pos.z}
		minetest.set_node(below, {name = "mobs_war:mobs_war_corpse"})
		end,
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	view_range = 25,
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
			self.nametag = "Engineer"
			self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Engineer ready and standing ground commander!")
			return
		end

	--order to stand
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() ~= "default:torch" then
				self.order = stand
				self.object:set_properties({walk_chance = 0})
		minetest.chat_send_player(clicker:get_player_name(),
					"Engineer holding ground commander!")
			return
			end
		end

	--order to follow
		if self.tamed and self.owner == clicker:get_player_name() then
			if clicker:get_wielded_item():get_name() == "default:torch" then
				self.order = follow
				self.object:set_properties({walk_chance = 200})
		minetest.chat_send_player(clicker:get_player_name(),
					"Engineer following commander!")
			return
			end
		end

end


})



mobs:register_egg("mobs_war:defender_engineer", "Engineer Defender", "mobs_war_drone_launcher.png", 1)



--Engineer create autocannon

minetest.register_abm{
    nodenames = {"mobs_war:marker_defender"},
    interval = 20,
    chance = 50,
    action = function(pos, node, active_object_count, active_object_count_wider)
	local above = {x = pos.x, y = pos.y +1, z = pos.z}
     local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
			if obj:get_luaentity().name == "mobs_war:defender_engineer" and obj:get_luaentity().name ~= "mobs_war:defender_autocannon" then

		minetest.add_entity(above, "mobs_war:defender_autocannon")
		
	end			
	end
	end	
end,
}


--Engineer create drone launcher

minetest.register_abm{
    nodenames = {"mobs_war:marker_defender"},
	neighbors = {"group:soil", "group:sand", "group:stone"},
    interval = 30,
    chance = 60,
    action = function(pos, node, active_object_count, active_object_count_wider)
     local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
			if obj:get_luaentity().name == "mobs_war:defender_engineer" and obj:get_luaentity().name ~= "mobs_war:defender_autocannon" then

		minetest.set_node(pos, {name = "mobs_war:drone_launcher_defender"}) 
		
	end			
	end
	end	
end,
}


--Engineer wire

minetest.register_abm{
    nodenames = {"air"},
	neighbors = {"group:soil", "group:sand", "group:stone"},
    interval = 30,
    chance = 100,
    action = function(pos, node, active_object_count, active_object_count_wider)
     local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
			if obj:get_luaentity().name == "mobs_war:defender_engineer" and obj:get_luaentity().name ~= "mobs_war:defender_autocannon" then

		minetest.set_node(pos, {name = "mobs_war:wire"}) 
		
	end			
	end
	end	
end,
}


