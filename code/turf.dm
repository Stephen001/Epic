
turf
	var
		edge_weight = 1
		edge_icon=null
		has_edges = 0

	proc
		__needs_edge(turf/t)
			if(!t) return 0
			if(istype(t, type)) return 0
			if(t.density <> density) return 0
			return 1

		__add_edge(d)
			var/image/i = image(edge_icon, "", layer = TURF_LAYER + 0.01 * edge_weight, dir = d)

			if(d & NORTH) i.pixel_y = 32
			if(d & SOUTH) i.pixel_y = -32
			if(d & EAST) i.pixel_x = 32
			if(d & WEST) i.pixel_x = -32

			overlays += i

		generate_edges()

			if(has_edges) return
			if(edge_icon==null) return

			var/north = __needs_edge(locate(x, y + 1, z))
			var/south = __needs_edge(locate(x, y - 1, z))
			var/east = __needs_edge(locate(x + 1, y, z))
			var/west = __needs_edge(locate(x - 1, y, z))

			if(north) __add_edge(NORTH)
			if(north && east) __add_edge(NORTHEAST)
			if(north && west) __add_edge(NORTHWEST)

			if(south) __add_edge(SOUTH)
			if(south && east) __add_edge(SOUTHEAST)
			if(south && west) __add_edge(SOUTHWEST)

			if(east) __add_edge(EAST)
			if(west) __add_edge(WEST)

			has_edges = 1

			/*
			// this was the old code
			for(var/turf/t in oview(1, src))

				// if its the same type we don't need to show the edge
				if(istype(t, type)) continue

				// if t's edge_weight is less than or equal to this tiles,
				// we don't show the edge (because we'll show the edge for t).
				if(t.edge_weight > edge_weight) continue

				var/d = get_dir(src, t)

				var/image/i = image(edge_icon, icon_state, layer = TURF_LAYER + 0.01 * edge_weight, dir = d)

				if(d & NORTH) i.pixel_y = 32
				if(d & SOUTH) i.pixel_y = -32
				if(d & EAST) i.pixel_x = 32
				if(d & WEST) i.pixel_x = -32

				overlays += i

			has_edges = 1
			*/

		clear_edges()

			if(!has_edges) return

			overlays = null
			has_edges = 0




turfo
	parent_type = /obj
	icon = 'turf.dmi'
	dont_reset = 1
	tree
		density=1
		icon_state = "tree"
		pixel_x=0
		pwidth=16
		pheight=24
	cactus
		density=1
		icon_state = "cactus"
		pixel_x=0
		pwidth=16
		pheight=24
	burnt_tree
		density=1
		icon_state = "burnt tree"
		pixel_x=0
		pwidth=16
		pheight=24

	torch_stand
		density=0
		icon_state = "torch stand"
		pixel_x=0
		pwidth=16
		pheight=24
	W
		icon_state = "W"
	A
		icon_state = "A"
	S
		icon_state = "S"
	D
		icon_state = "D"
	up
		icon_state = "up"
	spear_stand
		density=0
		icon_state = "spear stand"
		pixel_x=0
		pwidth=16
		pheight=24
	penis
		density = 1
		icon_state = "penorpion"
		icon = 'big statue.dmi'
		pwidth = 64
		pheight = 32
	rock_formation
		density = 1
		icon_state = "rock formation"
	tank
		icon_state = "tank"
		density=1

	cogs
		density = 1

		cog_1
			icon_state = "cog"
		cog_2
			icon_state = "cog 2"
		cog_3
			icon_state = "cog 3"
		cog_4
			icon_state = "cog 4"
		cog_5
			icon_state = "cog 5"

	clock
		icon = 'big clock.dmi'
		layer = MOB_LAYER + 5
	hourglass
		icon_state = "hourglass"
		density=1

cloud
	parent_type = /obj

	density = 0

	invisibility=1

	icon = 'cloud.dmi'


	layer = MOB_LAYER+20


	dont_reset = 1

	step_size=2

	New()

		del(src)
		return
	//	overlays+=image('cloud.dmi',icon_state = "s",pixel_y = -200,layer = MOB_LAYER+4)
	//	walk(src,EAST)
	Move()
		..()
		if(x == 50)
			x=1



