mob
	proc/add_gold(amount)

		for(var/item/gold/g in items)
			g.price+=amount
			return
		var/item/gold/g2 = new/item/gold
		g2.price = amount
		items+=g2
	proc/get_gold(amount)
		for(var/item/gold/g in items)
			return g.price
		return 0

chest
	parent_type = /mob

	icon = 'objects.dmi'
	icon_state = "chest"


	pwidth = 16
	pheight = 13
	pixel_y=-11
	pixel_x=-8

	density=1

	var/loot = list()

	step_x = 8
	step_y = 8

	New()
		..()
//		spawn()
//			pixel_move(8,8)
		name = "chest"
		for(var/xs in loot)

			if(text2num(xs) != null)

				add_gold(text2num(xs))


			else

				var/X = text2path("/item/[xs]")

				items += new X
	ck4
		fate
			loot = list("book/fate")
		gear_rampage
			loot = list("book/gear_rampage")

	idols
		water_idol
			loot = list("epic_idol/water_idol")
		fire_idol
			loot = list("epic_idol/fire_idol")
		earth_idol
			loot = list("epic_idol/earth_idol")
		wind_idol
			loot = list("epic_idol/wind_idol")
	dcire_test_chest
		loot = list("book/beserk")

	test_chest
		loot = list("weapon/sword","apparel/shield","weapon/axe","apparel/armor","10","weapon/dagger")

	test_chest2
		loot = list("weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire_cutter")

	gear1
		loot = list("weapon/sword","apparel/shield","weapon/dagger","20")
	arsenix
		loot = list("weapon/arsenix_blade","apparel/shield/arsenix_shield","apparel/armor/arsenix_armor")
	mage_loot
		loot = list("book/fire","book/heal","key")

	orbs_2
		orb_of_vanguards
			loot = list("orb/orb_of_vanguards")
		orb_of_ninjas
			loot = list("orb/orb_of_ninjas")
		orb_of_ultramancers
			loot = list("orb/orb_of_ultramancers")
		orb_of_warlocks
			loot = list("orb/orb_of_warlocks")
		orb_of_juggernauts
			loot = list("orb/orb_of_juggernauts")
		orb_of_assailants
			loot = list("orb/orb_of_assailants")
		orb_of_cutthroats
			loot = list("orb/orb_of_cutthroats")
		orb_of_warlords
			loot = list("orb/orb_of_warlords")


	special_1
		loot = list("weapon/magic_staff","15","book/energy_wave")
	special_2
		loot = list("weapon/healing_staff","15")
	special_3
		loot = list("weapon/axe")
	wires3
		loot = list("weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire_cutter")
	jwires3
		loot = list("weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire","weapon/wire_cutter")
	wiress3
		loot = list("weapon/wire","weapon/wire","weapon/wire","weapon/wire_cutter")

	hard_locked
		icon_state = "hard locked chest"


		ice_loot
			loot = list("apparel/armor/mystic_leather","book/ice","book/ice_trap")
		gear3
			loot = list("weapon/bow","potion/health_potion","potion/health_potion")

		d2gear

			loot = list("apparel/armor/hard_armor","apparel/armor/speed_armor","potion/health_potion","potion/health_potion","10")
		d3gear
			loot = list("apparel/armor/robes","book/fire","book/heal","20")


		d2gear2

			loot = list("weapon/bow","apparel/armor/robes","book/summon_chaos","potion/health_potion","5")

		set_state()
			if(powered)
				icon_state = "chest"
			else
				icon_state = "hard locked chest"


	locked
		set_state()
			if(powered)
				icon_state = "chest"
			else
				icon_state = "locked chest"
		icon_state = "locked chest"
		var
			movede = 0

		move()
			..()
			movede = 2

		action()
			..()
			if(movede)
				movede -= 1
			else
				slow_down()

		bumped(atom/movable/a)
			move(a.dir)


		gear2
			loot = list("apparel/armor","potion/health_potion","potion/health_potion","10")
			pixel_y=-6
		test_locked_chest
			loot = list("weapon/axe","apparel/armor","10","weapon/wire")