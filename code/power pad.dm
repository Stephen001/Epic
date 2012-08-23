power_pad
	can_power_doors = 1
	parent_type = /turf
	powered =1
	icon = 'objects.dmi'
	icon_state = "power pad"

	stepped_on(atom/a)
		a.powered = 1
	stepped_off(atom/a)
		a.powered = 0
//	reset_me()
//		powered=1
mob/var/weighted=0

turf
	powered=0

pressure_pad
	can_power_doors = 1
	parent_type = /turf
	powered = 0
	icon = 'objects.dmi'
	icon_state = "pressure pad"
	dont_reset = 1
	reset_me()
		powered = 0

	button_pad
		icon_state = "button pad"
		stepped_on(mob/a)
			if(istype(a))
				if(a.weighted)
					powered = 1
			//		a.powered=1
					icon_state = "power pad"
		stepped_off(mob/a)
			if(istype(a))
				if(a.weighted)
					powered = 0
				//	a.powered=0
					icon_state = "button pad"


	stepped_on(player/a)
		if(istype(a))
			powered = 1
	//		a.powered=1
			icon_state = "power pad"
	stepped_off(player/a)
		if(istype(a))
			powered = 0
			a.powered=0
			icon_state = "pressure pad"

	invishouse
		icon_state = "house floor"
	invisstone
		icon_state = "stone floor"
	asdf
		icon_state = "metal floor"
	invisdune
		icon_state = "dune"
	gravel
		icon_state = "gravel"


spear
	parent_type = /mob
	north
		dir = NORTH
	south
		dir = SOUTH
	east
		dir = EAST
	west
		dir = WEST
	New()
		..()
		var/icon/I2 = Icon('objects.dmi',"spear",dir2angle(dir))
		icon = I2
	density = 0
	invisibility=2
	var/update_me=0
	var/recent_damaged = list()
	action()


		powered=0
		for(var/atom/a in orange(1,src))
			if(a.powered)
				powered=1
		if(powered)

			for(var/liv/m in orange(0,src))

				m.loc = get_step(src,src.dir)

				m.dir = src.dir
				step(m,m.dir)

				if(m in recent_damaged)
					continue
				else
					recent_damaged+=m
					spawn(5)
						recent_damaged -= m
					m.damage(20,src)
			if(invisibility)
				invisibility=0
				density=0
				view_sound('open_door.wav')
		else
			invisibility=2




atom
	var/can_power_doors=0

power_door
	parent_type = /mob
	icon = 'objects.dmi'
	density=1
	powered=0
	icon_state = "door"

	dont_reset = 1

	reset_me()
		powered = 0

	New()
		..()
		powered=0
	action()
		..()
		powered=0
		for(var/atom/a in orange(1,src))
			if(a.powered)
				if(istype(a,/liv/))
					continue
				if(a.can_power_doors)
					powered=1
	set_state()

		if(powered)
			if(icon_state == "door")
				icon_state = "open door"
				density=0
				view_sound('open_door.wav')
		else
			icon_state = "door"
			density=1

secret_door
	parent_type = /mob
	icon = 'objects.dmi'
	density=1
	powered=0
	icon_state = "house"

	dont_reset = 1
	reset_me()
		powered = 0

	action()
		powered=0
		for(var/atom/a in orange(1,src))
			if(a.powered)
				powered=1
		if(powered)
			if(icon_state == "house")
				icon_state = "open door"
				density=0
				view_sound('open_door.wav')
		else
			icon_state = "house"
			density=1
	stone
		icon_state = "castle"
	mountain
		icon_state = "mountain"


door

	parent_type = /obj
	icon = 'objects.dmi'
	density=1
	icon_state = "door1"

	dont_reset = 1

	reset_me()
		powered = 0
		density = 1
		state = 0
		icon_state = "door1"

	var/state = 0
	proc/close()
		if(locked) return
		if(state) return


		state = 1

		if(locate(/mob) in orange(0,src))
			spawn(10) close()
			return

		state = 0
		density = 1
		icon_state = "door1"




	var/locked = 0
	var/key_type = "key"
	locked_door
		icon_state = "locked"
		locked=1
		locked_two
			key_type = "key 2"
			icon_state = "locked 2"
		locked_three
			key_type = "key 3"
			icon_state = "locked 3"
		locked_four
			key_type = "key 4"
			icon_state = "locked 4"
		locked_five
			key_type = "key 5"
			icon_state = "locked 5"
		locked_six
			key_type = "key 6"
			icon_state = "locked 6"

target
	parent_type = /turf
	icon = 'objects.dmi'
	density=0
	icon_state = "target"
	outline=0
	dont_reset = 1
	reset_me()
		powered = 0

	stepped_on(atom/a)
		..()
		if(istype(a,/projectile/))
			powered = 1
		for(var/power_box/unpowered/p in orange(1,src))
			p.powered = powered
