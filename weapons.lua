local bullet_speed = 60
local bullet_scale = 0.01

-- SHOT
mobs:register_arrow("mobs_war:shot", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 3},
		}, nil)
		minetest.sound_play("player_damage", {pos = pos, gain = 1, max_hear_distance = 4,})
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 3},
		}, nil)
	end,

	
	hit_node = function(self, pos, node)
		--mobs:explosion(pos, 0, 0, 0)
		minetest.sound_play("mobs_war_thud", {pos = pos, gain = 0.2, max_hear_distance = 4,})
	end
})




-- BAZOOKA SHOT
--mobs:explosion(pos, radius, fire, smoke)

mobs:register_arrow("mobs_war:shot_bazooka", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed/4,
	

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 25},
		}, nil)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_explode", {pos = pos, gain = 5, max_hear_distance = 50,})
		mobs:explosion(pos, 1, 1, 1)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 25},
		}, nil)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_explode", {pos = pos, gain = 5, max_hear_distance = 50,})
		mobs:explosion(pos, 1, 1, 1)
	end,

	
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 1)
		minetest.sound_play("mobs_war_explode", {pos = pos, gain = 5, max_hear_distance = 50,})
	end
})


-- CANNON SHOT
mobs:register_arrow("mobs_war:cannon_shot", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	tail = 1,
	tail_texture = "mobs_war_shot.png",
	tail_size = {x = 0.2, y = 0.2},
	expire = 0.1,
	glow = 10,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.1,
			damage_groups = {fleshy = 1},
		}, nil)
		minetest.sound_play("player_damage", {pos = pos, gain = 1, max_hear_distance = 4,})
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	
	hit_node = function(self, pos, node)
		--mobs:explosion(pos, 0, 0, 0)
		minetest.sound_play("mobs_war_thud", {pos = pos, gain = 0.2, max_hear_distance = 4,})
	end
})


-- SHOT SNIPER
mobs:register_arrow("mobs_war:shot_sniper", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 35},
		}, nil)
		minetest.sound_play("player_damage", {pos = pos, gain = 1, max_hear_distance = 4,})
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 35},
		}, nil)
	end,


	hit_node = function(self, pos, node)
		--mobs:explosion(pos, 0, 0, 0)
		minetest.sound_play("mobs_war_thud", {pos = pos, gain = 0.8, max_hear_distance = 4,})
	end
})


-- FlAMETHROWER SHOT
--fire:basic_flame

mobs:register_arrow("mobs_war:shot_flamethrower", {
	visual = "sprite",
	visual_size = {x = 2, y = 2},
	textures = {"fire_basic_flame.png"},
	velocity = bullet_speed/8,
	tail = 1,
	tail_texture = "fire_basic_flame.png",
	tail_size = {x = 2, y = 2},
	expire = 0.5,
	glow = 10,


	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 20},
		}, nil)
		local pos = self.object:getpos()
		minetest.sound_play("fire_large", {pos = pos, gain = 1, max_hear_distance = 50,})
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.2,
			damage_groups = {fleshy = 20},
		}, nil)
		local pos = self.object:getpos()
		minetest.sound_play("fire_large", {pos = pos, gain = 1, max_hear_distance = 50,})
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,

	
	hit_node = function(self, pos, node)
		local newplace = minetest.get_node(pos)
		if minetest.get_item_group(newplace.name, "flammable") == 1 then
		minetest.sound_play("fire_large", {pos = pos, gain = 1, max_hear_distance = 50,})
		minetest.set_node(pos, {name = "fire:basic_flame"})
		end
	end
})

