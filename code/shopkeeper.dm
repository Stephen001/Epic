shopkeeper

	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=1


	icon_state = "shopkeeper"


	var/stock = list()

	var/shop_name = "shop"
	companion_man
		stock = list("companion_crystal")

		shop_name = "companion dealer"

	shopkeeper_one
		stock = list("weapon/wire_cutter","potion/health_potion","potion/mana_potion")
	pvp_shop
		stock = list("weapon/bow/dart_gun","weapon/axe/foam_finger","potion/steroid","book/laser_shield","book/summon_golem","weapon/axe/rainbow_sword","weapon/axe/fist_of_falcon","weapon/blade/crayon","weapon/axe/mutton_masher","weapon/axe/troll_bane","weapon/bow/photon_cannon","weapon/bow/glue_gun","weapon/bow/blowpipe","apparel/shield/ipod","book/summon_leprechaun")
		New()
			..()
			name = "pvp shop"
			NameOverlay.maptext = "<center><font color = #F8F8F8 >pvp shop"
	New()
		..()
		name = "[shop_name]"

		NameOverlay = new/obj
		NameOverlay.maptext_width = 128
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -16
		NameOverlay.pixel_x=-32
		NameOverlay.maptext = "<center><font color = #F8F8F8 >[name]"

		overlays += NameOverlay

		for(var/xs in stock)

			if(text2num(xs) != null)

				add_gold(text2num(xs))


			else

				var/X = text2path("/item/[xs]")

				items += new X

