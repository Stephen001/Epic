
mob/var/faction_color = "white"
mob
	thornflower
		icon = 'thornspear.dmi'
		density=0
		team=2
		set_state()
		New(turf/t,mob/m)
			loc = t
			..()
			set_pos(px,py-10)
			flick("create",src)
			icon_state = "grounded"
			spawn(15)
				icon_state = "flower"
				flick("flowering",src)


				dir = SOUTH

				spawn(3)

					new/projectile/fire2(src,dir2angle(SOUTH))



				spawn(20)

					icon_state = "null"
					flick("lower flowering",src)

					spawn(10)
						del(src)
obj
	thornspear
		icon = 'thornspear.dmi'
		New(turf/t,mob/m)
			loc = t
			..()
			flick("create",src)
			icon_state = "grounded"
			spawn(15)
				icon_state = "risen"
				flick("spear",src)
				for(var/mob/M in t)
					M.damage(20,m)
				spawn(20)
					icon_state = "null"
					flick("lower",src)
					spawn(10)
						del(src)
Enemy
	parent_type = /liv


	var/player/summon_owner

	clockturne

		face(atom/a)

			return

		mob3(sta)

			return

		abilities = list()

		set_state()
			if(hp < 6950)
				if(icon_state == "")
					flick("turn on",src)
					can_attack=1
				icon_state = "on"
			else
				icon_state = ""

		pixel_x=0
		pixel_y=0
		bound_width = 224
		icon = 'clockturne.dmi'
		move_speed = 0
		hp = 7000
		icon_state = ""
		vrange=8
		var/turflist = list()
		can_attack=0
		AI()

			if(can_attack)
				can_attack=0
			else
				return
			var/attack = pick("thorns","flowers","huge thorns")

			switch(attack)
				if("thorns")

					var/X = rand(5,20)

					for(var/i=0,i<X,i++)

						var/turf/T = pick(turflist)
						new/obj/thornspear(T,src)

					spawn(45)
						can_attack=1
				if("huge thorns")

					var/X = length(turflist)

					for(var/i=0,i<X,i++)

						var/turf/T = pick(turflist)
						new/obj/thornspear(T,src)

					spawn(45)
						can_attack=1
				if("flowers")

					var/X = rand(2,6)

					var/turflist2 = list()

					for(var/turf/T in turflist)

						if(T.y == y-1)
							turflist2 += T



					for(var/i=0,i<X,i++)

						var/turf/T = pick(turflist2)
						new/mob/thornflower(T,src)

					spawn(10)
						can_attack=1

				if("blast")

				//	new/obj/bigblast(src)

					spawn(50)
						can_attack=1




		action()
			..()
			vel_x=0
			vel_y=0
		New()
			pwidth=224
			pheight=32
			turflist = block( locate(x,y-1,z), locate(x+6,y-7,z))

			..()
			for(var/Enemy/clockturne/E in orange(3))
				if(E <> src) del(E)

			items += new/item/weapon/bow/poison_spitter

			overlays-=NameOverlay
			NameOverlay.pixel_y = 32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay

		die(mob/m)
			if(live)
				live=0
				loc = null
	necrospawn_gallbeast

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)

			icon = Icon('necrospawn gallbeast.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays

		abilities = list("thorn_trap","AoE/rough_seas")
		set_state()

		pixel_x=-64
		pixel_y=-64
		icon = 'necrospawn gallbeast.dmi'
		move_speed = 2
		hp = 5500
		icon_state = ""
		vrange=8
		New()
			pwidth=32
			pheight=32
			..()
			for(var/Enemy/necrospawn_gallbeast/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/bow/poison_spitter

			overlays-=NameOverlay
			NameOverlay.pixel_y = 32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay

		die(mob/m)
			if(live)
				items = list()//removes arms from inventory
				items += new/item/key
				//put loot here <---make it have dragon armor on it when it dies -Matt
			..()
	clock_reaper

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)

			icon = Icon('Clock Reaper.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays

		abilities = list("AoE/blade_storm")
		set_state()

		pixel_x=-128
		pixel_y=-128
		icon = 'Clock Reaper.dmi'
		move_speed = 2
		hp = 5000
		icon_state = ""
		vrange=8
		New()
			pwidth=32
			pheight=32
			..()
			for(var/Enemy/clock_reaper/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/axe/god_clock_scythe

			overlays-=NameOverlay
			NameOverlay.pixel_y = 32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay

		die(mob/m)
			if(live)
				items = list()//removes arms from inventory
				items += new/item/weapon/wire
				items += new/item/weapon/electric_charge
				items += new/item/key/key_4
				//put loot here <---make it have dragon armor on it when it dies -Matt
			..()
	god_of_time

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)

			icon = Icon('TimeSpaceBoss.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays

		abilities = list("AoE/blade_storm","ancient","divine")
		set_state()

		pixel_x=-128
		pixel_y=-128
		icon = 'TimeSpaceBoss.dmi'
		move_speed = 4
		hp = 5000
		icon_state = ""
		vrange=8
		New()
			pwidth=32
			pheight=32
			..()
			for(var/Enemy/god_of_time/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/axe/god_clock_sword
			items += new/item/apparel/shield/god_clockwork_shield

			overlays-=NameOverlay
			NameOverlay.pixel_y = -32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay

		die(mob/m)
			if(live)
				items = list()//removes arms from inventory
				items += new/item/key
				//put loot here <---make it have dragon armor on it when it dies -Matt
			..()
	empire_demon

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)

			icon = Icon('empirezteam.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays

		abilities = list("plague","plague","AoE/chaos")
		set_state()

		pixel_x=-64
		pixel_y=-64
		icon = 'empirezteam.dmi'
		move_speed = 4
		hp = 3000
		icon_state = ""
		vrange=8
		New()
			pwidth=32
			pheight=32
			..()
			for(var/Enemy/empire_demon/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/demon_arm2
			items += new/item/weapon/demon_arm

			overlays-=NameOverlay
			NameOverlay.pixel_y = -32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay

		die(mob/m)
			if(live)
				items = list()//removes arms from inventory
				items += new/item/key
				//put loot here <---make it have dragon armor on it when it dies -Matt
			..()


	dragon


		dragon2
			hp = 2000

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)

			for(var/Enemy/dragon/E in orange(1))
				if(E <> src) del(E)

			icon = Icon('dragon.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays


		set_state()
		pwidth=32
		pheight=32
		pixel_x=-64
		pixel_y=-64
		icon = 'dragon.dmi'

		move_speed = 3
		hp = 300
		icon_state = ""

		New()
			pwidth=32
			pheight=32
			..()

			for(var/Enemy/dragon/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/dragon_arm
			items += new/item/weapon/dragon_arm
			overlays-=NameOverlay
			NameOverlay.pixel_y = -32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay
		die(mob/m)
			if(live)
				items = list()//removes arms from inventory
				items += new/item/apparel/armor/dragon_armor
				//put loot here <---make it have dragon armor on it when it dies -Matt
			..()

	Space_Robot

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)
			for(var/Enemy/dragon/E in orange(1))
				if(E <> src) del(E)
			icon = Icon('SpaceRobot.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays


		set_state()
		pwidth=32
		pheight=32
		pixel_x=-64
		pixel_y=-64
		icon = 'SpaceRobot.dmi'

		move_speed = 3
		hp = 3100
		icon_state = ""

		New()
			pwidth=32
			pheight=32
			..()

			for(var/Enemy/dragon/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/arm_1
			items += new/item/weapon/arm_2
			overlays-=NameOverlay
			NameOverlay.pixel_y = -32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay
		die(mob/m)
			if(live)
				items = list()
				items += new/item/key/key_4//removes arms from inventory
				//put loot here <---make it have dragon armor on it when it dies -Matt
			..()
	big_scorpion

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))

		mob3(sta)
			for(var/Enemy/dragon/E in orange(1))
				if(E <> src) del(E)
			icon = Icon('scorpion.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			underlays = w_overlays


		set_state()
		pwidth=32
		pheight=32
		pixel_x=-64
		pixel_y=-64
		icon = 'scorpion.dmi'

		move_speed = 3
		hp = 2100
		icon_state = ""

		New()
			pwidth=32
			pheight=32
			..()

			for(var/Enemy/scorpion/E in orange(1))
				if(E <> src) del(E)

			items += new/item/weapon/arm1
			items += new/item/weapon/arm2
			overlays-=NameOverlay
			NameOverlay.pixel_y = -32
			NameOverlay.pixel_x =  0
			overlays+=NameOverlay
		die(mob/m)
			if(live)
				items = list()//removes arms from inventory
				items += new/item/key/key_6//put loot here <---make it have dragon armor on it when it dies -Matt
			..()
	var
		player/target
		enemy_type = "orc"
		vrange=5
		dm
		or_ms
		or_v
		or = list(0,0,0)
		resetting = 0
		first_parent = 1
		create_list = list()
	icon = 'item.dmi'
	icon_state = "orc"

	hp = 20

	dont_reset = 1

	reset_me()
		resetting = 1
		loc = locate(or[1],or[2],or[3])
		step_x = 0
		step_y = 0
		items = list()
		live = 1
		target = null
		NameOverlay = null
		overlays=null
		hp = hp_max

		armor =null
		weapon_1 = null
		idol=null
		weapon_2 = null
		move_speed = or_ms
		first_parent = 0

		vrange = or_v

		for(var/t in create_list)
			items += new t

		create_list = list()

		add_stuff()

	New()
		..()

		for(var/X in abilities)

			var/R = text2path("/ability/[X]")

			abilities -= X
			abilities += new R

		add_stuff()
	proc/add_stuff()
		or[1] = x
		or[2] = y
		or[3] = z
		enemy_type = icon_state
		dm = move_speed
		add_gold(rand(1,10))

		NameOverlay = new/obj
		NameOverlay.maptext_width = 128
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -16
		NameOverlay.pixel_x=-32

		if(team == 1)
			faction_color = "blue"
		if(team == 2)
			faction_color = "red"
		if(team == 0)
			faction_color = "#F8F8F8 "
		NameOverlay.maptext = "<center><font color=[faction_color]>[src.name]"
		overlays+=NameOverlay

		hp_max = hp

		or_ms = move_speed
		or_v = vrange
		resetting = 0

		spawn()
			for(var/item/I in items)
				create_list += I.type
	elven_guard
		move_speed = 2
		hp = 20
		team = 1
		icon_state = "rogue elf"
		New()
			..()
			msg = pick("I used to be an adventurer, like you, but then I took an arrow in the knee.","The dark elves make my tummy rumble.","If you do a dance, you are dancing.","I have donuts","I just ate a donut","I don't like the wii.","Spiderman fills my needs.","When I'm alone, I talk to you, baby.","Tom is dumb.","Tom is very dumb.","I don't want to fly a kite today, mom.","May the lord Jesus Bunny bless you.","Rabbits are satan.","I'm not an armadillo.","My mom is a man.","I want to go fly somewhere.","My head is not on fire.","I haz a bucket","I'm firin mah lazor!")
			items += new/item/apparel/armor/elven_gear

	human
		move_speed = 2
		hp = 20
		team = 1
		icon_state = "human"
		New()
			..()


	dwarven_smith
		move_speed = 2
		hp = 1.#INF
		team = 1
		icon_state = "dwarf"
		New()
			..()
			items += new/item/apparel/armor/dwarven_blacksmith_armor
			items += new/item/weapon/axe/hammer
	chaos_spirit
		move_speed = 3
		hp = 10
		team = 1
		icon_state = "chaos"
		New()
			..()
			items += new/item/weapon/sword
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	pyros_spirit
		move_speed = 4
		hp = 15
		team = 1
		icon_state = "pyros"
		New()
			..()
			items += new/item/weapon/magic_staff
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	leprechaun
		move_speed = 2
		hp = 125
		team = 1
		icon_state = "leprechaun"
		New()
			..()
			items += new/item/weapon/axe/fist_of_falcon
			items += new/item/weapon/axe/fist_of_falcon
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	golem
		move_speed = 1
		hp = 300
		team = 1
		icon_state = "golem"
		New()
			..()
			items += new/item/weapon/axe/greatsword
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	aquos_spirit
		move_speed = 5
		hp = 20
		team = 1
		icon_state = "aquos"
		New()
			..()
			items += new/item/weapon/blade/ninja_sword
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	zombie
		move_speed = 3
		hp = 25
		team = 1
		icon_state = "zombie"
		New()
			..()
			items += new/item/weapon/snow_bear_claw
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	swamp_creature
		move_speed = 3
		hp = 30
		team = 1
		icon_state = "swamp creature"
		New()
			..()
			items += new/item/weapon/bow/elven_bow
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	sand_creature
		move_speed = 4
		hp = 30
		team = 1
		icon_state = "sand creature"
		New()
			..()
			items += new/item/weapon/bow/sand_monster_organ
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	storm_spirit
		move_speed = 5
		hp = 28
		team = 1
		icon_state = "storm"
		New()
			..()
			items += new/item/weapon/lightning_staff
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	lightning_spirit
		move_speed = 2
		hp = 31
		team = 1
		icon_state = "lightning"
		New()
			..()
			items += new/item/weapon/lightning_staff
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	thunder_spirit
		move_speed = 1
		hp = 34
		team = 1
		icon_state = "thunder"
		New()
			..()
			items += new/item/weapon/electro_staff
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	wind_spirit
		move_speed = 1
		hp = 39
		team = 1
		icon_state = "ventus"
		New()
			..()
			items += new/item/weapon/bow/wind_blade
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	octagon
		move_speed = 5
		hp = 1
		icon_state = "person"
		New()
			..()
			items += new/item/apparel/armor/octagon_armor

		dont_reset = 0
	vampire
		move_speed = 1
		hp = 42
		team = 1
		icon_state = "vampire"
		New()
			..()
			items += new/item/weapon/bow/teeth
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	rabbits
		move_speed = 1
		hp = 45
		team = 1
		icon_state = "rabbits"
		New()
			..()
			items += new/item/weapon/rabbit_claw
			items += new/item/weapon/rabbit_claw
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	mudkipz
		move_speed = 1
		hp = 90
		team = 1
		icon_state = "mudkipz"
		New()
			..()

			items += new/item/weapon/bow/sand_monster_organ

		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)

		abilities = list("mud_trap")


		dont_reset = 0
	werewolf
		move_speed = 1
		hp = 39
		team = 1
		icon_state = "werewolf"
		New()
			..()
			items += new/item/weapon/claw
			items += new/item/weapon/claw
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	nurse
		move_speed = 1
		hp = 200
		icon_state = "nurse"
		New()
			..()
			items += new/item/weapon/heart_staff
		die(mob/m)
			if(live)
				items = list()
			..()
			spawn()
				del(src)
		dont_reset = 0
	boss_orc
		move_speed=1


		vrange = 2
		attack_d = 10
		hp = 20

		New()
			..()
			items += new/item/weapon/axe
			items += new/item/apparel/armor/orc_gear
	master_orc
		move_speed=3


		vrange = 2

		hp = 40

		New()
			..()
			items += new/item/weapon/orc_sword
			items += new/item/weapon/orc_sword
			items += new/item/apparel/armor/orc_armor


	orc

		move_speed=2

		vrange = 3
		attack_d=10
		hp = 10

		New()
			..()
			items += new/item/weapon/sword

	battle_orc

		move_speed=3

		vrange = 3

		hp = 5

		New()
			..()
			items += pick(new/item/weapon/sword,new/item/weapon/axe)
			items += pick(new/item/apparel/armor/leather)
	archer_orc

		move_speed=1

		vrange = 7
		attack_d=20
		hp = 5

		New()
			..()
			items += pick(new/item/weapon/bow)
			items += pick(new/item/apparel/armor/leather)
	magic_orc
		move_speed = 1
		vrange = 4
		hp = 5
		New()
			..()
			items += new/item/weapon/magic_staff
			items += new/item/apparel/armor/robes
	berserk_orc
		move_speed = 4
		vrange = 3
		hp = 5
		New()
			..()
			items += new/item/weapon/blade
			items += new/item/weapon/blade
			items += pick(new/item/apparel/armor/speed_armor,new/item/apparel/armor/leather)

	wolf
		icon_state = "wolf"
		move_speed = 2
		vrange = 4
		hp = 10
		New()
			..()
			items += new/item/weapon/claw
			items += new/item/weapon/claw
			items += new/item/apparel/armor/wolf_pelt

	companion


		icon_state = "human"
		move_speed = 5
		vrange = 5
		hp = 40
		copy_speed=1

		team=1

		die(mob/m)

			if(live)
				sparkles += "blood"
				spawn(1)
					if(src)
						sparkles -= "blood"

				NameOverlay.maptext = ""

			can_loot = 0

			..()


		slow_down()
			if(target == summon_owner)

				vel_x=0
				vel_y=0
			else
				..()
		AI(t)

			..()

		//	del(src)
		//	return


	//		if(summon_owner == null)
		//		world.log << "test2"


		//	world.log << "test"
			vrange=5
			if(!summon_owner)
				loc = null
				return


			if(summon_owner)

				team = summon_owner.team

				target = get_target()

				if(target == null)
					target = summon_owner


			//	world.log << bounds_dist(summon_owner,src)



				if(bounds_dist(target,src) >= 160)
					if(target == summon_owner)

						pulses += image('item.dmi',icon_state = "dodge")
						spawn(5)
							pulses = list()

						set_pos(summon_owner.px,summon_owner.py)

					else
						target = summon_owner

	/*		if(summon_owner)

				if(summon_owner.z <> z)

					z = summon_owner.z
					set_pos(summon_owner.px,summon_owner.py)*/

			if(target == summon_owner && weapon_1 == null && weapon_2 == null)

				move_speed = summon_owner.move_speed

				if(bounds_dist(src,summon_owner ) > 24)
					move(get_dir(src,summon_owner))

				else
					face(summon_owner)
					slow_down()





		New(player/m)

			faction_color="white"
			..()
			summon_owner = m
			z = m.z
			set_pos(m.px,m.py)

			items = list()
			for(var/item/I in m.companion_items)
				items += I

			m.companion = src
			name = m.companion_name

			overlays -= NameOverlay
			NameOverlay.maptext = "<center><font color=white>[src.name]"
			overlays+=NameOverlay





		proc/revive()

			live=1
			density=1
			hp = hp_max
			mp = mp_max
			damage_number("revived")
			overlays -= NameOverlay
			NameOverlay.maptext = "<center><font color=white>[src.name]"
			overlays+=NameOverlay





	var/copy_speed=0

	die(mob/m)

		if(live)
			sparkles += "blood"
			spawn(1)
				if(src)
					sparkles -= "blood"

			NameOverlay.maptext = ""

		..()

	var/abilities = list()

	mp = 1.#INF

	var/skipaction = 0
	action(t)
		skipaction++
		if(skipaction==4)
			skipaction = 0
			return

		if(src==null) return
		..()
		if(stunned) return
		if(resetting) return
		if(mp < 200)
			mp+=10
		AI(t)
	proc/AI(t)



		if(live==0)
			if(vel_x <> 0 || vel_y <> 0)
				slow_down()

			return



		if(!weapon_1)
			for(var/item/weapon/I in src.items)
				if(I && I <> weapon_2)
					weapon_1 = I
					face(src)
			if(!weapon_1)
				for(var/item/apparel/shield/I in src.items)
					if(I && I <> weapon_2)
						weapon_1 = I
						face(src)
		if(!weapon_2)
			for(var/item/weapon/I in src.items)
				if(I && I <> weapon_1)
					weapon_2 = I
					face(src)
			if(!weapon_2)
				for(var/item/apparel/shield/I in src.items)
					if(I && I <> weapon_1)
						weapon_2 = I
						face(src)
		if(!armor)
			var/item/apparel/armor/I = locate(/item/apparel/armor/) in src.items
			if(I && I <> armor)
				armor = I
				hp=hp_max+I.defense
				face(src)



		if(t % 30 == 0 && armor)

			move_speed = dm + armor.speedboost
			if(summon_owner && target == summon_owner && copy_speed)
				move_speed = summon_owner.move_speed
		if(move_speed <= 0)
			move_speed = 1



		if(t % 30 == 0)


			if(target==null)
				target = get_target()
				if(target)
					if(target.sneak)
						target = null

		if(target && length(abilities) && prob(10))
			var/ability/a = pick(abilities)
			a.use(src)
		if(target && (weapon_1 || weapon_2))
			var/item/w=null


			if(weapon_1)
				if(istype(weapon_1,/item/))
					w = weapon_1
			if(weapon_2)
				if(istype(weapon_2,/item/))
					if(w==null)
						w = weapon_2
					else
						if(weapon_1.can_attack==0)
							w = weapon_2
						else
							if(weapon_2.can_attack==0)
								w = weapon_1
							else
								w = pick(weapon_1,weapon_2)
			if(w)

				if(istype(w,/item/weapon/))
					var/item/weapon/w1 = w
					if(target && bounds_dist(src, target) >= w1.w_range)


						if(summon_owner && target && target == summon_owner && copy_speed)
							move_speed = summon_owner.move_speed
						if(summon_owner && target && target <> summon_owner && copy_speed)
							move_speed = 5
							if(armor)
								move_speed+=armor.speedboost

						if(target == summon_owner)

							if(bounds_dist(src,summon_owner ) > 24)
								move(get_dir(src,target))

							else
								face(target)
								slow_down()

						else

							move(get_dir(src, target))

					else

						if(target && target <> summon_owner)

							face(target)
							src.slow_down()
							att(w)
				else
					if(istype(w,/item/apparel/shield/))



						if(target && bounds_dist(src, target) > 8)
							move(get_dir(src, target))

						else
							if(target && target <> summon_owner)
								face(target)
								src.slow_down()
								she(w)
			if(target)
				face(target)
			if(target && target.live==0)
				target=null
			if(target && target.sneak==0)
				target=null

		else

			if(summon_owner && target == null && bounds_dist(src,summon_owner) > 16)
				move(get_dir(src, summon_owner))
				if(copy_speed)
					move_speed = summon_owner.move_speed

			can_moves++
			if(can_moves==50)
				can_moves = 0
				dir=pick(NORTH,EAST,SOUTH,WEST)
				move(dir)
				angle(dir2angle(dir))



	var/can_moves=0
	var/attack_delays=0
	var/attack_d = 0
	var/must_target=30
	can_bump(liv/a)

		if(a == summon_owner)

			return 0

		if(istype(a))

			return a.live
		if(ismob(a))
			return a.density
		if(a.half_wall)
			return 1
		return ..()
	proc

		att(item/weapon/w)
			if(w.can_attack)
				if(src.attack_delays == 0)
					src.attack_delays = src.attack_d
					w.down(src)
					spawn(2)
						w.up(src)
				else
					src.attack_delays--
		she(item/apparel/shield/w)
			if(w.can_attack)
				if(src.attack_delays == 0)
					src.attack_delays = src.attack_d
					w.down(src)
					spawn(w.delay*2)
						w.up(src)
				else
					src.attack_delays--

		get_target()
			if(hp < hp_max)
				vrange = 15
			for(var/player/m in oview(vrange+2, src))

				if(m.team == 0)

					if(m.target_by == src.name)
						return m
					else
						continue

				if(m.sneak) continue
				if(m.team == team) continue
				if(m.live==0) continue
				if(istype(m,/turret/)) continue



				var/s = vrange-m.passive("Undetected")

				if(s < 2) s=2

				if(get_dist(m,src) >= s) continue

				if(get_obvious_path(src,m)==0) continue

				vrange = 10

				return m


			for(var/liv/m in oview(vrange+2, src))

				if(m.team == 0)
					if(m.target_by == src.name)
						return m
					else
						continue
				if(m.team == team) continue

				if(m.live==0) continue
				if(istype(m,/turret/)) continue

				var/s = vrange-m.passive("Undetected")
				if(s <=0) s=2
				if(get_dist(m,src) >= s) continue
				vrange = 10

				if(get_obvious_path(src,m)==0) continue

				return m
			for(var/player/p in oview(vrange,src))
				if(p == summon_owner)
					return p
	team=2
mob
	proc/can_target(mob/m)
		if(m.team == 0)
			return 0

		if(m.team == team) return 0

		if(m.live==0) return 0

		if(istype(m,/turret/)) return 0

		if(get_obvious_path(src,m)==0) return 0

		return 1

player
	team = 1


mob/var/target_by = "oompa loompas"
mob/var/sneak=0

mob

	proc
		get_obvious_path(atom/m1,atom/m2)

			var/turf/t = m1.loc
			var/turf/t2 = m2.loc

			while(t <> t2)

				t = get_step(t,get_dir(t,t2))

				if(t.density)

					return 0

				for(var/mob/m in t)

					if(istype(t,/liv))
						continue
					else
						if(m.density && m.pwidth==32 && m.pheight==32)
							return 0

			return 1




Enemy

	angle(a)


		angle = a

		var/s = enemy_type
		if(armor)
			s = armor.name

		mob3(s)

	proc

		face(atom/a)

			dir = get_dir(src,a)

			angle(dir2angle(dir))



		mob3(sta)

			icon = Icon('item.dmi',sta,angle)

			w_overlays = list()

			if(weapon_1)
				w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle))
			if(weapon_2)
				w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle))

			overlays = w_overlays
			overlays+=NameOverlay
			underlays = null

			underlays += Icon('item.dmi',legs,dir2angle(dir))

	set_state()
		if(vel_y <> 0 || vel_x <> 0)
			if(legs <> "legs-moving")
				legs = "legs-moving"
				underlays = null
				underlays += Icon('item.dmi',"legs-moving",dir2angle(dir))
		else
			if(legs <> "legs")
				legs = "legs"
				underlays = null
				underlays += Icon('item.dmi',"legs",dir2angle(dir))
mob/var/legs = "legs"