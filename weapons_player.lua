local bullet_speed = 200
local bullet_scale = 0.15

-- DEFENDER RIFLE
minetest.register_tool("mobs_war:defender_rifle", {
	description = "Defender Rifle",
	inventory_image = "mobs_war_defender_rifle.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:gunpowder") then
			local remov = inv:remove_item("main", "tnt:gunpowder")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:rifle_bullet_defender")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})


minetest.register_entity("mobs_war:rifle_bullet_defender", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	acceleration = -0.1,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_shot2", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:rifle_bullet_defender" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=0.2,
							damage_groups={fleshy=3},
						}, nil)
						self.object:remove()
					end
				end
			end
			
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
							local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.env:get_node(p).name
							if n ~= "mobs_war:rifle_bullet_defender" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper" then
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})



-- SHOOTER RIFLE
minetest.register_tool("mobs_war:shooter_rifle", {
	description = "Shooter Rifle",
	inventory_image = "mobs_war_shooter_rifle.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:gunpowder") then
			local remov = inv:remove_item("main", "tnt:gunpowder")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:rifle_bullet_shooter")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})


minetest.register_entity("mobs_war:rifle_bullet_shooter", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	acceleration = -0.1,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_shot", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:rifle_bullet_shooter" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=0.2,
							damage_groups={fleshy=3},
						}, nil)
						self.object:remove()
					end
				end
			end
			
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
							local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.env:get_node(p).name
							if n ~= "mobs_war:rifle_bullet_shooter" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper" then
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})



-- BAZOOKA

minetest.register_tool("mobs_war:bazooka", {
	description = "Bazooka",
	inventory_image = "mobs_war_bazooka.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:tnt") then
			local remov = inv:remove_item("main", "tnt:tnt")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:bazooka_bullet")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})





minetest.register_entity("mobs_war:bazooka_bullet", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed/2,
	acceleration = -0.6,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_shot_sniper", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local velo = self.object:getvelocity()
		if velo.y <= 1.2 and velo.y >= -1.2 then
			self.object:set_animation({x=1, y=1}, 5, 0)
		elseif velo.y <= -1.2 then
			self.object:set_animation({x=4, y=4}, 5, 0)
		elseif velo.y >= 1.2 then
			self.object:set_animation({x=2, y=2}, 5, 0)
		end
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:bazooka_bullet" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=1.0,
							damage_groups={fleshy=25},
						}, nil)
				tnt.boom(pos, {damage_radius=2,radius=2,ignore_protection=false})
				minetest.sound_play("mobs_war_explode", 
		{gain = 5, max_hear_distance = 50, loop = false})
						self.object:remove()
					end
				end
			end
			
					for dx=-1,1 do
						for dy=-1,1 do
							for dz=-1,1 do
								local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
								local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
								local n = minetest.env:get_node(p).name
								if n ~= "mobs_war:bazooka_bullet" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper" then
									local pos = self.object:getpos()
																		tnt.boom(pos, {damage_radius=2,radius=2,ignore_protection=false})
				minetest.sound_play("mobs_war_explode", 
		{gain = 5, max_hear_distance = 50, loop = false})
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})





-- DEFENDER MACHINE GUN
minetest.register_tool("mobs_war:defender_machinegun", {
	description = "Defender machinegun",
	inventory_image = "mobs_war_defender_machinegun.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:gunpowder") then
			local remov = inv:remove_item("main", "tnt:gunpowder 4")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:machinegun_bullet_defender")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})


minetest.register_entity("mobs_war:machinegun_bullet_defender", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	acceleration = -0.2,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_cannon", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()					minetest.add_particle({
				pos = pos,
				velocity = {x = 0, y = 0, z = 0},
				acceleration = {x = 0, y = 0, z = 0},
				expirationtime = 0.1,
				collisiondetection = false,
				texture = "mobs_war_shot.png",
				size = {x = bullet_scale, y = bullet_scale},
				glow = 10,
			})
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:machinegun_bullet_defender" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=0.2,
							damage_groups={fleshy=12},
						}, nil)
						self.object:remove()
					end
				end
			end
			
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
							local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.env:get_node(p).name
							if n ~= "mobs_war:machinegun_bullet_defender" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper" then
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})



-- SHOOTER MACHINE GUN

minetest.register_tool("mobs_war:shooter_machinegun", {
	description = "Shooter machinegun",
	inventory_image = "mobs_war_shooter_machinegun.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:gunpowder") then
			local remov = inv:remove_item("main", "tnt:gunpowder 4")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:machinegun_bullet_shooter")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})


minetest.register_entity("mobs_war:machinegun_bullet_shooter", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	acceleration = -0.2,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_cannon2", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()					minetest.add_particle({
				pos = pos,
				velocity = {x = 0, y = 0, z = 0},
				acceleration = {x = 0, y = 0, z = 0},
				expirationtime = 0.1,
				collisiondetection = false,
				texture = "mobs_war_shot.png",
				size = {x = bullet_scale, y = bullet_scale},
				glow = 10,
			})
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:machinegun_bullet_shooter" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=0.2,
							damage_groups={fleshy=12},
						}, nil)
						self.object:remove()
					end
				end
			end
			
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
							local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.env:get_node(p).name
							if n ~= "mobs_war:machinegun_bullet_shooter" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper" then
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})

	

-- SNIPER RIFLE

