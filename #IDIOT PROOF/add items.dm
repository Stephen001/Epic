//Read the comments to learn how to add new gear. it's pretty derpin' simple


item

	/* variables for all:

	price=0 (derp)
	show_on_player=1 (1 makes it seen when equipped, 0 hides it)

	GO IN item.dmi TO DRAW THESE. its super simple, just copy + paste + edit. placement is crucial.

	always define an icon_state so the game knows which picture the item uses in item.dmi
	*/
	var/del_out = 0
	key
		icon_state = "key"
		del_out = 1

		key_2
			icon_state = "key 2"
		key_3
			icon_state = "key 3"
		key_4
			icon_state = "key 4"
		key_5
			icon_state = "key 5"
		key_6
			icon_state = "key 6"
	dye
		/*vars(self explanatory)
		red=0 // 0 to 255
		blue=0 // 0 to 255
		green=0 // 0 to 255

		*/
		price=500
		red
			red = 50
		yellow
			green = 50
			blue = 50
		blue
			blue = 50
		matts_dye_one
			red=0
			blue=120
			green=180
			price=500
		matts_dye_two
			red=160
			blue=160
			green=160
			price=500


	vanity
		//just add items with icon states and the game does the rest. no stats needed since its just visual
		demonic_wings
			movex = 24
			icon_state = "demonic wings"
		bone_wings
			movex = 24
			icon_state = "bone wings"
		angel_wings
			movex = 24
			icon_state = "angel wings"
		halo //movex makes the icons pushed over to the right in the inventory window, herp.
			movex = 18
			icon_state = "halo"
		feathers
			movex = 18
			icon_state = "feathers"
		horns
			movex = 18
			icon_state = "horns"
		blood_splatter
			movex = 18
			icon_state="blood splatter"
		beams_of_divinity
			movex = 24
			icon_state = "beams of divinity"
		rabbit_mask
			movex = 18
			icon_state = "rabbit mask"
			price = 50
	book

		/* book variables:

		skill (which ability the book has. that's all you need, no icon_state, nothing :)

		EXAMPLE
		///////////
		heal_book
			skill = "heal"
			price=10

		SUPER_FIRE_BOOK
			skill = "super fire"
			price=10
		/////////////

		ability MUST be programmed into the game or it wont work.

		*/
		New()
			desc = "Drag onto hotslots to learn spells"

		fate_trap
			skill = "fate_trap"
		fate_wave
			skill = "shield/fate_wave"
		fate
			skill = "fate"
		gear_rampage
			skill = "AoE/gear_rampage"
		time_wave
			skill = "shield/time_wave"
			price = 50
		spiral_cancer
			skill = "spiral_cancer"
			price = 40
		dust
			skill = "dust"
			price=10
		shadow_sickle
			skill = "shadow_sickle"
			price=40
		rush
			skill = "rush"
			price=30
		berserk
			skill = "berserk"
			price = 20
		pulse
			skill = "pulse"
			price=40
		megaice
			skill = "megaice"
			price=35
		electric
			skill = "electric"
			price=40
		dirt
			skill = "dirt"
			price=42
		lightning_bolt
			skill = "lightning_bolt"
			price=43
		fire_ball
			skill = "fire_ball"//dont forget the underscores lol
			price=46
		heart
			skill = "heart"
			price=40
		mental
			skill = "psychic"
			price=48
		kamehameha
			skill = "kamehameha"
			price = 20
		plague
			skill = "plague"
			price=51
		water
			skill = "water"
			price=52

		blaze
			skill = "blaze"
			price=56
		snow_ball
			skill = "snow_ball"
			price=56
		brain
			skill = "brain"
			price=56
		sand_ball
			skill = "sand_ball"
			price=56
		crystal
			skill = "crystal"
			price=56
		drain
			skill = "drain"
			price=56
		go_mudkipz
			skill = "go_mudkipz"
			price = 50
		divine
			skill = "divine"
			price=56
		darkness
			skill = "darkness"
			price=56
		ancient
			skill = "ancient"
			price=56
		psychic
			skill = "psychic"
			price=55
		twister
			skill = "AoE/twister"
			price=55
		flame
			skill = "AoE/flame"
			price=60
		earthquake
			skill = "AoE/earthquake"
			price=40
		tidal_wave
			skill = "AoE/tidal_wave"
			price=50
		time_pulse
			skill = "AoE/time_pulse"
			price=50
		spear_trap
			skill = "spear_trap"
			price=50
		tree
			skill = "AoE/tree"
			price=30
		blizzard
			skill = "AoE/blizzard"
			price=70
		chaos
			skill = "AoE/chaos"
			price=80
		thunder_flash
			skill = "AoE/thunder"
			price=90
		vortex
			skill = "AoE/vortex"
			price=100
		leaf_storm
			skill = "AoE/leaf_storm"
			price=100
		blade_storm
			skill = "AoE/blade_storm"
			price=100
		magma
			skill = "AoE/magma"
			price=100
		explode
			skill = "AoE/explosion"
			price=100
		avalanche
			skill = "AoE/avalanche"
			price=100
		sand_storm
			skill = "AoE/sand_storm"
			price=100
		cyclone
			skill = "AoE/cyclone"
			price=100
		rough_seas
			skill = "AoE/rough_seas"
			price=100
		energy_wave
			skill = "shield/energy_wave"
			price=30
		arrow_barrage
			skill = "arrow_barrage"
			price = 30
		psychic_wave
			skill = "shield/psychic_wave"
			price=30
		tough_wave
			skill = "shield/tough_wave"
			price=30
		strong_wave
			skill = "shield/strong_wave"
			price=30
		darkness_wave
			skill = "shield/darkness_wave"
			price=30
		suppression_wave
			skill = "shield/suppression_wave"
			price=36
		water_wave
			skill = "shield/water_wave"
			price=38
		sand_wave
			skill = "shield/sand_wave"
			price=40
		ice_wave
			skill = "shield/ice_wave"
			price=40
		magma_wave
			skill = "shield/magma_wave"
			price=40
		fire_trap
			skill = "fire_trap"
			price = 10
		ice_trap
			skill = "ice_trap"
			price = 20
		leaf_trap
			skill = "leaf_trap"
			price = 30
		psychic_trap
			skill = "psychic_trap"
			price = 40
		lightning_trap
			skill = "lightning_trap"
			price = 50
		bomb_trap
			skill = "bomb_trap"
			price = 64
		spike_trap
			skill = "spike_trap"
			price = 68
		mud_trap
			skill = "mud_trap"
			price = 70
		earth_trap
			skill = "earth_trap"
			price = 72
		razor_trap
			skill = "razor_trap"
			price = 72
		thorn_trap
			skill = "thorn_trap"
			price = 74
		pitfall_trap
			skill = "pitfall_trap"
			price = 76
		sleep_trap
			skill = "sleep_trap"
			price = 78
		sand_trap
			skill = "sand_trap"
			price = 60
		summon_chaos
			skill = "summon_chaos"
			price = 30
		summon_pyros
			skill = "summon_pyros"
			price = 30
		summon_aquos
			skill = "summon_aquos"
			price = 30
		vocare_animalia
			skill = "vocare_animalia"
			price = 30
		summon_sand_creature
			skill = "summon_sand_creature"
			price = 30
		summon_swamp_creature
			skill = "summon_swamp_creature"
			price = 30
		summon_zombie
			skill = "summon_zombie"
			price = 30
		summon_storm
			skill = "summon_storm"
			price = 40
		summon_lightning
			skill = "summon_lightning"
			price = 35
		summon_thunder
			skill = "summon_thunder"
			price = 36
		summon_nurse
			skill = "summon_nurse"
			price = 36
		summon_ventus
			skill = "summon_ventus"
			price = 39
		summon_vampire
			skill = "summon_vampire"
			price = 41
		summon_rabbits
			skill = "summon_rabbits"
			price = 43
		summon_werewolf
			skill = "summon_werewolf"
			price = 45
		summon_leprechaun
			skill = "summon_leprechaun"
			price = 55
		summon_golem
			skill = "summon_golem"
			price = 60
		laser_shield
			skill = "shield/laser_shield"
			price = 30
	weapon

		var/flash = null
		var/poison=0
		var/t_range=1
		/* weapon variables:

		w_range (how far this weapon reaches in pixels. 32 = one tile )
		swingspeed (how fast this weapon swings. 210/speed * 30 is a good idea of how many swings in a second it can do.
			because this is confusing, i provided melee defaults. )
		damage (obvious. 10 damage = 1 heart. NEGATIVE DAMAGE HEALS)
		delay (how long the wait is AFTER the weapon is swung before it can be swung again)
		///////////////////////////////////

		BOW variables:

		w_range=100 (don't change this, its how far AI can see that are equipped with bows)
		delay (Reload time in tenths of a second)
		double = 1 (dont change this. double = 0 means the bow uses 1 hand
		skill (the type of projectile it shoots. default is "arrow". this is like an ability)
		*/

		bow
			//add them in here like this

			//mystic_bow
				//icon_state = "mystic bow"
				//pull_back = "mystic bow pull"


			special_bow

				icon_state = "pebble"
				pull_back = "pebble pull"
				skill = "general_projectiles/pebble"
				delay = 10
			orc_bow

				icon_state = "orc bow"
				pull_back = "orc bow pull"
				skill = "general_projectiles/orc_arrow"
				delay = 10
			elven_bow

				icon_state = "elven bow"
				pull_back = "elven bow pull"
				skill = "general_projectiles/elven_arrow"
				delay = 10
			potato_cannon
				icon_state = "potato cannon"
				pull_back = "potato cannon charge"
				skill = "general_projectiles/potato_fired"
				delay = 15
				price = 40
			paradox_bow

				icon_state = "paradox bow"
				pull_back = "paradox bow pull"
				skill = "general_projectiles/paradox_arrow"
				delay = 4
			apocalypse_bow

				icon_state = "apocalypse bow"
				pull_back = "apocalypse bow pull"
				skill = "general_projectiles/apocalypse_arrow"
				delay = 4
			shadow_bow

				icon_state = "shadow bow"
				pull_back = "shadow bow pull"
				skill = "general_projectiles/shadow_arrow"
				delay = 10
			dark_bow

				icon_state = "dark bow"
				pull_back = "dark bow pull"
				skill = "general_projectiles/dark_arrow"
				delay = 10

			dragon_bow

				icon_state = "dragon bow"
				pull_back = "dragon bow pull"
				skill = "general_projectiles/dragon_arrow"
				delay = 10
			bone_bow

				icon_state = "bone bow"
				pull_back = "bone bow pull"
				skill = "general_projectiles/bone_arrow"
				delay = 10

			dwarven_bow

				icon_state = "dwarven bow"
				pull_back = "dwarven bow pull"
				skill = "general_projectiles/dwarven_arrow"
				delay = 7
			photon_cannon
				icon_state = "photon cannon"
				pull_back = "photon cannon charge"
				skill = "general_projectiles/photon_blast"
				delay = 5
				price = 40

			bow_of_the_divine

				icon_state = "bow of the divine"
				pull_back = "bow of the divine pull"
				skill = "general_projectiles/divine_arrow"
				delay = 10

			ninja_star

				icon_state = "ninja star"
				pull_back = "ninja star pull"
				skill = "general_projectiles/ninja_star"
				delay = 3
				double=0
			glue_gun
				icon_state = "glue gun"
				pull_back = "glue gun charge"
				skill = "general_projectiles/glue"
				delay = 15
				price = 20
			blowpipe
				icon_state = "blowpipe"
				pull_back = "blowpipe"
				skill = "general_projectiles/poison_dart"
				delay = 10
				price = 30
			tomahawk

				icon_state = "tomahawk"
				pull_back = "tomahawk pull"
				skill = "general_projectiles/tomahawk"
				delay = 5
				double=0
			refined_bow

				icon_state = "refined bow"
				pull_back = "refined bow pull"
				skill = "general_projectiles/refined_arrow"
				delay = 10
			magma_bow

				icon_state = "magma bow"
				pull_back = "magma bow pull"
				skill = "general_projectiles/magma_arrow"
				delay = 10
			love_bow

				icon_state = "love bow"
				pull_back = "love bow pull"
				skill = "general_projectiles/love_arrow"
				delay = 10
			sand_monster_organ

				icon_state = "sand monster organ"
				pull_back = "sand monster organ pull"
				skill = "general_projectiles/sand_spit"
				delay = 8
			plague_demon_organ

				icon_state = "plague demon organ"
				pull_back = "plague demon organ pull"
				skill = "general_projectiles/grime"
				delay = 8
			wind_god_organ

				icon_state = "wind god organ"
				pull_back = "wind god organ pull"
				skill = "general_projectiles/twist"
				delay = 8
			wind_blade

				icon_state = "wind blade"
				pull_back = "wind blade pull"
				skill = "general_projectiles/twist"
				delay = 2
			nocturnal_bow

				icon_state = "nocturnal bow"
				pull_back = "nocturnal bow pull"
				skill = "general_projectiles/nocturnal_arrow"
				delay = 10
			poison_spitter
				icon_state = "no"
				pull_back = "no"
				skill = "general_projectiles/poison_dart"
				delay = 5
			ether_bow

				icon_state = "ether bow"
				pull_back = "ether bow pull"
				skill = "general_projectiles/nether_arrow"
				delay = 10
			teeth

				icon_state = "teeth"
				pull_back = "teeth pull"
				skill = "general_projectiles/teeth"
				delay = 0
			nitrous_bow

				icon_state = "nitrous bow"
				pull_back = "nitrous bow pull"
				skill = "general_projectiles/nitrous_arrow"
				delay = 10
			psy_gun

				icon_state = "psy gun"
				pull_back = "psy charge"
				skill = "general_projectiles/psy_bullet"
				delay = 10
			sand_bow

				icon_state = "sand bow"
				pull_back = "sand bow pull"
				skill = "general_projectiles/sand_arrow"
				delay = 10
			steam_bow

				icon_state = "steam bow"
				pull_back = "steam bow pull"
				skill = "general_projectiles/steam_arrow"
				delay = 10
			time_bow

				icon_state = "time bow"
				pull_back = "time bow pull"
				skill = "general_projectiles/time_arrow"
				delay = 10

			krewljolt
				icon_state = "krewljolt"
				pull_back = "krewljolt pull"
				skill = "general_projectiles/krewljolt_arrow"
				delay = 7


			spear_SG

				icon_state = "spear SG"
				pull_back = "spear SG"
				skill = "general_projectiles/spear"
				delay = 20
			steam_cannon
				icon_state = "steam cannon"
				pull_back = "steam cannon charge"
				skill = "general_projectiles/steam"
				delay = 15
			dart_gun

				icon_state = "dart gun"
				pull_back = "dart gun pull"
				skill = "general_projectiles/dildo"
				delay = 5
				price=0


				//Changes icon back to pa normal bow after use.
				//NOTE: I added a "pull_back" variable that lets you assign which icon_state the bow changes to when you're pulling it back
				//ANOTHER NOTE: you have to include the projectile path if there is one. read the change to understand

				//of allll the items you could have attempted to make you chose the least efficient one haha well now bows are easy
				//Twas a test and I thought if I was gonna use a pebble it'd have to be a bow or a staff


		axe
			//these weapons have default speeds and delays. Just add new ones and change the w_range and damage and you're good


			//like this

			//bloody_axe
				//icon_state = "bloody axe"
				//damage = 15

			down2(mob/m)

				if(double)

					can_attack=0
					m.shield(src)

			up2(mob/m)

				if(double)
					can_attack=1
					m.unshield(src)
					can_attack=1
					m.shielding=0
					m.can_attack=1

			orc_axe
				icon_state = "orc axe"
				damage = 8
			dark_axe
				icon_state = "dark axe"
				damage = 10
			pick_axe
				icon_state = "pick axe"
				damage = 9
				w_range = 4
			dwarven_axe
				icon_state = "dwarven axe"
				damage = 14
				w_range = 18
			shadow_hammer
				icon_state = "shadow hammer"
				damage = 13
			hammer
				icon_state = "hammer"
				damage = 11
				w_range = 10
			dwarven_hammer
				icon_state = "dwarven hammer"
				damage = 12
				w_range = 23
			sand_axe
				icon_state = "sand axe"
				damage = 15
				w_range = 20
			swamp_axe
				icon_state = "swamp axe"
				damage = 16
				w_range = 20
			refined_axe
				icon_state = "refined axe"
				damage = 17
				w_range = 21
			dark_battleaxe
				icon_state = "dark battleaxe"
				damage = 19
				w_range = 21
			searing_axe
				icon_state = "searing axe"
				damage = 20
				w_range = 21
			demonic_axe
				icon_state = "demonic axe"
				damage = 21
				w_range = 21
			fist_of_falcon
				flash = "flame"
				icon_state = "fist of falcon"
				damage = 22
				w_range = 21
				price = 50
			foam_finger
				icon_state = "foam finger"
				damage = 15
				w_range = 25
				price = 20

			elven_scepter
				icon_state = "elven scepter"
				damage = 12
				absorb_mana = 5

			malice_striker
				icon_state = "malice striker"
				damage = 25
				w_range = 30
				double=1
				delay = 0

			soulkeeper//Unique item until maybe later later later on in the game. Then it might become craftable.
				damage = 30
				w_range = 30
				double = 1
				icon_state = "soulkeeper"
				delay = 0

			greatsword
				icon_state = "greatsword"
				damage = 29
				w_range = 30
				double=1
				delay = 0

			glass_greatsword
				icon_state = "glass greatsword"
				damage = 31
				w_range = 30
				double=1
				delay = 0
			flame_greatsword
				icon_state = "flame greatsword"
				damage = 32
				w_range = 30
				double=1
				delay = 0
			midtwist_scythe
				icon_state = "midtwist scythe"
				damage = 35
				w_range = 32
				double=1
				delay = 2
			demonic_greatsword
				icon_state = "demonic greatsword"
				damage = 33
				w_range = 30
				double=1
				delay = 0
			mutton_masher
				icon_state = "mutton masher"
				damage = 15
				absorb_hp = 15
				w_range = 30
				double=1
				delay = 0
				price = 40
			scythe
				icon_state = "scythe"
				damage = 33
				w_range = 32
				double=1
				delay = 2
			hells_scythe
				icon_state = "hells scythe"
				damage = 35
				w_range = 32
				double=1
				delay = 2
			twin_scythe
				icon_state = "twin scythe"
				damage = 38
				w_range = 32
				double=1
				delay = 2
			troll_bane
				icon_state = "troll bane"
				damage = 36
				w_range = 32
				double=1
				delay = 2
				price=40
			rainbow_sword
				icon_state = "rainbow sword"
				damage = 34
				w_range = 32
				double=1
				delay = 2
				price=25
			space_axe
				icon_state = "space axe"
				damage = 22
				w_range = 21
			sparkly_battleaxe
				icon_state = "sparkly battleaxe"
				damage = 23
				w_range = 21
			storm_axe
				icon_state = "storm axe"
				damage = 26
				w_range = 21
			limb_ripper_arm
				icon_state = "limb ripper arm"
				damage = 24
				w_range = 21
			necroblade
				icon_state = "necroblade"
				damage = 25
				w_range = 21
			headsman_axe
				icon_state = "headsman axe"
				damage = 51
				w_range = 32
				double=1
			nocturne
				icon_state = "nocturne"
				damage = 56
				w_range = 32
				double=1

			titan
				damage = 60
				w_range = 32
				double = 1
				icon_state = "titan"
				flash = "blood"

				stun = 5

				poison = 20

				absorb_hp = 10
				absorb_mana = 10

			trunkydunk

				icon_state = "trunkydunk"
				damage = 30
				w_range = 32

				flash = "dirt"
				var/can_do = 1

				New()
					..()
					can_do=1

				effect(mob/m)

					if(can_do)

						can_do=0
						spawn(50)
							if(src)
								can_do=1
						m.shoot(pick("general_projectiles/darkness","general_projectiles/divine"))

				//SWORDS GO DOWN BELOW
			god_clock_sword
				icon_state = "sword"
				icon = 'TimeSpaceBoss.dmi'
				damage = 5
				y_off=-30
				w_range = 8
			god_clock_scythe
				icon_state = "scythe"
				icon = 'Clock reaper.dmi'
				damage = 10
				y_off=-30
				w_range = 8
		sword

			shadow_dagger
				damage = 3
				w_range = 4
				delay = 0
				swingspeed=30
				icon_state = "shadow dagger"

			dwarven_sword
				damage = 6
				w_range = 23
				icon_state = "dwarven sword"
			carrot_sword
				damage = 5
				w_range = 30
				absorb_hp = 3
				icon_state = "carrot sword"
			spear
				damage = 7
				w_range = 31
				icon_state = "spear"
			dragon_slayer
				damage = 8
				w_range = 24
				icon_state = "dragon slayer"
			bone_sword
				damage = 9
				w_range = 12
				icon_state = "bone sword"
			relic_sword
				damage = 11
				w_range = 18
				icon_state = "relic sword"
			vapor_sword
				damage = 12
				w_range = 13
				icon_state = "vapor sword"
			spectrus_sword
				damage = 7
				w_range = 20
				absorb_hp = 7
				icon_state = "spectrus sword"
			shadow_scepter
				icon_state = "shadow scepter"
				damage = 13
				absorb_mana = 10
			kings_sceptre
				icon_state = "kings sceptre"
				damage = 12
				absorb_mana = 20
			black_spear
				icon_state = "black spear"
				damage = 10
				w_range=30
			bane
				damage = 20
				icon_state = "bane"
				double = 1
			pixie_blade
				damage = 1000
				w_range = 64
				icon_state = "relic sword"
			sword_of_healing
				damage = -5
				w_range = 18
				icon_state = "sword of healing"
			demonic_sword
				damage = 15
				w_range = 13
				icon_state = "demonic sword"
			rusty_shovel
				damage = 16
				w_range = 15
				icon_state = "rusty shovel"
			wire_sword
				damage = 18
				w_range = 20
				stun=5
				icon_state = "wire sword"

			excalidocious
				icon_state = "excalidocious"
				damage = 25
				absorb_mana = 5
				absorb_hp = 5
				stun = 5
				var/can_do = 1
				flash = "hit effect 1"
				New()
					..()
					can_do=1

				effect(mob/m)

					if(can_do)

						can_do=0
						spawn(40)
							if(src)
								can_do=1
						m.shoot("general_projectiles/divine")

			//same goes for sword and blade.
