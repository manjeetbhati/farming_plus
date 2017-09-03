
--  'farming_plus' farming mod for Minetest.
--  Copyright (C) 2017  PilzAdam, Wade Cline
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2.1 of the License, or (at your option) any later version.
--
--  This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  Lesser General Public License for more details.
--
--  You should have received a copy of the GNU Lesser General Public
--  License along with this library; if not, write to the Free Software
--  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

-- main `S` code in init.lua
local S
S = farming_plus.S

minetest.register_craftitem("farming_plus:rhubarb_seed", {
	description = S("Rhubarb Seeds"),
	inventory_image = "farming_plus_rhubarb_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming_plus.place_seed(itemstack, placer, pointed_thing, "farming_plus:rhubarb_1")
	end
})

minetest.register_node("farming_plus:rhubarb_1", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_plus_rhubarb_1.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+5/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb_2", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	drop = "",
	tiles = {"farming_plus_rhubarb_2.png"},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.5+11/16, 0.5}
		},
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming_plus:rhubarb", {
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_plus_rhubarb_3.png"},
	drop = {
		max_items = 6,
		items = {
			{ items = {'farming_plus:rhubarb_seed'} },
			{ items = {'farming_plus:rhubarb_seed'}, rarity = 2},
			{ items = {'farming_plus:rhubarb_seed'}, rarity = 5},
			{ items = {'farming_plus:rhubarb_item'} },
			{ items = {'farming_plus:rhubarb_item'}, rarity = 2 },
			{ items = {'farming_plus:rhubarb_item'}, rarity = 5 }
		}
	},
	groups = {snappy=3, flammable=2, not_in_creative_inventory=1,plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming_plus:rhubarb_item", {
	description = S("Rhubarb"),
	inventory_image = "farming_plus_rhubarb.png",
})

farming_plus.add_plant("farming_plus:rhubarb", {"farming_plus:rhubarb_1", "farming_plus:rhubarb_2"}, 50, 20)
