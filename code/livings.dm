mob
	var/live=0
mob
	var/pvppoints=0
	var
		damagetaken = 0
		report_hp = 0
liv
	parent_type = /mob

	pwidth=15
	pheight=15
	pixel_x=-25
	pixel_y=-25
	icon = 'item.dmi'

	var/can_loot=1
	live=1



	die(mob/m)

		if(istype(m,/Enemy))
			if(m:summon_owner)
				src.die(m:summon_owner)
				return

		if(live)
			damage_number("dead","[rgb(100,0,0)]","<b>")
			view_sound('die.wav')

			for(var/mob/m2 in m.party)
				m2.kill(src)



			if(m.client)

				if(m.hp+20<=m.hp_max) m.hp+=20
				else m.hp = m.hp_max

				m.hp_bar.update(m)

				m.pulses += image('item.dmi',icon_state = "flashes",layer=10)
				spawn(4)
					m.pulses = list()

				if(m.key == m.team && m <> src)

					m.pvppoints ++


			live=0
			density=0
			angle(angle)

	ore
		dont_reset = 1
		team = 0
		icon_state = "ore"
		target_by = list("dark elf miner","dwarven_miner")
		pixel_y=-16
		pixel_x=-16
		pheight=32
		pwidth=32

		hp = 1.#INF

		die()
			return
		movement()
			return
	enchantment_table
		dont_reset = 1
		team = 0
		icon_state = "enchantment table"
		pixel_y=-16
		pixel_x=-16
		pheight=32
		pwidth=32

		hp = 1.#INF

		die()
			return
		movement()
			return
	anvil
		dont_reset = 1
		team = 0
		icon_state = "anvil"
		target_by = list("dwarven blacksmith","dwarven smith")
		pixel_y=-16
		pixel_x=-16
		pheight=32
		pwidth=32

		hp = 1.#INF

		die()
			return
		movement()
			return
	var/sparkling=0


	action()
		..()



		for(var/trap/T in orange(0,src))
			if(T.owner <> src && T.can_explode)
				T.explode(src)


		if(live)
			if(damaged==1)
				if(invisibility==3)
					invisibility=0
				else
					invisibility=3
				report_hp = 1

			if(damaged==0)

				if(report_hp)
					damage_number(damagetaken,"[rgb(153,0,0)]","<b>")
					damagetaken = 0
					report_hp = 0

				invisibility=0

			sparkling++

			if(sparkling==10)
				sparkling=0


				if(damaged==-1)
					new/obj/sparkle(src,"heal")

				for(var/s in sparkles)
					new/obj/sparkle(src,s)


		else
			invisibility=0
			slow_down()

			if(report_hp)
				damage_number(damagetaken,"[rgb(153,0,0)]","<b>")
				damagetaken = 0
				report_hp = 0

			sparkling++

			if(sparkling==10)
				sparkling=0
				for(var/s in sparkles)
					new/obj/sparkle(src,s)

mob
	var/mob/inview
	var/list/sparkles = list()
