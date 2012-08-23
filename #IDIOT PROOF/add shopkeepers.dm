a
shopkeeper
	dont_reset = 1
	movement()
		return
		/*

	EXAMPLE (works similarly to chests)

	shopkeeper_one
		stock = list("weapon/wire","weapon/wire_cutter","potion/health_potion","potion/mana_potion")

	*/
	team=0
	underlife_vanity
		stock = list("vanity/beams_of_divinity","vanity/blood_splatter")
	shopkeeper_mage
		stock = list("weapon/dust_staff","weapon/magic_staff","weapon/ice_staff","weapon/healing_staff")
	blacksmith
		stock = list("apparel/armor/hard_armor","apparel/armor/robes","apparel/armor/orc_armor","apparel/armor/hard_robes","apparel/armor/mystic_leather")
	archer_supplies
		stock = list("apparel/armor/archer_gear","weapon/bow","weapon/bow/orc_bow","apparel/armor/mystic_leather","apparel/armor/leather","apparel/armor/speed_armor")
	blade_dealer
		stock = list("weapon/orc_sword","weapon/sword","apparel/shield","weapon/katana","apparel/shield/orc_shield")
	archer_blackmarket
		stock = list("weapon/bow/shadow_bow","weapon/bow/dark_bow")
	weapon_salesman
		stock = list("weapon/sword/shadow_dagger","weapon/axe/dark_axe","weapon/blade/ninja_sword","weapon/blade/elven_blade")
	shopkeepertwo
		stock = list("weapon/wire","weapon/wire_cutter","potion/red_mega_potion","potion/blue_mega_potion","weapon/bow/dwarven_bow","weapon/plague_staff","weapon/lightning_staff","weapon/mental_staff","weapon/bow/elven_bow")
	dye_seller
		stock = list("dye/yellow","dye/blue","dye/red")
	vanity_sellerone
		stock = list("vanity/demonic_wings","vanity/angel_wings","vanity/bone_wings")
	vanity_sellertwo
		stock = list("vanity/horns","vanity/halo","vanity/feathers")
		dir = NORTH
	huzza_supply_stocker
		stock = list("potion/blue_mega_potion","potion/red_mega_potion")
		dir = WEST
	huzza_armor_seller
		stock = list("apparel/armor/refined_armor","apparel/armor/swamp_armor","apparel/armor/swamp_gear","apparel/armor/dark_elf_scientist_cloak","apparel/armor/dark_elf_plate_armor")
		dir = EAST
	huzza_weapon_dealer
		stock = list("weapon/bow/tomahawk","weapon/axe/greatsword","weapon/axe/glass_greatsword","weapon/blade/cutlass","weapon/sword/dwarven_sword")
		dir = NORTH