turfm
	parent_type = /mob
	icon = 'turf.dmi'
	dont_reset = 1

	var/or = list(0,0,0)

	New()
		..()
		or[1] = x
		or[2] = y
		or[3] = z

	reset_me()
		loc = locate(or[1],or[2],or[3])
		step_x = 0
		step_y = 0

	rock
		density=1
		icon_state = "rock"


		cave
			icon = 'objects.dmi'
			boulder
				icon_state = "boulder"
				pwidth = 32
				pheight = 32
				pixel_y=0
				pixel_x=0
			small_boulder
				icon_state = "small boulder"
				pwidth=16
				pheight=16
				pixel_y=-8
				pixel_x=-8
			tiny_rock
				icon_state = "rock"
				pwidth=8
				pheight=8
				pixel_y=-12
				pixel_x=-12


		set_state()

		var
			movede = 0

		move()
			..()
			movede = 2

		action()
			..()
			powered=0
			if(movede)
				movede -= 1
			else
				slow_down()

		bumped(player/a)
			if(istype(a))
				if(a.dungeon)
					move(a.dir)
			else
				move(a.dir)
		can_bump(atom/a)
			if(ismob(a))
				return a.density
			if(a.half_wall)
				return 1
			return ..()

		bump(atom/a)
			a.bumped(src)

		bush
			icon_state = "bush"
			pwidth = 16
			pheight = 16
			pixel_y=-8
			pixel_x=-8

turf
	icon = 'turf.dmi'

	var/outline=1
	var/outline_2 = null
	var/drop_shadow = null

	var/outlined=0
	var/outlined2=0
	var/dropped_shadow=0

	New()
		..()


		dir = pick(NORTH, SOUTH, EAST, WEST, NORTHEAST, SOUTHEAST, NORTHWEST, SOUTHWEST)

	var/activated = 0
	var/no_dense=0
	proc/activateme()
		if(activated==1) return
		activated=1
		generate_edges()

		if(outline_2 && outlined2==0)
			spawn()

				outline2(outline_2)



				if(density && outline)
					spawn()
						outline()



		else

			if(density && outline && outlined==0)
				spawn()
					outline()
		if(drop_shadow && dropped_shadow == 0)
			spawn(1)
				if(dropped_shadow==0)
					dropped_shadow = 1
					var/turf/T = get_step(src,SOUTH)
					if(T && T.drop_shadow == null)
						T.overlays += drop_shadow


	proc
		outline()
			if(outlined)
				return
			var/n = 0
			var/turf/t

			t = locate(x, y + 1, z)
			if(t && t.density) n += 1
			t = locate(x + 1, y, z)
			if(t && t.density) n += 2
			t = locate(x, y - 1, z)
			if(t && t.density) n += 4
			t = locate(x - 1, y, z)
			if(t && t.density) n += 8

			if(n < 15)
				overlays += icon('outline.dmi', "[n]")
			outlined=1
		outline2(iconz)
			if(outlined2)
				return
			var/n = 0
			var/turf/t

			t = locate(x, y + 1, z)
			if(t && t.icon_state == src.icon_state) n += 1
			t = locate(x + 1, y, z)
			if(t && t.icon_state == src.icon_state) n += 2
			t = locate(x, y - 1, z)
			if(t && t.icon_state == src.icon_state) n += 4
			t = locate(x - 1, y, z)
			if(t && t.icon_state == src.icon_state) n += 8

			if(n < 15)
				overlays += icon(iconz, "[n]")
			outlined2=1

	grass
		icon_state = "grass"

		edge_icon = 'grass edge.dmi'

	ice
		density = 0
		icon_state = "ice"


		stepped_on(player/m)

			if(istype(m))

				m:on_ice = 1

		stepped_off(player/m)

			if(istype(m))

				m:on_ice=0

	water
		density=1
		icon_state = "water"
		outline_2 = 'lava outline.dmi'
	dirt

		icon_state = "dirt"

		outline_2 = 'gravel outline.dmi'
	gravel

		icon_state = "gravel"

		outline_2 = 'dirt outline.dmi'
	dune

		icon_state = "dune"

		outline_2 = 'dirt outline.dmi'
	dark
		density=1
//		opaque=1
		icon_state = "dark"
		activated=1
	space
		density=1
//		opaque=1
		icon_state = "space"
		activated=1
	snow
		icon_state = "snow"

		outline_2 = 'snow outline.dmi'
	stone_floor
		icon_state = "stone floor"
		outline_2 = 'stone floor outline.dmi'
	ruins
		density=1
//		opaque=1
		icon_state = "ruins"

		outline_2 = 'ruins outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	false_mountain
		density=1
		no_dense=1
//		opaque=1
		icon_state = "mountain"

		outline_2 = 'mountain outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	mountain
		density=1