/*

Summons
	rabbits
	vampire
	werewolf


			*/
		blade

			orc_bane
				damage=4
				icon_state = "orc bane"
			elven_blade
				icon_state = "elven blade"
				damage = 6
			kitchen_knife
				icon_state = "kitchen knife"
				damage = 2
			ninja_sword
				icon_state = "ninja sword"
				damage = 5
			hatchet
				icon_state = "hatchet"
				damage = 7
			burning_cutlass//This is a combine item
				icon_state = "burning cutlass"
				damage = 10
				swingspeed = 27
				delay = 2
			cutlass
				icon_state = "cutlass"
				damage = 8
				swingspeed = 27
				delay = 1
			wind_cutlass
				icon_state = "wind cutlass"
				damage = 11
				swingspeed = 27
				delay = 1
			vapor_cutlass
				icon_state = "vapor cutlass"
				damage = 12
				swingspeed = 27
				delay = 1
			huge_katana
				icon_state = "huge katana"
				damage = 24
				swingspeed = 27
				delay = 1
				double=1
			whip
				icon_state = "whip"
				damage = 7
				w_range = 40
				swingspeed = 18
			thorn_blade
				icon_state = "thorn blade"
				damage = 13
			crayon
				icon_state = "crayon"
				damage = 5
				absorb_hp = 10
				absorb_mana = 10
				price = 30
			wonder_blade
				damage = 15
				icon_state = "wonder blade"
				w_range = 20
			slicey_blade
				damage = 17
				icon_state = "slicey blade"
				w_range = 20
				absorb_hp = 2
				stun = 2
			possessed_cutlass
				icon_state = "possessed cutlass"
				damage = 14
				swingspeed = 27
				delay = 1
			samurai_sword
				icon_state = "samurai sword"
				damage = 16
			ancient_blade
				icon_state = "ancient blade"
				damage = 17
			steam_blade
				icon_state = "steam blade"
				damage = 18

			blitzrael
				icon_state = "blitzrael"
				damage = 20
				absorb_mana = 5
				stun = 2
				var/can_do = 1
				flash = "flame"
				New()
					..()
					can_do=1

				effect(mob/m)

					if(can_do)

						can_do=0
						spawn(20)
							if(src)
								can_do=1
						m.shoot("general_projectiles/blaze")


			razzlefrazz
				icon_state = "razzlefrazz"
				damage = 20
				absorb_hp = 5
				stun = 1
				flash = "electricity"
				New()
					..()
					can_do=1
				var/can_do = 1

				effect(mob/m)

					if(can_do)

						can_do=0
						spawn(20)
							if(src)
								can_do=1
						m.shoot("general_projectiles/lightning_bolt")


		/* ADDING STAFFS

		copy + paste this but charnge what you need to

		magic_staff // change this...
			icon_state = "magic staff" // change this duh
			price=20
			down(mob/m) // DOWN is what happens when this item is equipped and the user pushes DOWN the button that its equipped to
				if(!can_attack) return
				m.point(src)
				m.shoot("fire")  // Change this into the projectile you want it to shoot
				can_attack=0
				spawn(30)  // Change this to alter how fast it goes
					can_attack=1
					m.unpoint(src)

		*/

		dust_staff // change this...
			icon_state = "dust staff" // change this duh
			price=20
			w_range=200
			New()
				..()
				desc = "shoot dust"
			down(mob/m) // DOWN is what happens when this item is equipped and the user pushes DOWN the button that its equipped to
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/dust")  // Change this into the projectile you want it to shoot
				can_attack=0
				spawn(15)  // Change this to alter how fast it goes in tenths of seconds
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds

						can_attack=1
						m.unpoint(src)
		shadow_staff // change this...
			icon_state = "shadow staff" // change this duh
			price=50
			w_range=200
			New()
				..()
				desc = "shoot shadow sickles"
			down(mob/m) // DOWN is what happens when this item is equipped and the user pushes DOWN the button that its equipped to
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/shadow_sickle")  // Change this into the projectile you want it to shoot
				can_attack=0
				spawn(29)  // Change this to alter how fast it goes in tenths of seconds
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds

						can_attack=1
						m.unpoint(src)
		mega_ice_staff
			icon_state = "mega ice staff"
			price=35
			w_range=200
			New()
				..()
				desc = "shoot a powerful ice blast"
			down(mob/m) // DOWN is what happens when this item is equipped and the user pushes DOWN the button that its equipped to
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/megaice")  // Change this into the projectile you want it to shoot
				can_attack=0
				spawn(30)
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds
						can_attack=1
						m.unpoint(src)
		wormhole_science_handheld_portal_device
			icon_state = "wormhole science handheld portal device"
			price=80
			w_range=200
			New()
				..()
				desc = "Do not look into the operational end of the device."
			down(mob/m) // DOWN is what happens hen this item is equipped and the user pushes DOWN the button that its equipped to
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/blue_portal")  // Change this into the projectile you want it to shoot
				can_attack=0
				spawn(15)
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds
						can_attack=1
						m.unpoint(src)
			down2(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/orange_portal")  // Change this into the projectile you want it to shoot
				can_attack=0
				spawn(15)
					if(src && m)  // Change this to alter how fast it goes in tenths of seconds
						can_attack=1
						m.unpoint(src)
			double=1
		electro_staff
			icon_state = "electro staff"
			price=55
			w_range=200
			New()
				..()
				desc = "shoot electricity"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/electric")
				can_attack=0
				spawn(24)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		lightning_staff
			icon_state = "lightning staff"
			price=60
			w_range=200
			New()
				..()
				desc = "shoot lightning"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/lightning_bolt")
				can_attack=0
				spawn(22)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		storm_staff
			icon_state = "storm staff"
			price=60
			w_range=200
			New()
				..()
				desc = "conjure up a storm"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/storm")
				can_attack=0
				spawn(28)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		mega_magic_staff
			icon_state = "mega magic staff"
			price=62
			w_range=200
			New()
				..()
				desc = "shoot a powerful fireball"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/fire_ball")
				can_attack=0
				spawn(24)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		dirt_staff
			icon_state = "dirt staff"
			price=62
			w_range=200
			New()
				..()
				desc = "shoot dirt"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/dirt")
				can_attack=0
				spawn(15)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		mental_staff
			icon_state = "mental staff"
			price=65
			w_range=200
			New()
				..()
				desc = "psychic blast"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/psychic")
				can_attack=0
				spawn(22)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		plague_staff
			icon_state = "plague staff"
			price=67
			w_range=200
			New()
				..()
				desc = "plague"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/plague")
				can_attack=0
				spawn(25)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		water_staff
			icon_state = "water staff"
			price=60
			w_range=200
			New()
				..()
				desc = "gulb gulb gulb gulb gulb"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/water")
				can_attack=0
				spawn(26)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		blaze_staff
			icon_state = "blaze staff"
			price=70
			w_range=200
			New()
				..()
				desc = "burn stuff."
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/blaze")
				can_attack=0
				spawn(27)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		ASD
			icon_state = "ASD"
			price=200
			w_range=200
			New()
				..()
				desc = "Automatic Static Discharger<br>Standard military equipment for the soldiers of the Sirius starship."
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/static_blast")
				can_attack=0
				spawn(1)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		psychic_staff
			icon_state = "psychic staff"
			price=60
			w_range=200
			New()
				..()
				desc = "blast people with psychic powa"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/psychic")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		snow_staff
			icon_state = "snow staff"
			price=60
			w_range=200
			New()
				..()
				desc = "snow"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/snow_ball")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		brain_staff
			icon_state = "brain staff"
			price=60
			w_range=200
			New()
				..()
				desc = "brain"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/brain")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		crystal_staff
			icon_state = "crystal staff"
			price=60
			w_range=200
			New()
				..()
				desc = "crystal"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/crystal")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		sandstorm_staff
			icon_state = "sandstorm staff"
			price=60
			w_range=200
			New()
				..()
				desc = "sandy"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/sand_ball")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		time_staff
			icon_state = "time staff"
			price=60
			w_range=200
			New()
				..()
				desc = "tick tock"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/time")
				can_attack=0
				spawn(25)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		fate_staff
			icon_state = "fate staff"
			price=60
			w_range=200
			New()
				..()
				desc = "turn around..."
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/fate")
				can_attack=0
				spawn(5)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		drain_staff
			icon_state = "drain staff"
			price=60
			w_range=200
			New()
				..()
				desc = "drain"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/drain")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		divine_staff
			icon_state = "divine staff"
			price=60
			w_range=200
			New()
				..()
				desc = "divine"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/divine")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		dark_staff
			icon_state = "dark staff"
			price=60
			w_range=200
			New()
				..()
				desc = "darkness"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/darkness")
				can_attack=0
				spawn(29)
					if(src && m)
						can_attack=1
						m.unpoint(src)
		staff_of_the_ancients
			icon_state = "staff of the ancients"
			price=60
			w_range=200
			New()
				..()
				desc = "ancient"
			down(mob/m)
				if(!can_attack || m.shielding) return
				m.point(src)
				m.shoot("general_projectiles/ancient")
				can_attack=0
				spawn(18)
					if(src && m)
						can_attack=1
						m.unpoint(src)

	apparel

		shield

			/* shield variables:

			delay (how long the item stuns the opponent. 5 = 1/2 of a second, or 5 frames. There are 10 frames in a second.
			defense (how much damage the shield blocks. 10 defense blocks 10 damage. pretty self explanatory)

			EXAMPLE:

			(you can copy + paste the example and change things to fit your gear)
			/////

			arsenix_shield
				delay = 50
				defense = 50
				icon_state = "arsenix shield"
				price=500

			/////

			*/
			orc_shield
				delay = 10
				defense = 10
				icon_state = "orc shield"
				price=50
			pacifix
				delay = 8
				defense = 25
				icon_state = "pacifix"
				price=70
			dark_shield
				delay = 12
				defense = 11
				icon_state = "dark shield"
				price=55
			elven_shield
				delay = 15
				defense = 12
				icon_state = "elven shield"
				price=60
			advanced_orc_shield
				delay = 16
				defense = 13//STOP RAMPING IT UP SO HIGH
				price = 50
				icon_state = "advanced orc shield"
			god_clockwork_shield
				delay = 30
				defense = 30
				price = 0
				icon_state = "shield"
				icon = 'TimeSpaceBoss.dmi'
			dwarven_shield
				icon_state = "dwarven shield"
				delay = 15
				defense = 15
				price = 54
			vapor_shield
				icon_state = "vapor shield"
				delay = 15
				defense = 20
				price = 55
			flame_shield
				icon_state = "flame shield"
				delay = 20
				defense = 25
				price = 55
			steam_shield
				icon_state = "steam shield"
				delay = 50
				defense = 10
				price = 55
			cog_shield
				icon_state = "cog shield"
				delay = 30
				defense = 30
				price = 55
			ipod
				icon_state = "ipod"
				delay = 50
				defense = 30
				price = 55
		armor

			/* armor variables:

			defense (+10 defense = +1 heart )
			speedboost (from -3 to 4)
			mage (+10 mage = +1 mana blip )
			skill (exact name of skill that is used by this item. Not all items have skills(none yet lol). but i'll put one
				in the example.

			EXAMPLE:

			(you can copy + paste the example and change things to fit your gear)
			/////

			mystic_leather
				icon_state = "mystic leather"
				defense=5     // + 1/2 of a heart blip
				mage=10       // +1 mana blip
				speedboost=1  // +1 pixel per second
				price=10
				skill = "fire" //uses fire when I or middle click is pressed.

			//////

			*/
			archer_gear
				icon_state = "archer gear"
				//always make the icon state the same as the type name
				defense=15
				mage=5
				speedboost=2
				skill = "pulse"
				price=30
			demon_archer_gear
				icon_state = "demon archer gear"
				//always make the icon state the same as the type name
				defense=25
				mage=35
				speedboost=2
				skill = "super_pulse"
				price=60
			sealed_demon_archer_gear
				icon_state = "sealed demon archer gear"
				//always make the icon state the same as the type name
				defense=40
				mage=50
				speedboost=2
				skill = "super_pulse"
				price=120
			elven_gear
				icon_state = "elven gear"
				//always make the icon state the same as the type name
				defense=20
				mage=10
				speedboost=2
				skill = "pulse"
				price=40
			shockwave_armor
				icon_state = "shockwave armor"
				//always make the icon state the same as the type name
				defense=60
				mage=-20
				speedboost=0
				skill = "pulse"
				price=70
			shadowmancer_robes
				icon_state = "shadowmancer robes"
				//always make the icon state the same as the type name
				defense=-20
				mage=60
				speedboost=2
				skill = "rush"
				price=70
			calypso_robes
				icon_state = "calypso robes"
				//always make the icon state the same as the type name
				defense=20
				mage=60
				speedboost=2
				skill = "super_pulse"
				price=70
			falcon_armor
				icon_state = "falcon armor"
				//always make the icon state the same as the type name
				defense=-20
				mage=-20
				speedboost=-3
				price=9001
			elven_tank_suit
				icon_state = "elven tank suit"

				defense=55
				mage=-20
				speedboost=-1
				skill = "rush"
				price=70
			orc_robes
				icon_state = "orc robes"
				//always make the icon state the same as the type name
				defense=10
				mage=30
				speedboost=-2
				price=50

			snow_wolf_pelt
				icon_state = "snow wolf pelt"
				defense=5
				speedboost=2
				mage=10
				price=5

			hard_robes
				icon_state = "hard robes"
				defense=20
				mage=20
				speedboost=-3
				skill = "rush"
				price=30

			tank_armor
				icon_state = "tank armor"
				defense=50
				mage=-10
				speedboost=-4
				skill = "rush"
				price=40

			hero_armor
				icon_state = "hero armor"
				defense=20
				mage=20
				speedboost=1
				price=50
			dark_elf_gear
				icon_state = "dark elf gear"
				defense=15
				mage=15
				speedboost=2
				price=25
			archer_elf_gear
				icon_state = "archer elf gear"
				defense=20
				mage=10
				speedboost=2
				price=25
			rat_pelt
				icon_state = "rat pelt"
				defense=5
				mage=15
				speedboost=2
				price = 20
			enhanced_rat_pelt
				icon_state = "enhanced rat pelt"
				defense=10
				mage=10
				speedboost=2
				price=30
			black_mage_robes
				icon_state = "black mage robes"
				defense=10
				mage=20
				speedboost=1
				price=45
			dark_elf_mage_cloth
				icon_state = "dark elf mage cloth"
				defense=10
				mage=20
				speedboost=1
				price=30
			dark_elf_brute
				icon_state = "dark elf brute"
				defense=25
				mage=5
				speedboost=-1
				price=35
			elven_armor
				icon_state = "elven armor"
				defense=30
				mage=20
				speedboost=0
				price=40
			dark_elf_ninja_suit
				icon_state = "dark elf ninja suit"
				defense=10
				mage=25
				speedboost=3
				price=40
			dark_elf_chef_outfit
				icon_state = "dark elf chef"
				defense=0
				mage=30
				speedboost=0
				price=20
			dark_elf_miner_armor
				icon_state = "dark elf miner armor"
				defense=15
				mage=15
				speedboost=-1
				price=28

			dark_elf_elite_miner_armor
				icon_state = "dark elf elite miner"
				defense=30
				mage=15
				speedboost=-2
				price=40
			advanced_orc_armor
				icon_state = "advanced orc armor"
				defense=40
				mage=10
				speedboost=1
				price=40
			thunder_robes
				icon_state = "thunder robes"
				defense=15//IT WAS SO FUCKING OP
				mage=30
				speedboost=2
				price=40
			dwarven_blacksmith_armor
				icon_state = "dwarven blacksmith armor"
				defense=20
				mage=20
				speedboost=-1
				price=42
			dark_elf_mage_armor
				icon_state = "dark elf mage armor"
				defense=20
				mage=10//
				speedboost=2
				price=38
			dwarven_robes
				icon_state = "dwarven robes"
				defense=10
				mage=20//
				speedboost=2
				price=40
			dwarven_fire_robes
				icon_state = "dwarven fire robes"
				defense=20
				mage=30
				speedboost=1
				price=45
			molten_armor
				icon_state = "molten armor"
				defense=35
				mage=25
				speedboost=1
				price=44
			santa_armor
				icon_state = "santa armor"
				defense=33
				mage=30
				speedboost=1
				price=44
			dwarven_thunder_cloth
				icon_state = "dwarven thunder cloth"
				defense=15
				mage=30//STOP MAKING THEM OP FUUUUU
				speedboost=2
				price=43
			storm_cloth
				icon_state = "storm cloth"
				defense=20
				mage=40
				speedboost=0
				price=50
			dragon_armor
				icon_state = "dragon armor"
				defense=40
				mage=20
				speedboost=3
				price=64
			bone_armor
				icon_state = "bone armor"
				defense=50
				mage=10
				speedboost=-1
				price=64
			relic_armor
				icon_state = "relic armor"
				defense = 40
				skill = "super_pulse"
				mage = 40
				speedboost = 2
				price = 100
			pixie_armor
				icon_state = "relic armor"
				defense = 1000
				skill = "super_pulse"
				mage = 1000
				speedboost = 10
				price = 1000000
			dwarven_archer_gear
				icon_state = "dwarven archer gear"
				defense=25
				mage=20
				speedboost=2
				price=44
			dwarven_tank_armor
				icon_state = "dwarven tank armor"
				defense=60
				mage=-15
				speedboost=-4
				price=49
				skill = "rush"
			dwarven_armor
				icon_state = "dwarven armor"
				defense=30
				mage=20
				speedboost=0
				price=47
			dwarven_blacksmith_leader_armor
				icon_state = "dwarven blacksmith leader armor"
				defense=25
				mage=20
				speedboost=-1
				price=55
			sand_monster_cloak
				icon_state = "sand monster cloak"
				defense=35
				mage=10
				speedboost=0
				price=58
			sand_cloth
				icon_state = "sand cloth"
				defense=20
				mage=30
				speedboost=2
				price=53
			ritual_robes
				icon_state = "ritual robes"
				defense=25
				mage=30
				speedboost=1
				price=57
			sand_armor
				icon_state = "sand armor"
				defense=30
				mage=15
				speedboost=0
				price=56
			sand_cloak
				icon_state = "sand cloak"
				defense=30
				mage=20
				speedboost=1
				price=55
			ritual_cloak
				icon_state = "ritual cloak"
				defense=30
				mage=20
				speedboost=2
				price=53
			ritual_armor
				icon_state = "ritual armor"
				defense=35
				mage=20
				speedboost=0
				price=52
			swamp_armor
				icon_state = "swamp armor"
				defense=40
				mage=22
				speedboost=1
				price = 58
			swamp_gear
				icon_state = "swamp gear"
				defense=38
				mage=22
				speedboost=2
				price=54
			swamp_cloth
				icon_state = "swamp cloth"
				defense=33
				mage=27
				speedboost=3
				price = 57
			black_bear_pelt
				icon_state = "black bear pelt"
				defense=15
				mage=20
				speedboost=-2
				price = 30
			corrupted_rat_pelt
				icon_state = "corrupted rat pelt"
				defense=10
				mage=10
				speedboost=3
				price = 15
			corrupted_brute_armor
				icon_state = "corrupted brute armor"
				defense=30
				mage=10
				speedboost=0
				price = 25
			corrupted_samurai_armor
				icon_state = "corrupted samurai armor"
				defense=40
				mage=14
				speedboost=1
				price = 40
			snow_bear_pelt
				icon_state = "snow bear pelt"
				defense=20
				mage=20
				speedboost=-2
				price = 30
			swamp_rabbit_pelt
				icon_state = "swamp rabbit pelt"
				defense=20
				mage=20
				speedboost=2
				price = 30
			undead_rabbit_pelt
				icon_state = "undead rabbit pelt"
				defense=23
				mage=22
				speedboost=2
				price = 30
			speed_gear
				icon_state = "speed gear"
				defense=30
				mage=10
				speedboost=5
				price = 70
			swamp_tank_armor
				icon_state = "swamp tank armor"
				defense=60
				mage=-10
				speedboost=-1
				price=65
				skill = "super_pulse"
			refined_armor
				icon_state = "refined armor"
				defense=36
				mage=22
				speedboost=1
				price = 62
				skill = "pulse"
			rabbit_armor
				icon_state = "rabbit armor"
				defense=35
				mage=25
				speedboost=3
				price = 62
				skill = "rush"
			refined_leather
				icon_state = "refined leather"
				defense=33
				mage=26
				speedboost=2
				price=61
			refined_cloth
				icon_state = "refined cloth"
				defense=30
				mage=28
				speedboost=3
				price = 60
			dark_elf_scientist_hood
				icon_state = "dark elf scientist hood"
				defense=32
				mage=24
				speedboost=2
				price = 65
			dark_elf_scientist_cloak
				icon_state = "dark elf scientist cloak"
				defense=36
				mage=30
				speedboost=1
				price=67
			dwarven_guard_armor
				icon_state = "dwarven guard armor"
				defense=36
				mage=25
				speedboost=1
				price = 69
			rabbit_pelt
				icon_state = "rabbit pelt"
				defense=25
				mage=24
				speedboost=2
				price = 30
			worn_out_robes//Stats are low because it's going to be in a crafting recipe to make something good
				icon_state = "worn out robes"
				defense=20
				mage=20
				speedboost=2
				price = 20
			octagon_armor//Stats are low because it's going to be in a crafting recipe to make something good
				icon_state = "octagon armor"
				defense=100
				mage=0
				speedboost=0
				price = 50
			awesome_armor//Stats are low because it's going to be in a crafting recipe to make something good
				icon_state = "awesome armor"
				defense=0
				mage=100
				speedboost=2
				price = 50
			WILSON//Stats are low because it's going to be in a crafting recipe to make something good
				icon_state = "WILSON"
				defense=50
				mage=50
				speedboost=4
				price = 50
			cake_armor//Stats are low because it's going to be in a crafting recipe to make something good
				icon_state = "cake armor"
				defense=50
				mage=50
				speedboost=3
				price = 50
			blood_stained_robes
				icon_state = "blood stained robes"
				defense=45
				mage=30
				speedboost=1
				price=90
			dark_elf_plate_armor
				icon_state = "dark elf plate armor"
				defense=40
				mage=18
				speedboost = 1
				price = 70
			dark_elf_ninja_armor
				icon_state = "dark elf ninja armor"
				defense=32
				mage=32
				speedboost=2
				price=72
			plague_demon_cloak
				icon_state = "plague demon cloak"
				defense=50
				mage=10
				speedboost=0
				price=100
			wind_god_coat
				icon_state = "wind god coat"
				defense=50
				mage=13
				speedboost=3
				price=100
			wind_armor
				icon_state = "wind armor"
				defense=40
				mage=30
				speedboost = 1
				price = 73
			wind_gear
				icon_state = "wind gear"
				defense=38
				mage=30
				speedboost=2
				price=71
			wind_spawn_armor
				icon_state = "wind spawn armor"
				defense=27
				mage=26
				speedboost=3
				price = 40
			water_armor
				icon_state = "water armor"
				defense=42
				mage=32
				speedboost = 1
				price = 75
			water_leather
				icon_state = "water leather"
				defense=35
				mage=35
				speedboost=2
				price=74
			water_spawn_armor
				icon_state = "water spawn armor"
				defense=27
				mage=28
				speedboost=2
				price = 42
			water_god_cloak
				icon_state = "water god cloak"
				defense=52
				mage=12
				speedboost=2
				price=112
			steam_armor
				icon_state = "steam armor"
				defense = 45
				skill = "super_pulse"
				mage = 45
				speedboost = 3
				price = 110


			overlord_steam_armor
				icon_state = "overlord steam armor"
				defense = 80
				skill = "super_pulse"
				mage = 80
				speedboost = 3
				price = 110
			robes_of_prophecy
				icon_state = "robes of prophecy"
				defense = 20
				skill = "super_pulse"
				mage = 140
				speedboost = 3
				price = 110
			nimble_gearworks
				icon_state = "nimble gearworks"
				defense = 75
				skill = "super_pulse"
				mage = 75
				speedboost = 4
				price = 110
			grand_cog
				icon_state = "grand cog"
				defense = 140
				skill = "super_pulse"
				mage = 20
				speedboost = 0
				price = 110


			burning_leather
				icon_state = "burning leather"
				defense=37
				mage=37
				speedboost=2
				price=74
			burning_robes
				icon_state = "burning robes"
				defense=27
				mage=28
				speedboost=2
				price = 42

			corrupted_archer_gear
				icon_state = "corrupted_archer_gear"
				defense=20
				mage=45
				speedboost=1
				price=74
			corrupted_cyclops_armor
				icon_state = "corrupted cyclops armor"
				defense=45
				mage=20
				speedboost=0
				price = 42
			corrupted_hybrid_skin
				icon_state = "corrupted hybrid skin"
				defense=30
				mage=35
				speedboost=3
				price=74
			corrupted_ninja_robes
				icon_state = "corrupted ninja robes"
				defense=38
				mage=38
				speedboost=2
				price = 42
			corrupted_berserker_armor
				icon_state = "corrupted berserker armor"
				defense=80
				mage=10
				speedboost=0
				price=74

			ice_armor
				icon_state = "ice armor"
				defense = 30
				mage = 60
				speedboost = 2
				ability = "super_pulse"
			neon_armor
				icon_state = "neon armor"
				defense = 60
				mage = 30
				speedboost = 2
				ability = "super_pulse"

			fire_god_cloak
				icon_state = "fire god cloak"
				defense=54
				mage=14
				speedboost=2
				price=112
			plated_chaos
				icon_state = "plated chaos"
				defense=50
				mage=30
				speedboost=1
				price=74
			chaos_god_cloak
				icon_state = "chaos god cloak"
				defense=56
				mage=16
				speedboost=1
				price = 42
			gatekeeper_robes
				icon_state = "gatekeeper robes"
				defense=29
				mage=30
				speedboost=2
				price = 44
			orc_slave_cloth
				icon_state = "orc slave cloth"
				defense=31
				mage=32
				speedboost=2
				price = 42
			trial_guards_leather
				icon_state = "trial guards leather"
				defense=58
				mage=18
				speedboost=1
				price = 48
			devilish_armor
				icon_state = "devilish armor"
				defense=46
				mage=34
				speedboost=1
				price = 46
			wanderers_robes
				icon_state = "wanderers robes"
				defense=31
				mage=33
				speedboost=2
				price = 50
			fallen_angel_armor
				icon_state = "fallen angel armor"
				defense=48
				mage=36
				speedboost=1
				price = 46
			dark_elf_slave_cloth
				icon_state = "dark elf slave cloth"
				defense=33
				mage=34
				speedboost=2
				price = 42
			fallen_angel_leather
				icon_state = "fallen angel leather"
				defense=41
				mage=41
				speedboost=2
				price=74
			demon_king_armor
				icon_state = "demon king armor"
				defense=60
				mage=20
				speedboost=1
				price = 48
			wanderers_armor
				icon_state = "wanderers armor"
				defense=50
				mage=38
				speedboost=1
				price = 46
			demon_leather
				icon_state = "demon leather"
				defense=43
				mage=43
				speedboost=2
				price=74
			dwarf_slave_cloth
				icon_state = "dwarf slave cloth"
				defense=35
				mage=36
				speedboost=2
				price = 42
			demon_cloth
				icon_state = "demon cloth"
				defense=29
				mage=34
				speedboost=2
				price = 44
			demon_king_armor
				icon_state = "demon king armor"
				defense=62
				mage=22
				speedboost=1
				price = 48
			wanderers_leather
				icon_state = "wanderers leather"
				defense=45
				mage=45
				speedboost=2
				price=74
			demon_lord_armor
				icon_state = "demon lord armor"
				defense=64
				mage=24
				speedboost=1
				price = 48
			underworld_armor
				icon_state = "demon king armor"
				defense=66
				mage=26
				speedboost=1
				price = 48
			kings_cape
				icon_state = "kings cape"
				defense=25
				mage=55
				speedboost=2
				skill = "super_pulse"
				price=70
			nebula_robes
				icon_state = "nebula robes"
				defense=50
				mage=60
				speedboost=2
				skill = "super_pulse"
				price=70
			pidgeon_armor
				icon_state = "pidgeon armor"
				defense=38
				mage=39
				speedboost=2
				price = 42
			space_armor
				icon_state = "space armor"
				defense=68
				mage=30
				speedboost=1
				price = 48
			space_leather
				icon_state = "space leather"
				defense=48
				mage=48
				speedboost=2
				price=74
			space_robes
				icon_state = "space armor"
				defense=39
				mage=68
				speedboost=2
				price = 48
			hawk_armor
				icon_state = "hawk armor"
				defense=41
				mage=42
				speedboost=2
				price = 42
			alien_armor
				icon_state = "alien armor"
				defense=71
				mage=33
				speedboost=1
				price = 48
			engineers_armor
				icon_state = "engineers armor"
				defense=71
				mage=33
				speedboost=1
				price = 48
			alien_leather
				icon_state = "alien leather"
				defense=51
				mage=51
				speedboost=2
				price=74
			alien_space_suit
				icon_state = "alien space suit"
				defense=33
				mage=71
				speedboost=2
				price = 48
			mummy_robes
				icon_state = "mummy robes"
				defense=36
				mage=74
				speedboost=2
				price = 48
			mummy_leather
				icon_state = "mummy leather"
				defense=54
				mage=54
				speedboost = 2
			mummy_armor
				icon_state = "mummy armor"
				defense=74
				mage=36
				speedboost=1
				price = 48
			eagle_armor
				icon_state = "eagle armor"
				defense=44
				mage=46
				speedboost=2
				price = 42
			scorpion_armor
				icon_state = "scorpion armor"
				defense=44
				mage=46
				speedboost=2
				price = 42
			raven_armor
				icon_state = "raven armor"
				defense=47
				mage=49
				speedboost=2
				price = 42

			snow_robes
				icon_state = "snow robes"
				defense=60
				mage=70
				speedboost=2
				skill = "ice"
				price=70

			aviator_gear
				icon_state = "aviator gear"
				defense=60
				mage=60
				speedboost=3
				skill = "rush"
				price=70
			super_warrior_armor
				icon_state = "super warrior armor"
				defense=50
				mage=40
				speedboost=4
				skill = "super_pulse"
				price=50
			limb_ripper_hide
				icon_state = "limb ripper hide"
				defense=75
				mage=35
				speedboost=-1
				skill = "rush"
				price=50


			mage_cloack
				icon_state = "mage cloack"
				defense=39
				mage=77
				speedboost=2
				price = 48
			gear_gear
				icon_state = "gear gear"
				defense=57
				mage=57
				speedboost = 2
			cog_armor
				icon_state = "cog armor"
				defense=77
				mage=39
				speedboost=1
				price = 48
			arachnid_hide
				icon_state = "arachnid hide"
				defense=50
				mage=50
				speedboost=3
				price = 42


			necrospawn_robes
				icon_state = "necrospawn robes"
				defense=42
				mage=80
				speedboost=2
				price = 48
			tainted_timetelling_gear
				icon_state = "tainted timetelling gear"
				defense=60
				mage=60
				speedboost = 3
			necrospawn_armor
				icon_state = "necrospawn armor"
				defense=80
				mage=42
				speedboost=1
				price = 48



			headsman_armor
				icon_state = "headsman armor"
				defense=83
				mage=45
				speedboost=1
				price = 48
			darkfate_cloak
				icon_state = "darkfate cloak"
				defense=45
				mage=83
				speedboost = 2
			darkfate_leather
				icon_state = "darkfate leather"
				defense=63
				mage=63
				speedboost=3
				price = 48