minetest.register_tool("mobs_war:rifle_sniper", {
	description = "Sniper Rifle",
	inventory_image = "mobs_war_rifle_sniper.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:gunpowder") then
			local remov = inv:remove_item("main", "tnt:gunpowder 8")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:rifle_bullet_sniper")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})


minetest.register_entity("mobs_war:rifle_bullet_sniper", {
	visual = "sprite",
	visual_size = {x = bullet_scale, y = bullet_scale},
	textures = {"mobs_war_shot.png"},
	velocity = bullet_speed,
	acceleration = -0.05,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_shot_sniper2", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:rifle_bullet_sniper" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=0.2,
							damage_groups={fleshy=35},
						}, nil)
						self.object:remove()
					end
				end
			end
			
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
							local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.env:get_node(p).name
							if n ~= "mobs_war:rifle_bullet_defender" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper"  then
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})



-- FLAMETHROWER

minetest.register_tool("mobs_war:flamethrower", {
	description = "Flamethrower",
	inventory_image = "mobs_war_flamethrower.png",
	wield_scale = {x = 1.5, y = 1.5, z = 1},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	on_use = function(item, placer, pointed_thing)
			local dir = placer:get_look_dir();
			local playerpos = placer:getpos();
			local pname = placer:get_player_name();
			local inv = minetest.get_inventory({type="player", name=pname});
			if inv:contains_item("main", "tnt:gunpowder") then
			local remov = inv:remove_item("main", "tnt:gunpowder 1")
			local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x,y=playerpos.y+1.6+dir.y,z=playerpos.z+0+dir.z}, "mobs_war:flamethrower_bullet")
			local object = obj:get_luaentity()
			object.launcher = placer
			object.vehicle = nil
			local vec = {x=dir.x*6,y=dir.y*6,z=dir.z*6}
			obj:setvelocity(vec)
			return item
		end
	end,
})


minetest.register_entity("mobs_war:flamethrower_bullet", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"fire_basic_flame.png"},
	velocity = bullet_speed/10,
	acceleration = -20,
	damage = 1,
	collisionbox = {0, 0, 0, 0, 0, 0},
	on_activate = function(self)
		local pos = self.object:getpos()
		minetest.sound_play("mobs_war_flamethrower", 
		{gain = 1, max_hear_distance = 50, loop = false})
	end,
	on_step = function(self, obj, pos)
		minetest.after(10, function()
			self.object:remove()
		end)
		local pos = self.object:getpos()					minetest.add_particle({
				pos = pos,
				velocity = {x = 0, y = 0, z = 0},
				acceleration = {x = 0, y = 0, z = 0},
				expirationtime = 0.5,
				collisiondetection = false,
				texture = "fire_basic_flame.png",
				size = {x = 1, y = 1},
				glow = 10,
			})
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, 2)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil then
					if obj:get_luaentity().name ~= "mobs_war:flamethrower_bullet" and obj:get_luaentity().name ~= "__builtin:item" then
						obj:punch(self.launcher, 1.0, {
							full_punch_interval=0.2,
							damage_groups={fleshy=20},
						}, nil)
						minetest.set_node(pos, {name = "fire:basic_flame"})
					minetest.sound_play("fire_large", {pos = pos, gain = 1, max_hear_distance = 50,})
						self.object:remove()
					end
				end
			end
			
				for dx=-1,1 do
					for dy=-1,1 do
						for dz=-1,1 do
							local p = {x=pos.x+dx, y=pos.y, z=pos.z+dz}
							local t = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
							local n = minetest.env:get_node(p).name
							if n ~= "mobs_war:flamethrower_bullet" and n ~= "air" and n ~= "mobs_war:marker_defender" and n ~= "mobs_war:marker_shooter" and n ~= "mobs_war:shot" and n ~= "mobs_war:cannon_shot" and n~= "mobs_war:shot_sniper"  then
	minetest.set_node(pos, {name = "fire:basic_flame"})
	minetest.sound_play("fire_large", {pos = pos, gain = 1, max_hear_distance = 50,})
									self.object:remove()
									return
								end
							end
						end
					end
	end,
})



--LANDMINE

minetest.register_node("mobs_war:landmine", {
		description = "Landmine",
		tiles = {"default_dirt.png"},
		paramtype = "light",
		groups = {crumbly = 3, oddly_breakable_by_hand=1},
		sounds = default.node_sound_metal_defaults(),
		on_punch = function(pos, node, puncher)
			tnt.boom(pos, {damage_radius=2,radius=1,ignore_protection=false})
			minetest.sound_play("mobs_war_explode", 
		{gain = 5, max_hear_distance = 50, loop = false})
			end,
		})


--detonate landmine

minetest.register_abm{
     	nodenames = {"mobs_war:landmine"},
	interval = 1,
	chance = 4,
	catch_up = false,
	action = function(pos)
		local objs = minetest.get_objects_inside_radius({x=pos.x,y=pos.y + 1,z=pos.z}, 1)	
			for k, obj in pairs(objs) do
				if obj:get_luaentity() ~= nil and obj:get_luaentity().name ~= "__builtin:item" then
				if obj:get_luaentity().name ~= "mobs_war:defender_engineer" and obj:get_luaentity().name ~= "mobs_war:shooter_engineer" then

				tnt.boom(pos, {damage_radius=1,radius=1,ignore_protection=false})
				minetest.sound_play("mobs_war_explode", {pos = pos, gain = 4, max_hear_distance = 50,})
					end
				end
			end

			for k, player in pairs(objs) do
				if player:get_player_name()~=nil then
					tnt.boom(pos, {damage_radius=1,radius=1,ignore_protection=false})
				minetest.sound_play("mobs_war_explode", {pos = pos, gain = 4, max_hear_distance = 50,})	
				end
			end
	end
	}

	