

mobs:register_mob("mobs_war:shooter_engineer", {
	type = "monster",
	passive = false,
	damage = 1,
	pathfinding = 2,
	attack_type = "dogfight",
	group_attack = true,
	specific_attack = defenders,
	reach = 2,
	hp_min = 40,
	hp_max = 50,
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
		shoot_attack = "mobs_war_shot",
		distance = 50,
	},
	replace_what = {
		{"mobs_war:drone_launcher_defender", "default:steelblock", 0.5},
		{"air", "mobs_war:marker_shooter", 0},
		{"mobs_war:marker_defender", "mobs_war:marker_shooter", 0},
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
		{name = "mobs_war:shooter_autocannon", chance = 3, min = 1, max = 2},
		{name = "mobs_war:drone_launcher_shooter", chance = 4, min = 1, max = 2},
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
})



mobs:register_egg("mobs_war:shooter_engineer", "Engineer Shooter", "mobs_war_shot.png", 1)



--Engineer create autocannon
-- make more frequent than defenders, to compensate for bias toward friendly

minetest.register_abm{
    nodenames = {"mobs_war:marker_shooter"},
    interval = 17,
    chance = 45,
    action = function(pos, node, active_object_count, active_object_count_wider)
	local above = {x = pos.x, y = pos.y +1, z = pos.z}
     local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
			if obj:get_luaentity().name == "mobs_war:shooter_engineer" and obj:get_luaentity().name ~= "mobs_war:shooter_autocannon" then

		minetest.add_entity(above, "mobs_war:shooter_autocannon")
		
	end			
	end
	end	
end,
}



--Engineer create drone launcher
-- make more frequent than defenders, to compensate for bias toward friendly

minetest.register_abm{
    nodenames = {"mobs_war:marker_shooter"},
	neighbors = {"group:soil", "group:sand", "group:stone"},
    interval = 17,
    chance = 45,
    action = function(pos, node, active_object_count, active_object_count_wider)
     local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)
		for k, obj in pairs(objs) do
			if obj:get_luaentity() ~= nil then
			if obj:get_luaentity().name == "mobs_war:shooter_engineer" and obj:get_luaentity().name ~= "mobs_war:shooter_autocannon" then

		minetest.set_node(pos, {name = "mobs_war:drone_launcher_shooter"}) 
		
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
			if obj:get_luaentity().name == "mobs_war:shooter_engineer" and obj:get_luaentity().name ~= "mobs_war:shooter_autocannon" then

		minetest.set_node(pos, {name = "mobs_war:wire"}) 
		
	end			
	end
	end	
end,
}