//		opaque=1
		icon_state = "mountain"

		outline_2 = 'mountain outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	time_fabric
		density=1
//		opaque=1
		icon_state = "space"

		outline_2 = 'time fabric outline.dmi'

		drop_shadow = null
	half_wall
		density=1
		half_wall = 1
//		opaque=1
		icon_state = "half wall"

		outline_2 = 'half wall outline.dmi'

		drop_shadow = null
	fizzler

		icon_state = "fizzler"


	glass_pane
		density=1
//		opaque=1
		icon_state = "glass pane"

		outline_2 = 'glass pane outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	dune_wall
		density=1
//		opaque=1
		icon_state = "dune wall"

		outline_2 = 'dune wall outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	metal_floor
		icon_state = "metal floor"
		outline_2 = 'metal floor outline.dmi'

	metal_wall
		density=1
//		opaque=1
		icon_state = "metal wall"

		outline_2 = 'metal wall outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	obsidian
		icon_state = "obsidian"
		outline_2 = 'obsidian outline.dmi'
	lava
		density=1
		icon_state = "lava"
		outline_2 = 'lava outline.dmi'
	acid
		density=1
		icon_state = "acid"
		outline_2 = 'lava outline.dmi'
	obsidiian_wall
		density=1
//		opaque=1
		icon_state = "obsidian wall"

		outline_2 = 'obsidian wall outline.dmi'

		drop_shadow = 'mountain shadow.dmi'

	castle
		density=1
//		opaque=1
		icon_state = "castle"

		outline_2 = 'castle outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	house
		density=1
//		opaque=1
		icon_state = "house"

		outline_2 = 'house outline.dmi'

		drop_shadow = 'mountain shadow.dmi'
	rug
		icon_state = "rug"
		outline_2 = 'house floor outline.dmi'
	spine
		icon_state = "spine"
	spine2
		icon_state = "spine2"
	house_floor
		icon_state = "house floor"
		outline_2 = 'house floor outline.dmi'
obj

	decosss
		dont_reset = 1
		icon = 'turf.dmi'
		flower
			icon_state = "flower"
			density=0
		forge
			icon_state = "forge"
			density=1
		place_wire
			icon_state = "place wire here"
		arrow
			icon_state = "arrow"
		ore_cart
			icon_state = "ore cart"
			density = 1
		table
			icon_state = "table"
			density=1
		ancient_text
			icon_state = "ancient text"
			density = 1
		book2
			icon_state = "book 2"
			density = 0
		book
			icon_state = "book"
			density = 0
		charred_book
			icon_state = "charred book"
			density = 0
		bookshelf
			icon_state = "bookshelf"
			density = 1
		burnt_bookshelf
			icon_state = "burnt bookshelf"
			density = 0

		cart_track1
			icon_state = "tracks1"
			density = 0
		cart_track2
			icon_state = "tracks2"
			density = 0
		cart_track3
			icon_state = "tracks3"
			density = 0
		cart_track4
			icon_state = "tracks4"
			density = 0
		cart_track5
			icon_state = "tracks5"
			density = 0
		cart_track6
			icon_state = "tracks6"
			density = 0
		cart_track7
			icon_state = "tracks7"
			density = 0
		cart_track8
			icon_state = "tracks8"
			density = 0
		green_phial
			icon_state = "green phial"
			density = 0
		red_phial
			icon_state = "red phial"
			density = 0
		blue_phial
			icon_state = "blue phial"
			density = 0
		craacked_phial
			icon_state = "cracked phial"
			density = 0

		crate
			icon_state = "crate"
			density = 1

		statue
			icon_state = "statue"
			density=1
		fire
			icon_state = "fire"
			density = 0


		bone
			icon_state = "bone"
		skull
			icon_state = "skull"
		chairs
			icon_state = "chair 1"
			c2
				icon_state = "chair 2"
			c3
				icon_state = "chair 3"
			c4
				icon_state = "chair 4"

		flower1
			icon_state = "flower1"
		wall_carvings
			icon_state = "wall carvings"
		intact_wall_carvings
			icon_state = "intact wall carvings"

		cherry_bush
			icon_state = "cherry bush"
			density =1
		sword_weapon_rack
			icon_state = "sword weapon rack"
		empty_weapon_rack
			icon_state = "empty weapon rack"
		blood_spot
			icon_state = "blood spot"
		broken_sword
			icon_state = "broken sword"

	arrows
		dont_reset = 1
		icon = 'skill.dmi'
		a1
			icon_state = "a1"
		a2
			icon_state = "a2"