turret
	parent_type = /mob
	icon = 'objects.dmi'
	icon_state = "turret"
	density=1
	pixel_y=-8
	pixel_x=-8
	pwidth=16
	pheight=16

	dont_reset = 1
	reset_me()
		powered = 0

	var/ability/skill

	New()
		..()

		set_dir(dir)

		var/X = text2path("/ability/[name]")
		skill = new X

		if(d_i)
			set_pos(px,py+8)

	proc/set_dir(d)

		dir = d

		if(d_i == "turret")
			var/icon/I = new('objects.dmi',icon_state = "turret")
			I.Turn(-dir2angle(dir))
			icon = I

		angle = dir2angle(dir)
	var/d_i = "turret"
	action()
		..()
		if(d_i)
			powered=0
		for(var/atom/a in orange(1,src))
			if(a.powered)
				powered=1


		if(powered)
			if(skill.can_use)
				skill.use(src)
	penor
		d_i = null
		New()
			name = "poison_dart"
			..()
		dir = SOUTH
		powered=1
		pwidth = 32
		pheight = 32
		pixel_y=0
		pixel_x=-32
		icon = 'big statue.dmi'
		icon_state = "penorpion"
	fire
		New()
			name = "cannon"
			..()
		north
			dir = NORTH
		south
			dir = SOUTH
		east
			dir = EAST
		west
			dir = WEST



power_link
	can_power_doors = 1
	parent_type = /mob

	var/linked=0

	icon = 'objects.dmi'
	icon_state  = "power link"
	set_state()
	nomob = 1
	density=0
//	live=0
	move()
	set_pos()

	can_portal = 0

	start
		invis
			invisibility=2
		set_state()
			..()
			if(powered == 1)
				icon_state = "power link on"
			else
				icon_state = "power link"
		action()
			..()
			powered = 0
			for(var/atom/a in orange(1,src))
				if(a.powered)
					powered = 1
			//		world << a
				//	world << powered
			for(var/power_link/carry/c in orange(1,src))

				if(powered)
					c.linked = 1
				else

					c.linked = 0

				c.get_pulse()

	carry
		invis
			invisibility=2
		set_state()
			..()
			if(linked == 1)
				icon_state = "power link on"
			else
				icon_state = "power link"
		proc/get_pulse()

			for(var/power_link/carry/c in orange(1,src))

				if(c.linked <> linked)
					c.linked = linked
					c.get_pulse()



	end
		invis
			invisibility=2
		set_state()
			..()
			if(powered == 1)
				icon_state = "power link on"
			else
				icon_state = "power link"
		action()
			..()

			powered = 0

			for(var/power_link/carry/c in orange(1,src))
				if(c.linked == 1)
					powered = 1



lever
	parent_type = /mob
	icon = 'objects.dmi'
	icon_state = "lever off"
	can_power_doors = 1
	pwidth=16
	pheight=16
	pixel_y=-8
	pixel_x=-8
	step_x = 8
	step_y = 8

	twenty
		time = 20

	dont_reset = 1
	reset_me()
		powered = 0

	action()
		powered = on

	var/time = 30

	var/on = 0

	set_state()
		if(on)
			icon_state = "lever on"
		else
			icon_state = "lever off"

	proc/on()
		if(on) return
		on = 1
		spawn(time)
			on = 0


