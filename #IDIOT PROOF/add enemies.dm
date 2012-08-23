

Enemy

	/*

	EXAMPLE - copy + paste


	boss_orc

		icon_state = "orc"

		move_speed=1 //(how many pixels it moves per step, before speedboost is added by armor. default for humans is 5)


		vrange = 2  //(how many tiles a player must be in its view range before it spots them and targets them)

		hp = 20 //(10 HP = 1 heart. this is BEFORE armor add-ons)

		New()
			..()
			//This is where you write out what items it has.

			//For every item you want it to have, you must type out the path type.

			items += new/item/weapon/axe //Adds one axe. It will equip this.
			items += new/item/weapon/axe //Since you added two axes, it will dual weild.
			items += new/item/apparel/armor/orc_gear //Adds orc gear to its items, it will equip this.
			items += new/item/apparel/armor/orc_gear //Adds a second orc gear. This won't be equipped because it will already have armor.
	*/
	orc_archer2
		name = "orc ranger"
		icon_state = "orc"
		move_speed = 2
		vrange = 5
		hp = 20
		attack_d = 20
		New()
			..()
			items += new/item/weapon/bow
			items += new/item/apparel/armor/archer_gear
	snow_wolf
		icon_state = "wolf"
		move_speed = 3
		vrange = 4
		hp = 10
		New()
			..()
			items += new/item/weapon/claw
			items += new/item/weapon/claw
			items += new/item/apparel/armor/snow_wolf_pelt

	dark_elf
		icon_state = "dark elf"
		move_speed = 2
		vrange = 4
		attack_d = 5
		hp = 10
		New()
			..()
			items += new/item/weapon/bow/dark_bow
			items += new/item/apparel/armor/dark_elf_gear
	archer_elf//What's the attack_d thing? its the forced delay between attacks
		icon_state = "dark elf"
		move_speed = 2
		vrange = 4
		attack_d = 5
		hp = 15
		New()
			..()
			items += new/item/weapon/bow/shadow_bow
			items += new/item/apparel/armor/archer_elf_gear
	chaos_elf
		icon_state = "dark elf"
		move_speed = 2
		vrange = 4
		hp = 70
		New()
			..()
			items += new/item/weapon/shadow_staff
			items += new/item/apparel/armor/black_mage_robes
	elf_traitor//Third dungeon boss
		icon_state = "rogue elf"
		move_speed = 2
		vrange = 4
		hp = 60
		New()
			..()
			items += new/item/weapon/blade/elven_blade
			items += new/item/weapon/blade/elven_blade
			items += new/item/apparel/armor/elven_armor
	dark_elf_ninja//boss
		icon_state = "dark elf ninja"
		move_speed = 3
		vrange = 3
		hp = 40
		New()
			..()
			items += new/item/weapon/blade/ninja_sword
			items += new/item/apparel/armor/dark_elf_ninja_suit
	dark_elf_brute//It's going to be the second dungeon boss
		icon_state = "dark elf"
		move_speed = 2
		vrange = 4
		hp = 30
		New()
			..()
			items += new/item/weapon/axe/dark_axe
			items += new/item/weapon/axe/dark_axe
			items += new/item/apparel/armor/dark_elf_brute
	assassin_elf
		icon_state = "dark elf"
		move_speed = 2
		vrange = 10
		hp = 10
		New()
			..()
			items += new/item/weapon/sword/shadow_dagger
			items += new/item/weapon/sword/shadow_dagger
			items += new/item/apparel/armor/dark_elf_gear
	rat
		icon_state = "rat"
		move_speed = 3
		vrange = 5
		hp = 10
		New()
			..()
			items += new/item/weapon/rat_claw
			items += new/item/weapon/rat_claw
			items += new/item/apparel/armor/rat_pelt
	guard_rat
		icon_state = "rat"
		move_speed = 3
		vrange = 5
		hp = 50
		New()
			..()
			items += new/item/weapon/enhanced_rat_claw
			items += new/item/weapon/enhanced_rat_claw
			items += new/item/apparel/armor/enhanced_rat_pelt
	dark_elf_chef
		icon_state = "dark elf"
		move_speed = 2
		vrange = 5
		hp = 40
		New()
			..()
			items += new/item/weapon/blade/kitchen_knife
			items += new/item/weapon/blade/kitchen_knife
			items += new/item/apparel/armor/dark_elf_chef_outfit
	dark_elf_miner
		icon_state = "dark elf"
		move_speed = 2
		vrange = 3
		hp = 5
		New()
			..()
			items += new/item/weapon/axe/pick_axe
			items += new/item/apparel/armor/dark_elf_miner_armor
	dark_elf_elite_miner
		icon_state = "dark elf"
		move_speed = 2
		vrange = 3
		hp = 20
		New()
			..()
			items += new/item/weapon/axe/pick_axe
			items += new/item/weapon/axe/pick_axe
			items += new/item/apparel/armor/dark_elf_elite_miner_armor

	arcane_orc
		move_speed=2


		vrange = 2

		hp = 50

		New()
			..()
			items += new/item/weapon/orc_sword
			items += new/item/weapon/dust_staff
			items += new/item/apparel/armor/orc_robes
	orc_leader
		move_speed=2


		vrange = 3

		hp = 60

		New()
			..()
			items += new/item/weapon/sword/dwarven_sword
			items += new/item/apparel/shield/advanced_orc_shield//lol e.e
			items += new/item/apparel/armor/advanced_orc_armor
	dark_elf_mage
		move_speed=2
		icon_state = "dark elf"


		vrange = 3

		hp = 20

		New()
			..()
			items += new/item/weapon/mega_ice_staff
			items += new/item/apparel/armor/dark_elf_mage_cloth
	dark_elf_mageE
		move_speed=2
		icon_state = "dark elf"

		name = "dark elf electromancer"
		vrange = 4

		hp = 23

		New()
			..()
			items += new/item/weapon/electro_staff
			items += new/item/apparel/armor/dark_elf_mage_armor

	dwarven_blacksmith
		move_speed=2
		icon_state = "dwarf"


		vrange = 3

		hp = 23

		New()
			..()
			items += new/item/weapon/axe/hammer
			items += new/item/apparel/armor/dwarven_blacksmith_armor
	dwarven_blacksmith_leader
		move_speed=1
		icon_state = "dwarf"


		vrange = 4

		hp = 120

		New()
			..()
			items += new/item/weapon/axe/dwarven_hammer
			items += new/item/weapon/axe/dwarven_hammer
			items += new/item/apparel/armor/dwarven_blacksmith_leader_armor
			items += new/item/key
	dwarven_fire_mage
		move_speed=2
		icon_state = "dwarf"

		vrange = 4

		hp = 26

		New()
			..()
			items += new/item/weapon/mega_magic_staff
			items += new/item/apparel/armor/dwarven_fire_robes
	dwarven_thunder_mage
		move_speed=3
		icon_state = "dwarf"

		vrange = 4

		hp = 28

		New()
			..()
			items += new/item/weapon/lightning_staff
			items += new/item/apparel/armor/dwarven_thunder_cloth
	dwarven_mage
		move_speed=2
		icon_state = "dwarf"

		vrange = 4

		hp = 20

		New()
			..()
			items += new/item/weapon/dirt_staff
			items += new/item/apparel/armor/dwarven_robes
	dwarven_librarian
		move_speed=1
		icon_state = "dwarf"

		vrange = 3

		hp = 30

		New()
			..()
			items += new/item/weapon/sword/spear
			items += new/item/apparel/armor/dwarven_armor
	dwarven_surveillance
		move_speed=1
		icon_state = "dwarf"

		vrange = 6

		hp = 30

		New()
			..()
			items += new/item/weapon/bow/dwarven_bow
			items += new/item/apparel/armor/dwarven_archer_gear

	corrupted_brute
		move_speed=1
		icon_state = "corrupted"

		vrange = 6

		hp = 40

		New()
			..()
			items += new/item/weapon/axe/dwarven_hammer
			items += new/item/weapon/axe/dwarven_hammer
			items += new/item/apparel/armor/corrupted_brute_armor

	corrupted_rat
		icon_state = "corrupted"
		move_speed = 4
		vrange = 6
		hp = 20
		New()
			..()
			items += new/item/weapon/rat_claw
			items += new/item/weapon/rat_claw
			items += new/item/apparel/armor/corrupted_rat_pelt

	corrupted_samurai
		icon_state = "corrupted"
		move_speed = 2
		vrange = 4
		hp = 20
		New()
			..()
			items += new/item/weapon/axe/dark_axe
			items += new/item/weapon/axe/dark_axe
			items += new/item/apparel/armor/corrupted_samurai_armor

	black_bear
		icon_state = "bear"
		move_speed = 2
		vrange = 4
		hp = 15
		New()
			..()
			items += new/item/weapon/black_bear_claw
			items += new/item/weapon/black_bear_claw
			items += new/item/apparel/armor/black_bear_pelt
	snow_bear
		icon_state = "bear"
		move_speed = 2
		vrange = 4
		hp = 18
		New()
			..()
			items += new/item/weapon/snow_bear_claw
			items += new/item/weapon/snow_bear_claw
			items += new/item/apparel/armor/snow_bear_pelt
	dwarven_miner
		icon_state = "dwarf"
		move_speed = 2
		vrange = 3
		hp = 9
		New()
			..()
			items += new/item/weapon/axe/pick_axe
			items += new/item/apparel/armor/dwarven_blacksmith_armor
	dwarven_archaeologist
		move_speed=1
		icon_state = "dwarf"


		vrange = 4

		hp = 160

		New()
			..()
			items += new/item/weapon/blade/hatchet
			items += new/item/apparel/shield/dwarven_shield
			items += new/item/apparel/armor/dwarven_tank_armor
			items += new/item/key
	sand_monster
		move_speed=2
		icon_state = "sand monster"
		team = 2
		vrange = 4
		hp = 70
		New()
			..()
			items += new/item/weapon/bow/sand_monster_organ
			items += new/item/apparel/armor/sand_monster_cloak
		die(mob/m)
			if(live)
				items = list("weapon/bow/sand_monster_organ")
			..()
	dwarf
		move_speed=2
		icon_state = "dwarf"
		team = 2
		vrange = 2
		hp = 1
		New()
			..()
			items += new/item/weapon/ice_staff
			items += new/item/apparel/armor/dwarven_robes
	dwarven_lookout
		move_speed=2
		icon_state = "dwarf"
		vrange = 3
		hp = 33
		New()
			..()
			items += new/item/weapon/digging_mitts
			items += new/item/apparel/armor/sand_cloak
	dwarven_shaman
		move_speed=1
		icon_state = "dwarf"
		vrange = 4
		hp = 34
		New()
			..()
			items += new/item/weapon/mental_staff
			items += new/item/apparel/armor/sand_cloth
	dwarven_conjurer
		move_speed=2
		icon_state = "dwarf"
		vrange = 3
		hp = 35
		New()
			..()
			items += new/item/weapon/axe/sand_axe
			items += new/item/apparel/armor/sand_armor
	orc_shaman
		move_speed=1
		icon_state = "orc"
		vrange = 5
		hp = 36
		New()
			..()
			items += new/item/weapon/plague_staff
			items += new/item/apparel/armor/ritual_robes
	dark_elf_cultist
		move_speed=2
		icon_state = "dark elf"
		vrange = 3
		hp = 37
		New()
			..()
			items += new/item/weapon/bow/bone_bow
			items += new/item/apparel/armor/ritual_cloak
	dwarven_ritualist
		move_speed=2
		icon_state = "dwarf"
		vrange = 3
		hp = 35
		New()
			..()
			items += new/item/weapon/bow/dragon_bow
			items += new/item/apparel/armor/ritual_armor
	swamp_ranger
		move_speed=2
		icon_state = "swamp creature"
		vrange = 3
		hp = 36
		New()
			..()
			items += new/item/weapon/bow/tomahawk
			items += new/item/weapon/bow/tomahawk
			items += new/item/apparel/armor/swamp_cloth
	swamp_beast
		move_speed=0
		icon_state = "swamp creature"
		vrange = 3
		hp = 200
		New()
			..()
			items += new/item/weapon/axe/swamp_axe
			items += new/item/weapon/axe/swamp_axe
			items += new/item/apparel/armor/swamp_armor
			items += new/item/key
	swamp_mage
		move_speed=1
		icon_state = "swamp creature"
		vrange = 3
		hp = 37
		New()
			..()
			items += new/item/weapon/storm_staff
			items += new/item/apparel/armor/swamp_gear
	swamp_rabbit
		icon_state = "rabbit"
		move_speed = 1
		vrange = 4
		hp = 20
		New()
			..()
			items += new/item/weapon/swamp_rabbit_claw
			items += new/item/weapon/swamp_rabbit_claw
			items += new/item/apparel/armor/swamp_rabbit_pelt
	undead_rabbit
		icon_state = "rabbit"
		move_speed = 1
		vrange = 4
		hp = 23
		New()
			..()
			items += new/item/weapon/undead_rabbit_claw
			items += new/item/weapon/undead_rabbit_claw
			items += new/item/apparel/armor/undead_rabbit_pelt
	infected_warrior
		move_speed=0
		icon_state = "zombie"
		vrange = 3
		hp = 40
		New()
			..()
			items += new/item/weapon/axe/refined_axe
			items += new/item/apparel/armor/refined_armor
	infected_ninja
		move_speed=1
		icon_state = "zombie"
		vrange = 5
		hp = 26
		New()
			..()
			items += new/item/weapon/refined_dagger
			items += new/item/weapon/refined_dagger
			items += new/item/apparel/armor/refined_cloth
	jones
		move_speed=0
		icon_state = "zombie"
		vrange = 3
		hp = 220
		New()
			..()
			items += new/item/weapon/bow/refined_bow
			items += new/item/apparel/armor/refined_leather
	infected_being
		move_speed=0
		icon_state = "zombie"
		vrange = 3
		hp = 170
		New()
			..()
			items += new/item/weapon/axe/refined_axe
			items += new/item/weapon/refined_dagger
			items += new/item/apparel/armor/refined_leather
			items += new/item/key
	infected
		move_speed=1
		icon_state = "zombie"
		vrange = 2
		hp = 45
		team = 2
		New()
			..()
			items += new/item/weapon/claw
			items += new/item/weapon/claw
	dark_elf_elite_scientist
		move_speed=1
		icon_state = "dark elf"
		vrange = 3
		hp = 260
		New()
			..()
			items += new/item/weapon/axe/greatsword
			items += new/item/apparel/armor/dark_elf_scientist_cloak
	dark_elf_adept_scientist
		move_speed=1
		icon_state = "dark elf"
		vrange = 3
		hp = -10
		New()
			..()
			items += new/item/apparel/armor/dark_elf_scientist_cloak
			items += new/item/weapon/ritual_dagger
			items += new/item/key

	dark_elf_scientist
		move_speed=0
		icon_state = "dark elf"
		vrange = 3
		hp = 60
		New()
			..()
			items += new/item/weapon/axe/refined_axe
			items += new/item/weapon/axe/refined_axe
			items += new/item/apparel/armor/dark_elf_scientist_hood
	dark_elf_novice_scientist
		move_speed=1
		icon_state = "dark elf"
		vrange = 5
		hp = 28
		New()
			..()
			items += new/item/weapon/dagger
			items += new/item/weapon/dagger
			items += new/item/apparel/armor/dark_elf_scientist_hood

	dwarven_guard
		move_speed=0
		icon_state = "dwarf"
		vrange = 3
		hp = 43
		New()
			..()
			items += new/item/weapon/blade/cutlass
			items += new/item/apparel/armor/dwarven_guard_armor
	rabbit
		icon_state = "rabbit"
		move_speed = 1
		vrange = 4
		hp = 25
		New()
			..()
			items += new/item/weapon/rabbit_claw
			items += new/item/weapon/rabbit_claw
			items += new/item/apparel/armor/rabbit_pelt
	plague_demon
		move_speed=4
		icon_state = "plague demon"
		vrange = 4
		hp = 300
		New()
			..()
			items += new/item/weapon/bow/plague_demon_organ
			items += new/item/apparel/armor/plague_demon_cloak
		die(mob/m)
			if(live)
				items = list("weapon/bow/plague_demon_organ")
			..()
	smart_infected
		move_speed=1
		icon_state = "dark elf zombie"
		vrange = 3
		hp = 46
		New()
			..()
			items += new/item/weapon/axe/glass_greatsword
			items += new/item/apparel/armor/dark_elf_plate_armor
	old_dark_elf_mage
		move_speed=1
		icon_state = "dwarf"
		vrange = 3
		hp = 45
		New()
			..()
			items += new/item/weapon/water_staff
			items += new/item/apparel/armor/worn_out_robes
	orc_summoner
		move_speed=1
		icon_state = "orc"
		vrange = 3
		hp = 200
		New()
			..()
			items += new/item/weapon/psychic_staff
			items += new/item/apparel/armor/blood_stained_robes
	dark_elf_elite_ninja
		move_speed=0
		icon_state = "zombie"
		vrange = 5
		hp = 30
		New()
			..()
			items += new/item/weapon/barbed_dagger
			items += new/item/weapon/barbed_dagger
			items += new/item/apparel/armor/dark_elf_ninja_armor
	wind_spawn
		icon_state = "ventus"
		move_speed = 1
		vrange = 4
		hp = 28
		New()
			..()
			items += new/item/weapon/wind_spawn_claw
			items += new/item/weapon/wind_spawn_claw
			items += new/item/apparel/armor/wind_spawn_armor
	wind_god
		move_speed=1
		icon_state = "wind god"
		vrange = 4
		hp = 330
		New()
			..()
			items += new/item/weapon/bow/wind_god_organ
			items += new/item/apparel/armor/wind_god_coat
		die(mob/m)

			if(live)
				items = list()
			..()

	wind_guard
		move_speed=1
		icon_state = "ventus"
		vrange = 3
		hp = 48
		New()
			..()
			items += new/item/weapon/blade/whip
			items += new/item/apparel/armor/wind_gear
	wind_warrior
		move_speed=1
		icon_state = "ventus"
		vrange = 3
		hp = 50
		New()
			..()
			items += new/item/weapon/blade/wind_cutlass
			items += new/item/apparel/armor/wind_armor
	dark_elf_plotter
		move_speed=1
		team = 0
		icon_state = "dark elf"
		vrange = 3
		hp = 1
		New()
			..()
			items += new/item/weapon/sword/shadow_dagger
			items += new/item/apparel/armor/dark_elf_gear
	water_god
		move_speed=1
		icon_state = "water god"
		vrange = 4
		hp = 370
		New()
			..()
			items += new/item/weapon/sword/vapor_sword
			items += new/item/apparel/shield/vapor_shield
			items += new/item/apparel/armor/water_god_cloak
		die(mob/m)

			if(live && armor)
				items -= armor
			..()
	water_warrior
		move_speed=1
		icon_state = "water spawn"
		vrange = 3
		hp = 52
		New()
			..()
			items += new/item/weapon/blade/vapor_cutlass
			items += new/item/apparel/armor/water_armor
	water_spawn
		icon_state = "water spawn"
		move_speed = 1
		vrange = 4
		hp = 28
		New()
			..()
			items += new/item/weapon/water_spawn_claw
			items += new/item/weapon/water_spawn_claw
			items += new/item/apparel/armor/water_spawn_armor
	raging_water_spirit
		move_speed=1
		icon_state = "water spawn"
		vrange = 3
		hp = 28
		New()
			..()
			items += new/item/weapon/water_dagger
			items += new/item/apparel/armor/water_leather


	fire_god
		move_speed=1
		icon_state = "fire god"
		vrange = 4
		hp = 410
		New()
			..()
			items += new/item/weapon/axe/flame_greatsword
			items += new/item/apparel/armor/fire_god_cloak
		die(mob/m)

			if(live && armor)
				items -= armor
			..()
	magma_knight
		move_speed=1
		icon_state = "fire spawn"
		vrange = 3
		hp = 52
		New()
			..()
			items += new/item/weapon/blade/burning_cutlass
			items += new/item/apparel/shield/flame_shield
			items += new/item/apparel/armor/molten_armor
	furious_smoldering_assasin
		icon_state = "fire spawn"
		move_speed = 1
		vrange = 4
		hp = 28
		New()
			..()
			items += new/item/weapon/bow/magma_bow

			items += new/item/apparel/armor/burning_leather
	fire_demon
		move_speed=1
		icon_state = "fire spawn"
		vrange = 3
		hp = 28
		New()
			..()
			items += new/item/weapon/blaze_staff
			items += new/item/apparel/armor/burning_robes



	corrupted_archer
		move_speed=1
		icon_state = "corrupted"
		vrange = 3
		hp = 30
		New()
			..()
			items += new/item/weapon/bow/magma_bow

			items += new/item/apparel/armor/corrupted_archer_gear
	corrupted_cyclops
		icon_state = "corrupted"
		move_speed = 1
		vrange = 4
		hp = 60
		New()
			..()
			items += new/item/weapon/sword/black_spear
			items += new/item/weapon/sword/black_spear

			items += new/item/apparel/armor/corrupted_cyclops_armor
	corrupted_berserker
		move_speed=1
		icon_state = "corrupted"
		vrange = 3
		hp = 800
		New()
			..()

			items += new/item/weapon/sword/spectrus_sword

			items += new/item/apparel/armor/corrupted_berserker_armor
	corrupted_hybrid
		icon_state = "corrupted"
		move_speed = 1
		vrange = 4
		hp = 20
		New()
			..()

			items += new/item/weapon/axe/dark_battleaxe

			items += new/item/apparel/armor/corrupted_hybrid_skin
	corrupted_ninja
		move_speed=1
		icon_state = "corrupted"
		vrange = 3
		hp = 40
		New()
			..()
			items += new/item/weapon/water_dagger
			items += new/item/weapon/water_dagger
			items += new/item/apparel/armor/corrupted_ninja_robes





	demonic_seraphim
		move_speed=1
		icon_state = "demon"
		vrange = 3
		hp = 70
		New()
			..()
			items += new/item/weapon/sword/black_spear

			items += new/item/apparel/armor/plated_chaos

	lord_of_pain
		move_speed=1
		icon_state = "demon"
		vrange = 3
		hp = 450
		New()
			..()
			items += new/item/weapon/sword/shadow_scepter
			items += new/item/weapon/sword/shadow_scepter
			items += new/item/apparel/armor/shadowmancer_robes
	corrupted_knight
		move_speed=1
		icon_state = "corrupted knight armor"
		vrange = 3
		hp = 500


		New()
			..()
			items += new/item/weapon/axe/malice_striker




	chaos_god
		move_speed=1
		icon_state = "chaos god cloak"
		vrange = 3
		hp = 450
		New()
			..()
			items += new/item/weapon/sword/bane
			items += new/item/apparel/shield/pacifix
			items += new/item/apparel/armor/chaos_god_cloak
		die(mob/m)

			if(live && armor)
				items -= armor
			..()
	chaos_acolyte
		move_speed=1
		icon_state = "chaos spawn"
		vrange = 3
		hp = 50
		New()
			..()
			items += new/item/weapon/plague_staff
			items += new/item/weapon/plague_staff
			items += new/item/apparel/armor/blood_stained_robes
	sinner
		move_speed=1
		icon_state = "chaos spawn"
		vrange = 3
		hp = 40
		New()
			..()
			items += new/item/weapon/axe/dark_battleaxe
			items += new/item/apparel/armor/worn_out_robes

	orc_slave
		move_speed=1
		icon_state = "orc"
		vrange = 3
		hp = 30
		New()
			..()
			items += new/item/weapon/orc_claw
			items += new/item/apparel/armor/orc_slave_cloth
	gate_keeper
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 56
		New()
			..()
			items += new/item/weapon/axe/searing_axe
			items += new/item/apparel/armor/gatekeeper_robes
	demon
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 54
		New()
			..()
			items += new/item/weapon/snow_staff
			items += new/item/apparel/armor/devilish_armor
	trial_guard
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 480
		New()
			..()
			items += new/item/weapon/bow/nocturnal_bow
			items += new/item/apparel/armor/trial_guards_leather
	dark_elf_slave
		move_speed=1
		icon_state = "dark elf"
		vrange = 3
		hp = 32
		New()
			..()
			items += new/item/weapon/axe/demonic_axe
			items += new/item/apparel/armor/dark_elf_slave_cloth
	half_turned_angel
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 58
		New()
			..()
			items += new/item/weapon/blade/thorn_blade
			items += new/item/apparel/armor/fallen_angel_leather
	fully_turned_angel
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 56
		New()
			..()
			items += new/item/weapon/bow/ether_bow
			items += new/item/apparel/armor/fallen_angel_armor
	fallen_angel
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 510
		New()
			..()
			items += new/item/weapon/axe/scythe
			items += new/item/apparel/armor/demon_king_armor
	dwarf_slave
		move_speed=1
		icon_state = "dwarf"
		vrange = 3
		hp = 34
		New()
			..()
			items += new/item/weapon/devilish_dagger
			items += new/item/apparel/armor/dwarf_slave_cloth
	rage_driven_demon
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 60
		New()
			..()
			items += new/item/weapon/sword/demonic_sword
			items += new/item/apparel/armor/demon_cloth
	passive_demon
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 58
		New()
			..()
			items += new/item/weapon/brain_staff
			items += new/item/apparel/armor/demon_leather
	demon_lord
		move_speed=1
		icon_state = "demon2"
		vrange = 3
		hp = 540
		New()
			..()
			items += new/item/weapon/axe/demonic_greatsword
			items += new/item/apparel/armor/demon_lord_armor
	arcane_orc2
		name = "arcane orc"
		move_speed=2
		vrange = 2
		hp = 500
		New()
			..()
			items += new/item/weapon/orc_sword
			items += new/item/weapon/dust_staff
			items += new/item/apparel/armor/orc_robes
			items += new/item/key/key_5
	orc_leader2
		name = "orc leader"
		move_speed=2
		vrange = 3
		hp = 500
		New()
			..()
			items += new/item/weapon/sword/dwarven_sword
			items += new/item/apparel/shield/advanced_orc_shield//lol e.e
			items += new/item/apparel/armor/advanced_orc_armor
			items += new/item/key/key_4
	dwarven_blacksmith_leader2
		name = "dwarven blacksmith leader"
		move_speed=1
		icon_state = "dwarf"
		vrange = 4
		hp = 500
		New()
			..()
			items += new/item/weapon/axe/dwarven_hammer
			items += new/item/weapon/axe/dwarven_hammer
			items += new/item/apparel/armor/dwarven_blacksmith_leader_armor
			items += new/item/key/key_3
	dwarven_ritualist2
		name = "dwarven ritualist"
		move_speed=2
		icon_state = "dwarf"
		vrange = 3
		hp = 500
		New()
			..()
			items += new/item/weapon/bow/dragon_bow
			items += new/item/apparel/armor/ritual_armor
			items += new/item/key/key_2
	underworld_demon
		move_speed=2
		icon_state = "demon2"
		vrange = 3
		hp = 540
		New()
			..()
			items += new/item/weapon/blade/possessed_cutlass
			items += new/item/apparel/armor/underworld_armor
			items += new/item/key/key_6
	blazekid
		move_speed=2
		icon_state = "mystic leather"
		vrange = 3
		hp = 570
		New()
			..()
			items += new/item/weapon/blade/possessed_cutlass
			items += new/item/weapon/sword/kings_sceptre
			items += new/item/apparel/armor/kings_cape
			items += new/item/key
		die(mob/m)

			if(live && armor)
				items -= armor
			..()
	lord_of_probing
		move_speed=1
		icon_state = "creature"
		name = "spacial worm"
		vrange = 3
		hp = 130
		New()
			..()
			items += new/item/weapon/axe/space_axe
			items += new/item/apparel/armor/space_armor
	cave_beast
		move_speed=1
		icon_state = "creature"
		vrange = 3
		hp = 130
		New()
			..()
			items += new/item/weapon/drain_staff
			items += new/item/apparel/armor/space_robes
	pidgeon
		move_speed=1
		icon_state = "bird"
		name = "crownwinger"
		vrange = 3
		hp = 100
		New()
			..()
			items += new/item/weapon/pidgeon_talon
			items += new/item/weapon/pidgeon_talon
			items += new/item/apparel/armor/pidgeon_armor
	ancient_alien
		move_speed=1
		icon_state = "creature"
		vrange = 3
		hp = 3000
		New()
			..()
			items += new/item/weapon/bow/nitrous_bow
			items += new/item/apparel/armor/space_leather
			items += new/item/key/key_4
	religious_alien
		move_speed=1
		icon_state = "alien"
		vrange = 3
		hp = 150
		New()
			..()
			items += new/item/weapon/crystal_staff
			items += new/item/apparel/armor/alien_space_suit
	alien_engineer
		move_speed=1
		icon_state = "alien"
		vrange = 3
		hp = 2000
		New()
			..()
			items += new/item/weapon/sword/rusty_shovel
			items += new/item/apparel/armor/engineers_armor
			items += new/item/key/key_2
	alien_patroler
		name = "alien patroller"
		move_speed=1
		icon_state = "alien"
		vrange = 3
		hp = 150
		New()
			..()
			items += new/item/weapon/bow/psy_gun
			items += new/item/apparel/armor/alien_leather
	alien_guard
		move_speed=1
		icon_state = "alien"
		vrange = 3
		hp = 150
		New()
			..()
			items += new/item/weapon/axe/sparkly_battleaxe
			items += new/item/apparel/armor/alien_armor


	glitched
		move_speed=1
		icon_state = "glitched"
		vrange = 3
		hp = 150
		New()
			..()
			items += new/item/weapon/glitched_claw
			items += new/item/weapon/glitched_claw
	limb_ripper
		move_speed=3
		icon_state = "glitched"
		vrange = 6
		hp = 1000
		abilities = list("rush")
		New()
			..()
			items += new/item/weapon/axe/limb_ripper_arm
			items += new/item/weapon/axe/limb_ripper_arm
			items += new/item/apparel/armor/limb_ripper_hide




	hawk
		move_speed=1
		icon_state = "bird"
		name = "preyseeker"
		vrange = 3
		hp = 120
		New()
			..()
			items += new/item/weapon/hawk_talon
			items += new/item/weapon/hawk_talon
			items += new/item/apparel/armor/hawk_armor
	peasant_mummy
		move_speed=1
		icon_state = "mummy"
		vrange = 3
		hp = 170
		New()
			..()
			items += new/item/weapon/sandstorm_staff
			items += new/item/apparel/armor/mummy_robes
	scribe_mummy
		move_speed=1
		icon_state = "mummy"
		vrange = 3
		hp = 170
		New()
			..()
			items += new/item/weapon/bow/sand_bow
			items += new/item/apparel/armor/mummy_leather
	mummy_king
		move_speed=1
		icon_state = "mummy"
		vrange = 3
		hp = 3200
		New()
			..()
			items += new/item/weapon/blade/ancient_blade
			items += new/item/apparel/armor/mummy_armor
			items += new/item/key/key_4
	eagle
		move_speed=1
		icon_state = "bird"
		vrange = 3
		name = "jetflyer"
		hp = 140
		New()
			..()
			items += new/item/weapon/eagle_talon
			items += new/item/weapon/eagle_talon
			items += new/item/apparel/armor/eagle_armor
	scorpion
		move_speed=1
		icon_state = "scorpion"
		vrange = 3
		hp = 140
		New()
			..()
			items += new/item/weapon/scorpion_claw
			items += new/item/weapon/scorpion_claw
			items += new/item/apparel/armor/scorpion_armor
	raven
		move_speed=1
		icon_state = "bird"
		vrange = 3
		hp = 160
		New()
			..()
			items += new/item/weapon/raven_talon
			items += new/item/weapon/raven_talon
			items += new/item/apparel/armor/raven_armor
	dead
		move_speed=1
		icon_state = "dead guy"
		vrange = 3
		hp = -20
		New()
			..()

		//543261
		//oops, there was a typo- "Enemy" was mispelled as "enemy" and the path was wrong
	jail_orc
		icon_state = "orc"
		move_speed = 1
		vrange = 5
		hp = 1.#INF
		New()
			..()
	jail_elf
		icon_state = "dark elf"
		move_speed = 1
		vrange = 5
		hp = 1.#INF
		New()
			..()

	var/msg = null



	time
		arachnid
			move_speed=1
			icon_state = "mummy"
			vrange = 3
			hp = 140
			New()
				..()
				items += new/item/weapon/spider_fang
				items += new/item/weapon/spider_fang
				items += new/item/apparel/armor/arachnid_hide
		timeshifter
			move_speed=1
			icon_state = "person"
			vrange = 3
			hp = 190
			New()
				..()
				items += new/item/weapon/time_staff
				items += new/item/apparel/armor/mage_cloack
		cogmaker
			move_speed=1
			icon_state = "person"
			vrange = 3
			hp = 190
			New()
				..()
				items += new/item/weapon/bow/steam_bow
				items += new/item/apparel/armor/gear_gear
		steam_guardian
			move_speed=1
			icon_state = "person"
			vrange = 3
			hp = 200
			New()
				..()
				items += new/item/weapon/blade/steam_blade
				items += new/item/apparel/shield/cog_shield
				items += new/item/apparel/armor/cog_armor
	time2

		necrospawn_mage
			move_speed=1
			icon_state = "chaos spawn"
			vrange = 3
			hp = 220
			New()
				..()
				items += new/item/weapon/dark_staff
				items += new/item/apparel/armor/necrospawn_robes
		timeteller
			move_speed=1
			icon_state = "person"
			vrange = 3
			hp = 220
			New()
				..()
				items += new/item/weapon/bow/time_bow
				items += new/item/apparel/armor/tainted_timetelling_gear
		necrospawn_brute
			move_speed=1
			icon_state = "chaos spawn"
			vrange = 3
			hp = 250
			New()
				..()
				items += new/item/weapon/axe/necroblade
				items += new/item/apparel/armor/necrospawn_armor
	time3

		necrospawn_fatechanter
			move_speed=1
			icon_state = "chaos spawn"
			vrange = 3
			hp = 250
			New()
				..()
				items += new/item/weapon/fate_staff
				items += new/item/apparel/armor/darkfate_cloak
		necrospawn_headsman
			move_speed=1
			icon_state = "chaos spawn"
			vrange = 3
			hp = 270
			New()
				..()
				items += new/item/weapon/axe/headsman_axe
				items += new/item/apparel/armor/headsman_armor
		darkfate_assassin
			move_speed=2
			icon_state = "chaos spawn"
			vrange = 3
			hp = 220
			New()
				..()
				items += new/item/weapon/darkfate_dagger
				items += new/item/weapon/darkfate_dagger
				items += new/item/apparel/armor/darkfate_leather




	//clockturne