mob/var/item/armor

mob/var/auto_sell=1
client/control_freak = CONTROL_FREAK_SKIN

Enemy
	MouseDrop(player/a)

		if(istype(a) && src.summon_owner == a && a == usr)

			for(var/item/I in items)

				items -= I
				world.log << I.name
				a.items += I

			armor = null
			weapon_1 = null
			weapon_2 = null
		if(istype(a,/mob) && src.can_target(a) && usr == src.summon_owner)
			src.target = a



item

	var/price=0
	var/mage=0
	var/show_on_player=1
	var/can_attack=1
	var/speedboost
	var/delay=5
	var/skill = ""
	var/ability/ability
	var/absorb_hp
	var/movex=0
	var/defense = 0
	var/damage = 0
	New()
		..()
	proc/drag(mob/m)
	proc/drop(atom/a,mob/m)


		if(istype(a,/Enemy/companion))
			var/Enemy/companion/e = a

			if(e.summon_owner == m)

				if(istype(src,/item/apparel/armor/))

					for(var/item/apparel/armor/A in e.items)
						m.items += A
						e.items -= A
						if(e.armor == A)
							e.armor = null
					m.items -= src
					if(m.armor == src)
						m.armor = null
					e.items += src
					for(var/item/I in e.items)
						world.log << I
					e.armor = src


	/*			if(istype(src,/item/vanity/))
					e.items += src
				if(istype(src,/item/orb))
					e.items += src
					if(e.orb)
						e.class = "none"
						e.items -= e.orb
						m.items += e.orb
						e.orb = null*/


				if(istype(src,/item/apparel/shield/) || istype(src,/item/weapon/))

					if(istype(src,/item/weapon/) && src:double)

						for(var/item/A in e.items)

							if(e.weapon_2 == A)
								m.items += A
								e.items -= A
								e.weapon_2 = null
							if(e.weapon_1 == A)
								m.items += A
								e.items -= A
								e.weapon_1 = null

						m.items -= src
						if(m.weapon_1 == src)
							m.weapon_1 = null
						if(m.weapon_2 == src)
							m.weapon_2 = null
						e.items += src
						e.weapon_1 = src


					else

						if(e.weapon_1)

							if(e.weapon_2)

								for(var/item/A in e.items)

									if(e.weapon_2 == A)

										if(e.weapon_1)
											e.items -= e.weapon_1
											m.items += e.weapon_1

										e.weapon_1 = A



								if(m.weapon_1 == src)
									m.weapon_1 = null
								if(m.weapon_2 == src)
									m.weapon_2 = null
								m.items -= src
								e.items += src
								e.weapon_2 = src

							else
								for(var/item/A in e.items)

									if(A <> e.armor && A <> e.weapon_1)
										m.items += A
										e.items -= A
										e.weapon_2 = null

								if(m.weapon_1 == src)
									m.weapon_1 = null
								if(m.weapon_2 == src)
									m.weapon_2 = null
								m.items -= src
								e.items += src
								e.weapon_2 = src
						else

							for(var/item/A in e.items)

								if(A <> e.armor && A <> e.weapon_2)
									m.items += A
									e.items -= A
									e.weapon_1 = null

							if(m.weapon_1 == src)
								m.weapon_1 = null
							if(m.weapon_2 == src)
								m.weapon_2 = null

							m.items -= src
							e.items += src
							e.weapon_1 = src
				e.face(e)

		if(istype(a,/player/))
			var/player/p = a
			if(p.inv_count<25)
				if(p && p.confirmed_option && p.team <> p.key)
					switch(p.options("[m] wants to give you [src]") )
						if("yes")
							if(p && p.client)
								m.items -= src
								p.items += src
								p.hmenu.update(p,p)
								m.hmenu.update(m,m)

								p.damage_number("traded with [m]")
								m.damage_number("traded with [p]")

						else
							if(p && m)
								m.damage_number("[p] declines.")

		if(istype(a,/HudObject/clip/) && a.icon_state == "trash can" && m.confirmed_option && src.del_out==0)
			if(m)
				if(m.auto_sell==0)
					switch(m.options("destroy and sell [src]?") )
						if("yes")
							if(m && src && a)
								if(m.weapon_1 == src)
									m.weapon_1 = null
								if(m.weapon_2 == src)
									m.weapon_2 = null


								if(m.armor == src)
									m.armor = null
								if(src in m.vanity)
									m.vanity -= src
								if(m.orb == src)
									m.orb = null
								if(m.idol == src)
									m.idol = null
								m.add_gold(src.price)

								m.items -= src
								if(m.hmenu)
									m.hmenu.update(m.inview,m)
								m.angle(m.angle)
								return
				else
					if(m && src && a)
						if(m.weapon_1 == src)
							m.weapon_1 = null
						if(m.weapon_2 == src)
							m.weapon_2 = null


						if(m.armor == src)
							m.armor = null
						if(src in m.vanity)
							m.vanity -= src
						if(m.orb == src)
							m.orb = null
						if(m.idol == src)
							m.idol = null
						m.add_gold(src.price)

						m.items -= src
						if(m.hmenu)
							m.hmenu.update(m.inview,m)
						m.angle(m.angle)
						return

		if(istype(a,/HudObject/clip/) && a.icon_state <> "trash can" && a.icon_state <> "view")
			var/HudObject/clip/c = a
			if(c.set_item)

				if(istype(src,/item/dye/))
					if(m.can_dye(c.set_item,src))
						if(m && m.confirmed_option)
							switch(m.options("dye [c.set_item] with [src]?") )
								if("yes")
									if(m && src && c && c.set_item)

										if(m.weapon_1 == c.set_item)
											m.weapon_1 = null
										if(m.weapon_2 == c.set_item)
											m.weapon_2 = null
										if(m.armor == c.set_item)
											m.armor = null
										if(c.set_item in m.vanity)
											m.vanity -= c.set_item
										if(m.idol == c.set_item)
											m.idol = null
										if(m.orb == c.set_item)
											m.orb = null
										if(m.weapon_1 == src)
											m.weapon_1 = null
										if(m.weapon_2 == src)
											m.weapon_2 = null
										if(m.armor == src)
											m.armor = null
										if(src in m.vanity)
											m.vanity -= src
										if(m.orb == src)
											m.orb = null
										if(m.idol == src)
											m.idol = null
										m.items -= src

										m.angle(m.angle)

										m.dye(c.set_item,src)

										if(m.hmenu)
											m.hmenu.update(m.inview,m)

											m.hmenu.hide()

										m.menu_open=0
										m.move_speed=5

					return
		if(istype(a,/HudObject/clip/) && a.icon_state <> "trash can" && a.icon_state <> "view" && m.can_craft)
			var/HudObject/clip/c = a
			if(c.set_item)
				if(m.can_craft(src,c.set_item))
					if(m && m.confirmed_option)
						switch(m.options("combine [src] and [c.set_item]?") )
							if("yes")
								if(m && src && c && c.set_item)

									if(m.weapon_1 == src)
										m.weapon_1 = null
									if(m.weapon_2 == src)
										m.weapon_2 = null
									if(m.armor == src)
										m.armor = null
									if(src in m.vanity)
										m.vanity -= src
									if(m.orb == src)
										m.orb = null
									if(m.idol == src)
										m.idol = null
									if(m.weapon_1 == c.set_item)
										m.weapon_1 = null
									if(m.weapon_2 == c.set_item)
										m.weapon_2 = null
									if(m.armor == c.set_item)
										m.armor = null
									if(c.set_item in m.vanity)
										m.vanity -= c.set_item
									if(m.orb == c.set_item)
										m.orb = null
									if(m.idol == c.set_item)
										m.idol = null
									m.items -= src
									m.items -= c.set_item

									m.angle(m.angle)

									m.craft(src,c.set_item)

									if(m.hmenu)
										m.hmenu.update(m.inview,m)

										m.hmenu.hide()

									m.menu_open=0
									m.move_speed=5

			return
		if(istype(a,/HudObject/clip/) && a.icon_state <> "trash can" && m.can_enchant)
			var/HudObject/clip/c = a
			if(c.set_item)
				if(istype(src,/item/enchantment_crystals/))
					if(m && m.confirmed_option)
						switch(m.options("enchant [c.set_item] with [src]?") )
							if("yes")
								if(m && src && c && c.set_item)

									if(m.weapon_1 == c.set_item)
										m.weapon_1 = null
									if(m.weapon_2 == c.set_item)
										m.weapon_2 = null
									if(m.armor == c.set_item)
										m.armor = null
									if(c.set_item in m.vanity)
										m.vanity -= c.set_item
									if(m.orb == c.set_item)
										m.orb = null
									if(m.idol == c.set_item)
										m.idol = null
									m.angle(m.angle)
									if(c.set_item.add_enchantment(src.enchantment))
										m.damage_number("successful enchantment")
										m.items -= src
									else
										m.damage_number("enchantment failed")

									if(m.hmenu)
										m.hmenu.update(m.inview,m)

										m.hmenu.hide()

									m.menu_open=0
									m.move_speed=5

			return
	gold

		icon_state = "gold"
		item_type = 100
	vanity
		item_type = 5
		price = 2000
		desc = "vanity item, no stat bonuses"
	orb
		item_type = 6
		New()
			..()
			desc = "[passive]"
			icon_state = name



		var/orbname = ""

		orb_of_warriors
			passive = "50% stun resist"
			orbname = "warrior"
		orb_of_thieves
			passive = "25% dodge chance"
			orbname = "thief"
		orb_of_mages
			passive = "half cooldowns"
			orbname = "mage"
		orb_of_summoners
			passive = "double mana regen"
			orbname = "summoner"
		orb_of_tanks
			passive = "double hp regen"
			orbname = "tank"
		orb_of_hunters
			passive = "reduced bow delay"
			orbname = "hunter"



		orb_of_vanguards
			passive = "100% stun resist"
			orbname = "vanguard"
		orb_of_ninjas
			passive = "40% dodge chance"
			orbname = "ninja"
		orb_of_ultramancers
			passive = "no cooldowns"
			orbname = "ultramancer"
		orb_of_warlocks
			passive = "triple mana regen"
			orbname = "warlock"
		orb_of_juggernauts
			passive = "triple hp regen"
			orbname = "juggernaut"
		orb_of_assailants
			passive = "+50% projectile damage"
			orbname = "assailant"
		orb_of_cutthroats
			passive = "triple criticals"
			orbname = "cutthroat"
		orb_of_warlords
			passive = "1/3 spin charge time"
			orbname = "warlord"
		orb_of_steam
			passive = "+5 damage"
			orbname = "steam overlord"



	var/cr=0
	var/cg=0
	var/cb=0
	dye
		var
			red=0
			blue=0
			green=0
		New()
			..()
			var/icon/I = icon(icon,icon_state)
			I.Blend(rgb(src.red,src.blue,src.green))
			icon = I
			desc = "drag on gear to dye it"

		icon_state = "dye"


		red_dye
			red = 50
		yellow_dye
			green = 50
			blue = 50
		blue_dye
			blue = 50

	book

		item_type = 4

		New()
			..()
			desc = "teaches the [skill] spell"
			book.set_ability(skill)

		var/item/weapon/book/book = new()

		icon = 'item.dmi'
		icon_state = "book"


		fire
			skill = "fire"
			price=10
		ice
			skill = "ice"
			price=12
		heal
			skill = "heal"
			price=10

		New()

			..()

	//
	//		overlays+=image('skill.dmi',icon_state = skill, pixel_x=32,pixel_y=18)
		//	world << src
	//		var/icon/I = Icon('skill.dmi',icon_state = "book")
	//		Icon2('skill.dmi',icon_state = "[skill]",0,I)


		drag(mob/m)
			m.book = src

		drop(atom/a,mob/m)

			..()
			var/HudObject/slot/s=null
			if(istype(a,/HudObject/slot/))
				s = a
			if(!s)

				if(istype(a,/HudObject/clip/))
					var/HudObject/clip/c = a
					if(c.set_item && m.can_enchant)
						if(istype(c.set_item,/item/apparel/armor/))
							if(m.book)
								c.set_item.skill = m.book.skill

								if(c.set_item.skill <> "")
									var/X = text2path("/ability/[c.set_item.skill]")
									c.set_item.ability = new X
								m.damage_number("successful enchant")
								c.set_item.desc = "defense:[c.set_item.defense]<br>magic:[c.set_item.mage]<br>speed:[c.set_item.speedboost]"
								if(c.set_item.skill)
									c.set_item.desc = "[c.set_item.desc]<br>ability:[c.set_item.skill]"
								m.items -= m.book
								m.hmenu.update(m.inview,m)
								if(m.weapon_1 == book)
									m.weapon_1 = null
								if(m.weapon_2 == book)
									m.weapon_2 = null
								m.angle(m.angle)
		//		return

			if(m.book && s)

				s.sets_ability("[m.book.skill]")

				m.abils[s.numb] = m.book.skill

				m.book = null
			if(m.hbar)
				m.hbar.update()
			m.items -= src
			m.hmenu.update(m.inview,m)
			del(src)
	weapon
		item_type = 1
		var/w_range
		var/swingspeed

		var/stun=0

		var/can_spin=0
		var/presses=0
		var/held = 0

		chakram

			icon_state = "chakram"
			damage = 5
			swingspeed = 20
			var/charged=0
			down(mob/m)

				if(x_off) return
				var/X = presses
				while(presses == X && m)
					rotate = m.ca(rotate+20)
					x_off = 5
					m.angle(m.angle)
					charged++
					sleep(world.tick_lag)
				if(!m) return
				x_off = 10
				m.angle(m.angle)
				spawn(5)
					if(x_off == 10)
						x_off = 0
						rotate=0
						m.angle(m.angle)


			up(mob/m)

				if(x_off == 5) return
				presses++

				if(charged>=damage)

					m.spin(src)


				else
					m.attack(src)

				rotate=0


		down(mob/m)

			m.sneak=0
			m.shooting = 1

			if(can_spin || m.has_epic("earth"))

				can_spin=0
				if(m.shielding==0)
					m.spin(src)


			else
				m.attack(src)

			presses++
			var/X = presses

			held = 1

			var/spin_time = 15

			if(m.orb("1/3 spin charge time"))
				spin_time = 5

			spawn(spin_time)

				if(presses == X && held && m && m.shielding==0)

					if(m)
						m.pulses += image('item.dmi',icon_state = "spin",layer=10)
					spawn(3)
						if(m)
							m.pulses = list()
					can_spin = 1



		up(mob/m)

			held = 0

			m.shooting=0


			if(can_spin)

				can_spin=0
				m.spin(src)



		New()
			..()
			desc = "damage:[damage]<br>speed:[swingspeed]<br>size:[w_range]"
			if(absorb_mana)
				desc = "[desc]<br>mana drain:[absorb_mana]"
			if(absorb_hp)
				desc = "[desc]<br>hp drain:[absorb_hp]"
			if(poison)
				desc = "[desc]<br>poison:[poison]"

		sword
			icon_state = "sword"
			w_range=20
			swingspeed=20
			damage=5
			delay = 1
			desc = "its a sword stupid"
			price=1
		orc_sword
			icon_state = "orc sword"
			w_range=27
			swingspeed=10
			damage=7
			delay = 2
			desc = "rawr"
			price=20
		blade
			icon_state = "blade"
			w_range=25
			swingspeed=25
			damage=3
			delay = 0
			desc = "slice"
			price=15
		dagger
			damage = 1
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "dagger"
		orcish_dagger
			damage = 2
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "orcish dagger"
		dwarven_dagger
			damage = 4
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "dwarven dagger"
		ritual_dagger
			damage = 5
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "ritual dagger"
		refined_dagger
			damage = 6
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "ritual dagger"
		dirty_dagger
			damage = 8
			w_range = 4
			delay = 0
			swingspeed=31
			icon_state = "dirty dagger"
		barbed_dagger
			damage = 7
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "barbed dagger"
		water_dagger
			damage = 8
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "water dagger"
		devilish_dagger
			damage = 9
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "devilish dagger"
		darkfate_dagger
			damage = 17
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "darkfate dagger"
		flaming_dagger
			damage = 20
			w_range = 4
			delay = 0
			swingspeed=28
			icon_state = "flaming dagger"

		zephyrazor
			damage = 20
			w_range = 4
			delay = 0
			swingspeed=35
			icon_state = "zephyrazor"



		rouge_slayer
			name = "rogue slayer"
			damage = 12
			w_range = 4
			poison = 10
			delay = 0
			swingspeed=28
			icon_state = "rouge slayer"
		hunting_knife
			damage = 5
			w_range = 4
			delay = 0
			stun = 1
			swingspeed=28
			icon_state = "hunting knife"
		dragon_arm
			icon = 'dragon.dmi'
			icon_state = "arm"
			w_range=8
			swingspeed=10
			damage=10
			delay = 2
			t_range=2
			desc = "slice"
			price=15
		arm_1
			icon = 'SpaceRobot.dmi'
			icon_state = "arm 1"
			w_range=8
			swingspeed=10
			damage=18
			delay = 2
			t_range=2
			desc = "slice"
			price=15
		arm_2
			icon = 'SpaceRobot.dmi'
			icon_state = "arm 2"
			w_range=8
			swingspeed=10
			damage=18
			delay = 2
			t_range=2
			desc = "slice"
			price=15
		arm1
			icon = 'scorpion.dmi'
			icon_state = "arm1"
			w_range=8
			swingspeed=10
			damage=20
			delay = 2
			t_range=2
			desc = "slice"
			price=15
		arm2
			icon = 'scorpion.dmi'
			icon_state = "arm2"
			w_range=8
			swingspeed=10
			damage=20
			delay = 2
			t_range=2
			desc = "slice"
			price=15
		demon_arm
			icon = 'empirezteam.dmi'
			icon_state = "arm 1"
			w_range=8
			swingspeed=10
			damage=15
			delay = 2
			desc = "slice"
			t_range=2
			price=15
		demon_arm2
			icon = 'empirezteam.dmi'
			icon_state = "arm 2"
			w_range=64
			swingspeed=10
			damage=10
			delay = 2
			t_range=2
			desc = "slice"
			price=15
		claw
			icon_state = "claw"
			w_range=5
			swingspeed=30
			damage=2
			delay = 0
			desc = "rawr"
			price=5
		enhanced_rat_claw
			icon_state = "claw"
			w_range=5
			swingspeed=20
			damage=4
			delay = 2
			desc = "boss rat"
			price=5
		rat_claw
			icon_state = "rat claw"
			w_range=5
			swingspeed=30
			damage=3
			delay = 2
			desc = "rawr"
			price=7
		black_bear_claw
			icon_state = "bear claw"
			w_range=10
			swingspeed=24
			damage=4
			delay = 3
			desc = "rawr"
			price=7
		snow_bear_claw
			icon_state = "snow bear claw"
			w_range=10
			swingspeed=24
			damage=5
			delay = 3
			desc = "rawr"
			price=7
		swamp_rabbit_claw
			icon_state = "swamp rabbit claw"
			w_range=8
			swingspeed=27
			damage=6
			delay = 3
			desc = "rawr"
			price=7
		undead_rabbit_claw
			icon_state = "undead rabbit claw"
			w_range=8
			swingspeed=28
			damage=7
			delay = 3
			desc = "rawr"
			price=7
		rabbit_claw
			icon_state = "rabbit claw"
			w_range=8
			swingspeed=29
			damage=8
			delay = 3
			desc = "rawr"
			price=7
		wind_spawn_claw
			icon_state = "wind spawn claw"
			w_range=8
			swingspeed=30
			damage=9
			delay = 3
			desc = "rawr"
			price=8
		water_spawn_claw
			icon_state = "water spawn claw"
			w_range=8
			swingspeed=30
			damage=10
			delay = 3
			desc = "rawr"
			price=8
		orc_claw
			icon_state = "orc claw"
			w_range=8
			swingspeed=30
			damage=12
			delay = 3
			desc = "rawr"
			price=8
		pidgeon_talon
			icon_state = "pidgeon talons"
			w_range=8
			swingspeed=30
			damage=13
			delay = 3
			desc = "rawr"
			price=8
		hawk_talon
			icon_state = "hawk talons"
			w_range=8
			swingspeed=30
			damage=14
			delay = 3
			desc = "rawr"
			price=8
		glitched_claw
			icon_state = "glitched claw"
			w_range=8
			swingspeed=30
			damage=7
			absorb_hp = 7
			delay = 3
			desc = "rawr"
			price=8
		eagle_talon
			icon_state = "eagle talons"
			w_range=8
			swingspeed=30
			damage=15
			delay = 3
			desc = "rawr"
			price=8
		scorpion_claw
			icon_state = "scorpion claw"
			w_range=8
			swingspeed=30
			damage=15
			delay = 3
			desc = "rawr"
			price=8
		raven_talon
			icon_state = "raven talons"
			w_range=8
			swingspeed=30
			damage=16
			delay = 3
			desc = "rawr"
			price=8
		spider_fang
			icon_state = "spider fang"
			w_range=8
			swingspeed=30
			damage=17
			delay = 3
			desc = "rawr"
			price=8
		digging_mitts
			icon_state = "digging mitts"
			w_range=10
			swingspeed=20
			damage=10
			delay = 5
			desc = "rawr"
			price=62
		arsenix_blade
			icon_state = "arsenix blade"
			w_range=40
			swingspeed=25
			damage=50
			delay = 0
			desc = "fuck"
			price=40

		katana
			icon_state = "katana"
			w_range=25
			swingspeed=50
			damage=1
			delay = 0
			desc = "sliceyy"
			price=50
		axe
			icon_state = "axe"
			w_range=25
			swingspeed=15
			damage=7
			delay = 2
			desc = "chop"
			price=5
		healing_staff
			icon_state = "healing staff"
			w_range=20
			swingspeed=10
			damage=-10
			New()
				..()
				desc = "hit friends<br>heal:[damage]<br>speed:[swingspeed]<br>range:[w_range]"
			desc = "smack your friends"
			price=15
		heart_staff
			icon_state = "heart staff"
			w_range=20
			swingspeed=12
			damage=-20
			desc = "smack your friends"
			New()
				..()
				desc = "hit friends<br>heal:[damage]<br>speed:[swingspeed]<br>range:[w_range]"
			price=20
		magic_staff
			icon_state = "magic staff"
			w_range=50
			swingspeed=4
			damage=5
			desc = "shoot fire"
			price=20
			New()
				..()
				desc = "shoot fire"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("fire")
				can_attack=0
				spawn(30)
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds

						can_attack=1
						m.unpoint(src)
		ice_staff
			icon_state = "ice staff"
			w_range=50
			swingspeed=4
			damage=5
			desc = "shoot ice"
			price=20
			New()
				..()
				desc = "shoot ice"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("ice")
				can_attack=0
				spawn(30)
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds

						can_attack=1
						m.unpoint(src)

		book

			icon_state = "book held"
			w_range=100
			skill = "fire"

			var/no_pull
			var/pull = "book open"

			double = 0

			down(mob/m)
				if(can_attack == 0 || m.shielding) return


				if(skill:can_use==0) return 0

				if(m.mp < skill:mp_usage)
					return 0
				if(m.hp < skill:hp_usage)
					return 0

				if(!m.dungeon)

					if(m.team <> m.key)

						return 0

				can_attack = 0
				icon_state = pull
				m.angle(m.angle)
				m.point(src)

				spawn(delay)
					can_attack = 1
					icon_state = no_pull
					m.angle(m.angle)
					m.unpoint(src)

				skill:use(m)



			up(mob/m)

			proc/set_ability(s)

				var/X = text2path("/ability/[s]")
				var/ability/A = new X

				skill = A
				delay = A.cooldown

			New()
				..()
				no_pull = icon_state

				var/X = text2path("/ability/[skill]")
				var/ability/A = new X

				skill = A
				delay = A.cooldown




		bow
			icon_state = "bow"
			w_range=100
			damage=3
			delay=10
			double = 1
			price=5
			var/arrowfire=0
			skill = "arrow"
			desc = "shoot arrows"
			var/pull_back = "bow pull"
			var/no_pull
			var/range
			New()
				..()
				no_pull = icon_state

				var/X = text2path("/projectile/[skill]")
				var/projectile/p = new X
				damage = p.damage
				range = p.range
				desc = "damage:[damage]<br>reload:[delay]<br>range:[range]"
				if(p.poison)
					desc = "[desc]<br>poison:[p.poison]"
				if(p.stun)
					desc = "[desc]<br>stun:[p.stun]"

			down(mob/m)
				if(can_attack==0 || m.shielding) return
				else
					can_attack=2
					arrowfire=0
					icon_state = pull_back
					m.point(src)
					m.view_sound('arrow pull.wav')



					presses++
					var/X = presses
					spawn(10)
						if(src && m && presses == X && icon_state == pull_back)
							arrowfire=1
							m.pulses += image('item.dmi',icon_state = "spin",layer=10)
							spawn(3)
								m.pulses = list()
			up(mob/m)

				if(icon_state == pull_back && can_attack==2)
					icon_state = no_pull
					m.unpoint(src)


					if(arrowfire || m.has_epic("wind"))

						m.shoot("[skill]",convert(m.angle+20))
						m.shoot("[skill]",convert(m.angle-20))
						m.shoot("[skill]")
					else

						m.shoot("[skill]")


					m.view_sound('arrow shoot.wav')
					can_attack=0

					var/d = delay

					if(m.orb("reduced bow delay"))
						d = d-2

					if(d <=0)
						d=0.2

					spawn(d)
						can_attack=1


		electric_charge

			icon_state = "electric charge"
			stackable=1
			show_on_player = 0
			sete=0
			price=1
			del_out=1
			New()
				..()
				desc = "Powers up a box, one use per charge."
			down(mob/m)

				for(var/power_box/unpowered/b in m.front(20))

					b.powered = 1
					b.loc.powered = 1
				m.items -= src
				m.hmenu.update(m.inview)

			up(mob/m)

		wire
			icon_state = "wire"
			stackable=1
			show_on_player = 0
			sete=0
			price=1
			del_out=1
			New()
				..()
				desc = "Place on tiles to carry an electric current."
			down(mob/m)

				m.place_wire(1)

			up(mob/m)

		wire_cutter
			icon_state = "wire cutter"

			show_on_player = 0
			New()
				..()
				desc = "Removes wire."

			down(mob/m)


				m.place_wire(-1)


			up(mob/m)
			price=2

	apparel
		item_type = 1
		shield
			icon_state = "shield"
			delay = 5
			defense = 5

			price=5

			New()
				..()
				desc = "stun:[delay]<br>defense:[defense]"

			down(mob/m)
				can_attack=0
				m.shield(src)


			up(mob/m)
				can_attack=1
				m.unshield(src)
				can_attack=1
				m.shielding=0
				m.can_attack=1

			arsenix_shield
				delay = 50
				defense = 50
				icon_state = "arsenix shield"
				price=500

		armor
			icon_state = "armor"
			item_type = 3
			defense = 10
			New()
				..()

				desc = "defense:[defense]<br>magic:[mage]<br>speed:[speedboost]"
				if(skill)
					desc = "[desc]<br>ability:[skill]"

				if(skill <> "")
					var/X = text2path("/ability/[skill]")
					ability = new X

			orc_gear
				icon_state = "orc gear"
				defense = 20
				price=10



			orc_armor
				icon_state = "orc armor"
				defense = 25
				speedboost=0
				price=15

			arsenix_armor
				icon_state = "arsenix armor"
				defense = 100
				speedboost=4
				price=100
				mage=60

			speed_armor
				icon_state = "speed armor"
				defense = 5
				speedboost=2
				price=10

			weak_ninja_suit
				icon_state = "weak ninja suit"
				defense = 10
				speedboost=3
				price=25



			robes
				icon_state = "robes"
				defense=5
				mage=10
				price=20

			leather
				icon_state = "leather"
				defense=10
				speedboost=1
				price=5

			wolf_pelt
				icon_state = "wolf pelt"
				defense=0
				speedboost=2
				mage=5
				price=5

			mystic_leather
				icon_state = "mystic leather"
				defense=5
				mage=10
				speedboost=1
				price=10

			hard_armor
				icon_state = "hard armor"
				defense = 30
				speedboost = -1
				price=20



	companion_crystal

		item_type = 2
		price = 200
		icon_state = "companion crystal"
		New()
			..()
			desc = "click to toggle companion"

		effect(player/m)
			m.summon_companion()

	potion
		stackable=TRUE
		item_type = 2

		New()
			..()
			desc = "press F to use in combat"
		health_potion
			icon_state = "red potion"

			effect(mob/m)
				m.hp+=20
				if(m.hp >= m.hp_max)
					m.hp = m.hp_max

				m.items-=src
				m.sparkles+="heal"
				spawn(5)
					m.sparkles-="heal"
			price=2

		mana_potion
			icon_state = "blue potion"

			effect(mob/m)
				m.mp+=20
				if(m.mp >= m.mp_max)
					m.mp = m.mp_max

				m.items-=src
				m.sparkles+="magic"
				spawn(5)
					m.sparkles-="magic"
			price = 2
		red_mega_potion
			icon_state = "red mega potion"

			effect(mob/m)
				m.hp+=35
				if(m.hp >= m.hp_max)
					m.hp = m.hp_max

				m.items-=src
				m.sparkles+="heal"
				spawn(5)
					m.sparkles-="heal"
			price=6
		blue_mega_potion
			icon_state = "blue mega potion"

			effect(mob/m)
				m.mp+=35
				if(m.mp >= m.mp_max)
					m.mp = m.mp_max

				m.items-=src
				m.sparkles+="magic"
				spawn(5)
					m.sparkles-="magic"
			price = 6
		steroid
			icon_state = "steroid"
			price = 3
			effect(mob/m)

				m.view_sound('swing.wav')

				if(m.armor.speedboost < 7)
					m.armor.speedboost += 2

					m.hp -= 15
					if(m.hp <0) m.hp = 0

					spawn(60)
						if(m && m.armor)
							m.armor.speedboost -= 2

				m.items-=src
				m.sparkles+="WTF"
				spawn(5)
					if(m) m.sparkles-="WTF"
			price = 10
		AIDS_potion
			icon_state = "red mega potion"

			effect(mob/m)

				m.poisonme(m,9001,1)


				m.items-=src
				m.sparkles+="AIDS"
				spawn(5)
					m.sparkles-="AIDS"

			price=6