power_box
	can_power_doors = 1
	parent_type = /mob

	powered=1

	icon = 'objects.dmi'
	icon_state = "big box"

	density = 1

	pwidth=32
	pheight=32
	pixel_y=0
	pixel_x=0
	dont_reset = 1

	var/mob/carried

	unpowered
		icon_state = "big box dead"
		powered = 0
		var/specific_type = null
		invisible
			density=0
			invisibility=2
			pad_only
				specific_type = /pressure_pad

			box_only
				specific_type = /power_box/unpowered/invisible
		dont_reset=1
		reset_me()

			powered = 0



	//		for(var/turf/T in orange(1))
	//			T.powered=0
		New()
			..()
			powered=0


		//	if(timed)
		//		timer = timed
		var/timer
		var/timed = 0
		var/pre
		timed_box
			pre = "timed "
			timed = 50
			icon_state = "timed big box dead"
		var/update_me=0
		action()
			..()



	/*		if(powered && timed)

				for(var/turf/a in orange(1,src))
					a.powered = 0

				if(timer > 0)

					var/X = list(1,2,3,4,5,6,7,8,9,10)
					if(timer/10 in X)
						damage_number("[timer/10]","black")

					timer--
					powered = 1

				else

					timer = timed
					powered = 0
					icon_state = "[pre]big box dead"
			else*/
			powered=0

			for(var/atom/a in orange(1,src))
		//		world << a
				if(a.powered)
				//	if(timed) world << a
			//		if(specific_type)

					//	if(a.type == specific_type)
						//	powered = 1

			//		else

					powered=1
		//		if(timed)
		//			a.powered = powered
		set_state()
	//		..()
			if(powered)
				icon_state = "[pre]big box"

			else
				icon_state = "[pre]big box dead"

	movable
		icon_state = "box"

		pwidth=16
		pheight=16
		pixel_y=-8
		pixel_x=-8

		step_x = 8
		step_y = 8

		var
			movede = 0

		var/or = list(0,0,0)

		New()
			..()
			or[1] = x
			or[2] = y
			or[3] = z

		reset_me()
			loc = locate(or[1],or[2],or[3])
			step_x = 8
			step_y = 8

		move()
			..()
			moved = 5

		action()
			..()

			powered =1
			can_power_doors = 1

			if(carried)
				density = 0

				set_pos(carried.px,carried.py)

			else
				density = 1

			if(movede)
				movede -= 1
			else
				slow_down()

		bumped(atom/movable/a)
			move(a.dir)

		can_bump(liv/a)
			if(istype(a))
				return a.live
			else
				if(a.half_wall)
					return 1
				return a.density


		proc/get_portal()


		weighted_rock
			powered = 0
			weighted = 1
			icon_state = "weighted rock"

			var/buttons = list()

			action()

				..()
				powered = 0

				for(var/pressure_pad/button_pad/p in locs)

					if(p in buttons)
						powered=0
					else
						buttons+=p
						p.stepped_on(src)
				for(var/turf/t in buttons)
					if(t in locs)
						powered=0
					else
						buttons -= t
						t.stepped_off(src)

				for(var/turf/fizzler/t in locs)



					pixel_y -= 8
					layer = MOB_LAYER

					carried.carrying = null

					carried = null

					reset_me()

					return




		portals

			powered = 0

			purple_portal

				icon_state = "purple portal"


			yellow_portal

				icon_state = "yellow portal"

			get_portal()
				var/X = block(locate(1,1,z),locate(50,50,z))

				for(var/turf/T in X)

					for(var/power_box/movable/portals/p in T)

						if(p.icon_state <> icon_state) return p

			action(t)
				..()
				powered=0

				if(carried)
					return
				else

					for(var/player/a in inside())




						if(a.can_portal)


							var/power_box/movable/portals/p = get_portal()

							if(p)
								if(p.carried)
									return

								a.set_pos(p.px,p.py)

							a.can_portal = 0
							spawn(10)
								a.can_portal = 1

					for(var/projectile/a in orange(0,src))


						if(a.can_portal)



							var/power_box/movable/portals/p = get_portal()

							if(p)
								if(p.carried)
									return

								a.set_pos(p.px,p.py)

							a.can_portal = 0
							spawn(10)
								a.can_portal = 1





atom/var/powered = 0
atom/var/can_portal = 1

wire
	parent_type = /mob

	can_power_doors = 1
	density=0
	live=0

	pwidth = 32
	pheight = 32

	icon = 'objects.dmi'

	action(t)

		..()

		for(var/atom/a in oview(1,src))
			if(a.powered)

				powered = 1

				for(var/atom/movable/a2 in oview(0,src))
					a2.powered=1

				return

		powered=0
		for(var/atom/a in oview(0,src))
			a.powered=0

	New()

		..()

		for(var/wire/a in oview(1,src))
			a.cast()
		spawn()
			cast()

	Del()

		var/alist = list()

		for(var/wire/a in oview(1,src))
			alist+=a

		loc=null

		for(var/wire/a in alist)
			a.cast()

		..()

	proc/cast()
		var/icon/I = new('objects.dmi',icon_state = icon_state)

		overlays=null

		for(var/wire/w in orange(1,src))

			var/dx = w.px - px
			var/dy = w.py - py

			var/icon/I2 = Icon('objects.dmi',"[icon_state] s",arctan2(dx, dy))

			overlays+=I2


		icon = I

	set_state()
		if(powered)
			icon_state = "lit wire"
		else
			icon_state = "wire"

mob


	proc/place_wire(placing_wire)

		if(placing_wire == 1)

			var/can=0
			for(var/item/weapon/wire/w in items)
				items -= w

				var/check=0
				for(var/item/weapon/wire/w2 in items)
					check=1
				if(check==0)
					if(w == weapon_1)
						weapon_1 = null
					if(w == weapon_2)
						weapon_2 = null
				angle(dir2angle(dir))
				can=1
				break

			if(can)

				var/turf/tloc = loc

				for(var/chest/hard_locked/c in front(20))
					tloc = c.loc
				for(var/wire/w in tloc)
					return

				new/wire(tloc)


		if(placing_wire == -1)

			for(var/wire/w in orange(1))

				items += new/item/weapon/wire

				del(w)

