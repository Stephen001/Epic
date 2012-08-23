
chest

	dont_reset = 1
	reset_me()
		powered = 0
		name = "chest"
		for(var/xs in loot)

			if(text2num(xs) != null)

				var/check=1
				for(var/item/I in items)
					if(istype(I,/item/gold))
						check=0

				if(check==1)
					add_gold(text2num(xs))


			else

				var/X = text2path("/item/[xs]")

				var/check = 1
				for(var/item/I in items)
					if(I.type == X)
						check = 0

				if(check)
					items += new X
	chest

		//chests made here are normal and dont move and not locked
		/*
		chest0
			loot = list("potion/health_potion",10) //This chest has a health_potion and 10 gold.

			Just write out the item path to add items. like "weapon/sword" or "apparel/armor/leather"
		*/
		timed3
			fate_trap
				loot  = list("book/fate_trap")
			fate_wave
				loot = list("book/fate_wave")
		set_state()

		portal_gun
			loot = list("weapon/wormhole_science_handheld_portal_device")

		portal_cake
			loot = list("apparel/armor/cake_armor")
		PORN
			loot = list("weapon/wire","weapon/electric_charge")
		ssssspeartrap
			loot = list("book/spear_trap")
		sssstimepulse
			loot = list("book/time_pulse")
		wireblade
			loot = list("weapon/sword/wire_sword")
		WILSON
			loot = list("apparel/armor/WILSON")
		awesome
			loot = list("apparel/armor/awesome_armor")
		mudkipz
			loot = list("book/go_mudkipz")
		darkness
			loot = list("book/darkness")
		time_wave
			loot = list("book/time_wave")
		rasengan
			loot = list("book/spiral_cancer")
		ASpear_SG
			loot = list("weapon/bow/spear_SG")
		ASD
			loot = list("weapon/ASD")
		avalanche
			loot = list("book/avalanche")
		magmawave
			loot = list("book/magma_wave")
		icewave
			loot = list("book/ice_wave")
		vocare
			loot = list("book/vocare_animalia")
		sandstorm
			loot = list("book/sand_storm")
		cyclone
			loot = list("book/cyclone")
		brain
			loot = list("book/brain")
		snowball
			loot = list("book/snow_ball")
		drain
			loot = list("book/cyclone")


		charge
			loot = list("weapon/electric_charge")
		midtwist
			loot = list("weapon/axe/midtwist_scythe")
		wonderblade
			loot = list("weapon/blade/wonder_blade")
		carrot_sword
			loot = list("weapon/sword/carrot_sword")
		potato_canon
			loot = list("weapon/bow/potato_cannon")


		STEAM
			loot = list("apparel/armor/steam_armor")
		dyetest
			loot = list("dye/red_dye","dye/blue_dye","dye/yellow_dye")
		matts_dyes
			loot = list("dye/matts_dye_two","dye/matts_dye_one")
		dragon
			loot = list("300")
		chest0
			name = "Test"
			loot = list("weapon/bow/special_bow","apparel/armor/archer_gear")
		sun_crystal
			name = "Test"
			loot = list("sun_crystal")
		sand_crystal
			name = "Test"
			loot = list("sand_crystal")
		mine_bonus
			name = "Test"
			loot = list("apparel/shield/dark_shield","20")
		mine_end
			name = "Test"
			loot = list("weapon/axe/shadow_hammer","30")
		leet_archer
			name = "Test"
			loot = list("book/dust","apparel/armor/archer_gear","30")
		leet_tank
			name = "Test"
			loot = list("weapon/axe/orc_axe","apparel/armor/tank_armor","30")
		d4_final
			loot = list("weapon/blade/orc_bane","apparel/armor/hero_armor","apparel/shield/orc_shield","book/fire_trap","50","weapon/orcish_dagger","book/tree")
		shadow_chest
			loot = list("book/shadow_sickle","book/summon_zombie","26","book/tidal_wave")
		weapon_cache
			loot = list("weapon/bow/orc_bow","apparel/armor/tank_armor","20")
		newitems
			loot = list("book/flame","weapon/bow/ninja_star","apparel/shield/orc_shield","weapon/bow/shadow_bow","apparel/armor/archer_elf_gear","weapon/axe/dark_axe","weapon/mega_ice_staff","weapon/blade/kitchen_knife","weapon/enhanced_rat_claw")
		d9side
			loot = list("weapon/heart_staff","43","enchantment_crystals/mage/magical_crystal","book/flame")
		key
			loot = list("key")
		key2
			loot = list("key/key_2")
		key22
			loot = list("key/key_2","key/key_2")
		key3
			loot = list("key/key_3")
		key33
			loot = list("key/key_3","key/key_3")
		key45
			loot = list("key/key_4","key/key_4")
		key4
			loot = list("key/key_4")
		key5
			loot = list("key/key_5")
		berserk
			loot = list("book/berserk")
		key6
			loot = list("key/key_6")
		powerench
			loot = list("enchantment_crystals/power/brute_crystal","10")//you did all the enchantment crystals paths wrong
		kitchen
			loot = list("enchantment_crystals/power/brute_crystal","book/leaf_trap","10","book/tough_wave")//you did all the enchantment crystals paths wrong
		agilityench
			loot = list("enchantment_crystals/agility/lightweight_crystal","10")
		defenseench
			loot = list("enchantment_crystals/defense/tough_crystal","10")
		library
			loot = list("orb/orb_of_summoners","book/summon_swamp_creature","10")
		library2
			loot = list("enchantment_crystals/speed/swift_crystal","book/psychic_trap","10")
		desert
			loot = list("book/summon_sand_creature","book/sand_trap")
		drainench
			loot = list("enchantment_crystals/drain/vampiric_crystal","10")
		mageench
			loot = list("enchantment_crystals/mage/magical_crystal","10")
		sizeench
			loot = list("enchantment_crystals/size/large_crystal","10")
		speedench
			loot = list("enchantment_crystals/speed/swift_crystal","10")
		stunench
			loot = list("enchantment_crystals/stun/solid_crystal","10")
		sturdyench
			loot = list("enchantment_crystals/sturdy/strong_crystal","10") // DONT WRITE item/
		storm_chest
			loot = list("book/summon_lightning","book/summon_thunder","weapon/storm_staff","book/lightning_trap")
		lightning_chest
			loot = list("book/summon_lightning","book/lightning_trap","book/earthquake")
		dagger
			loot = list("weapon/dwarven_dagger","10")
		thunder_chest
			loot = list("book/summon_thunder","orb/orb_of_warriors","weapon/sword/sword_of_healing")
		hunter_orb
			loot = list("orb/orb_of_hunters")
		tank_orb
			loot = list("orb/orb_of_tanks")
		thief_orb
			loot = list("orb/orb_of_thieves")
		mage_orb
			loot = list("orb/orb_of_mages")
		warrior_orb
			loot = list("orb/orb_of_warriors")
		summoner_orb
			loot = list("orb/orb_of_summoners")
		strong
			loot = list("book/strong_wave","enchantment_crystals/agility/lightweight_crystal")
		secrety1
			loot = list("orb/orb_of_thieves","key","20")
		secrety2
			loot = list("dye/yellow","key")
		vanitty
			loot = list("vanity/demonic_wings","vanity/bone_wings","vanity/angel_wings")
		drain2ench
			loot = list("enchantment_crystals/drain/dark_crystal","20")
		mage2ench
			loot = list("enchantment_crystals/mage/mystic_crystal","20")
		size2ench
			loot = list("enchantment_crystals/size/huge_crystal","20")
		speed2ench
			loot = list("enchantment_crystals/speed/sonic_crystal","20")
		stun2ench
			loot = list("enchantment_crystals/stun/pulsing_crystal","20")
		sturdy2ench
			loot = list("enchantment_crystals/sturdy/firm_crystal","20")
		agility2ench
			loot = list("enchantment_crystals/agility/agile_crystal","20")
		defense2ench
			loot = list("enchantment_crystals/defense/hard_crystal","20")
		power2ench
			loot = list("enchantment_crystals/power/violent_crystal","20")
		spike
			loot = list("book/spike_trap","20")
		bomb
			loot = list("book/bomb_trap","30")
		santa_fucking_claus_bitch
			loot = list("apparel/armor/santa_armor")
		hunting_knife
			loot = list("weapon/hunting_knife")
		super_warrior
			loot = list("apparel/armor/super_warrior_armor")
		twin
			loot = list("weapon/blade/slicey_blade")
		rabbit_mask
			loot = list("vanity/rabbit_mask")
		rabbit_armor
			loot = list("apparel/armor/rabbit_armor")
		ventus
			loot = list("book/summon_ventus","29")
		psychic
			loot = list("book/psychic","25")
		suppression
			loot = list("book/suppression_wave","28","enchantment_crystals/stun/pulsing_crystal")
		blizzard
			loot = list("book/psychic","25","book/blizzard")
		chaos
			loot = list("25","book/chaos")
		moneh
			loot = list("200","key/key_6")
		water_wavee
			loot = list("25","book/water_wave","key/key_6")
		sand_wave
			loot = list("25","book/sand_wave","key/key_6")
		mud_trap
			loot = list("25","book/mud_trap","key/key_6")
		earth_trap
			loot = list("25","book/earth_trap","key/key_6")
		vortex
			loot = list("25","book/vortex","key/key_6")
		powerwkey
			loot = list("25","enchantment_crystals/power/violent_crystal","key/key_6")
		pixie
			loot = list("weapon/sword/pixie_blade","apparel/armor/pixie_armor")
		thunderflash
			loot = list("book/thunder_flash","key/key_6")
		vampire
			loot = list("book/summon_vampire")
		rabbits
			loot = list("book/summon_rabbits")
		werewolf
			loot = list("book/summon_werewolf")
		magma
			loot = list("book/magma")
		blade_storm
			loot = list("book/blade_storm")
		leaf_storm
			loot = list("book/leaf_storm")
		pitfall
			loot = list("book/pitfall_trap","key/key_6")
		thorn
			loot = list("book/thorn_trap")
		razor
			loot = list("book/razor_trap")
		matts
			loot = list("apparel/armor/kings_cape","weapon/sword/kings_sceptre")


	locked

		//chests made here are locked
		/*
		chest1
			loot = list("potion/health_potion")
		*/
		key3

			loot = list("key/key_3")
		dustchest
			name = "Test"
			loot = list("book/dust","apparel/armor/hard_robes","30")



	hard_locked


		//chests made here are locked and don't move
		/*
		chest2
			loot = list("potion/health_potion")
		*/
		dragonchest
			loot = list("weapon/sword/dragon_slayer","50","weapon/ritual_dagger")
		electric
			loot = list("book/electric","40","apparel/armor/thunder_robes","potion/red_mega_potion","potion/red_mega_potion","potion/blue_mega_potion","book/psychic_wave")
		fire_ball
			loot = list("book/fire_ball","40","potion/red_mega_potion","potion/red_mega_potion","potion/blue_mega_potion")
		dirt
			loot = list("book/dirt","40","potion/red_mega_potion","potion/red_mega_potion","potion/blue_mega_potion")
		mental
			loot = list("book/mental","50","book/darkness_wave")
		plague
			loot = list("book/plague","53","key","book/twister")