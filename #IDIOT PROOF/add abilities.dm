
ability
/*
TRAPS AND SUMMONS

	fire_trap

		cooldown=30
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				var/trap/fire/T = new/trap/fire //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)

	summon_chaos

		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/chaos_spirit/E = new //change the /Enemy path here to set which mob it summons. make sure the mob has team 1
				E.loc = M.loc
				E.summon_owner = M
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
*/

	AoE
		//this is where AoE abilities go.
		/*

		here are the vars

		range = 1// how many tiles wide this effect is
		effect = ""// if applicable, the effect from skill.dmi that is displayed on all the turfs within range
		pulse = ""// if appicable, the pulse from item.dmi that is displayed on the player
		stun = 0 // how much it stuns all the foes in range
		damage = 0 // how much damage it does


		example(not in game yet, just an example):

		tidal_wave
			range = 3
			effect = "water"
			pulse = "water pulse"
			stun = 20
			damage = 5
			cooldown = 20
			mp_usage = 10

		*/
		tidal_wave
			range = 3
			effect = "tidal wave"
			pulse = "tidal"
			stun = 20
			damage = 8
			cooldown = 20
			mp_usage = 10

		flame
			range = 3
			effect = "flame"
			pulse = "flare"
			stun = 0
			damage = 12
			cooldown = 23
			mp_usage = 14
		twister
			range = 3
			effect = "twist"
			pulse = "twister"
			stun = 23
			damage = 10
			cooldown = 21
			mp_usage = 13
		tree
			range = 4
			effect = "branches"
			pulse = "tree"
			stun = 30
			damage = 0
			cooldown = 18
			mp_usage = 8
		earthquake
			range = 3
			effect = "earthquake"
			pulse = "quake"
			stun = 20
			damage = 9
			cooldown = 22
			mp_usage = 12
		blizzard
			range = 3
			effect = "blizzard"
			pulse = "blizzard"
			stun = 20
			damage = 11
			cooldown = 24
			mp_usage = 16
		chaos
			range = 2
			effect = "chaotic"
			pulse = "chaos blast"
			stun = 0
			damage = 15
			cooldown = 30
			mp_usage = 30
		vortex
			range = 4
			effect = "vortex"
			pulse = "vortex"
			stun = 50
			damage = 0
			cooldown = 28
			mp_usage = 28
		thunder
			range = 3
			effect = "thunder flash"
			pulse = "thunder"
			stun = 0
			damage = 16
			cooldown = 33
			mp_usage = 33
		explosion
			range = 3
			effect = "explode"
			pulse = "explode"
			stun = 5
			damage = 19
			cooldown = 35
			mp_usage = 30
		magma
			range = 3
			effect = "magma"
			pulse = "magma"
			stun = 0
			damage = 17
			cooldown = 37
			mp_usage = 33
		blade_storm
			range = 3
			effect = "blade storm"
			pulse = "blade storm"
			stun = 10
			damage = 16
			cooldown = 39
			mp_usage = 32
		leaf_storm
			range = 3
			effect = "leaf storm"
			pulse = "razor leaf"
			stun = 5
			damage = 16
			cooldown = 41
			mp_usage = 34
		avalanche
			range = 3
			effect = "avalanche"
			pulse = "avalanche"
			stun = 5
			damage = 17
			cooldown = 41
			mp_usage = 34
		sand_storm
			range = 3
			effect = "sand storm"
			pulse = "sand storm"
			stun = 5
			damage = 18
			cooldown = 41
			mp_usage = 34
		cyclone
			range = 3
			effect = "cyclone"
			pulse = "cyclone"
			stun = 5
			damage = 19
			cooldown = 41
			mp_usage = 34
		rough_seas
			range = 3
			effect = "rough_seas"
			pulse = "rough seas"
			stun = 5
			damage = 20
			cooldown = 41
			mp_usage = 34
		time_pulse
			range = 1
			effect = "time pulse"
			pulse = "time pulse"
			stun = 50
			damage = 10
			cooldown = 50
			mp_usage = 50
		gear_rampage
			range = 1
			effect = "gear rampage"
			pulse = "gear rampage"
			stun = 10
			damage = 70
			cooldown = 70
			mp_usage = 70
	shield
		/*
		these reflect projectiles

		vars:

		time = 2 // 10 = 1 second. how long it reflects. AT MAX TIER DO LIKE, 20. I CAN EASILY IMAGINE YOU ADDING LIKE 100
		pulse //the pulse it reflects, from item.dmi

		*/
		energy_wave
			time = 10
			pulse = "energy wave"
		psychic_wave
			time = 15
			pulse = "psychic wave"
		tough_wave
			time = 20
			pulse = "tough wave"
		darkness_wave
			time = 25
			pulse = "darkness wave"
		strong_wave
			time = 30
			pulse = "strong wave"
		suppression_wave
			time = 35
			pulse = "suppression wave"
		sand_wave
			time = 45
			pulse = "sand wave"
		laser_shield
			time = 50
			pulse = "laser shield"
		water_wave
			time = 40
			pulse = "water wave"
		magma_wave
			time = 55
			pulse = "magma wave"
		ice_wave
			time = 60
			pulse = "ice wave"
		time_wave
			time = 75
			pulse = "time wave"
		fate_wave
			time = 80
			pulse = "fate wave"
	summon_sand_creature

		cooldown=150
		mp_usage=33

		use(mob/M)
			if(..()!=0)
				var/Enemy/sand_creature/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_zombie

		cooldown=150
		mp_usage=35

		use(mob/M)
			if(..()!=0)
				var/Enemy/zombie/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_pyros

		cooldown=150
		mp_usage=36

		use(mob/M)
			if(..()!=0)
				var/Enemy/pyros_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_aquos

		cooldown=150
		mp_usage=36

		use(mob/M)
			if(..()!=0)
				var/Enemy/aquos_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_swamp_creature

		cooldown=150
		mp_usage=34

		use(mob/M)
			if(..()!=0)
				var/Enemy/swamp_creature/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_storm

		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/storm_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_lightning

		cooldown=150
		mp_usage=37

		use(mob/M)
			if(..()!=0)
				var/Enemy/lightning_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_thunder

		cooldown=150
		mp_usage=38

		use(mob/M)
			if(..()!=0)
				var/Enemy/thunder_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_ventus

		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/wind_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_nurse

		cooldown=150
		mp_usage=50

		use(mob/M)
			if(..()!=0)
				var/Enemy/nurse/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_vampire

		cooldown=150
		mp_usage=42

		use(mob/M)
			if(..()!=0)
				var/Enemy/vampire/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_rabbits
		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/rabbits/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	go_mudkipz
		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/mudkipz/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_leprechaun
		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/leprechaun/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_werewolf

		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/werewolf/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	summon_golem

		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/golem/E = new
				E.loc = M.loc
				E.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	vocare_animalia

		cooldown=150
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				var/Enemy/rabbits/E = new
				var/Enemy/werewolf/B = new
				var/Enemy/golem/C = new
				E.loc = M.loc
				E.summon_owner = M
				B.loc = M.loc
				B.summon_owner = M
				C.loc = M.loc
				C.summon_owner = M
				M.view_sound('summon.wav')
				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
					if(B && M)
						B.die(M)
					else
						if(B)
							B.die(B)
					if(C && M)
						C.die(M)
					else
						if(C)
							C.die(C)
	ice_trap

		cooldown=15
		mp_usage=15

		use(mob/M)
			if(..()!=0)
				var/trap/ice/T = new/trap/ice //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	psychic_trap

		cooldown=50
		mp_usage=50

		use(mob/M)
			if(..()!=0)
				var/trap/psychic/T = new/trap/psychic //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	sand_trap

		cooldown=25
		mp_usage=25

		use(mob/M)
			if(..()!=0)
				var/trap/sand/T = new/trap/sand //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	leaf_trap

		cooldown=10
		mp_usage=10

		use(mob/M)
			if(..()!=0)
				var/trap/leaf/T = new/trap/leaf //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	lightning_trap

		cooldown=35
		mp_usage=35

		use(mob/M)
			if(..()!=0)
				var/trap/lightning/T = new/trap/lightning //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	spike_trap

		cooldown=38
		mp_usage=38

		use(mob/M)
			if(..()!=0)
				var/trap/spike/T = new/trap/spike //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	bomb_trap

		cooldown=60
		mp_usage=60

		use(mob/M)
			if(..()!=0)
				var/trap/bomb/T = new/trap/bomb //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	earth_trap

		cooldown=45
		mp_usage=45

		use(mob/M)
			if(..()!=0)
				var/trap/earth/T = new/trap/earth //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	thorn_trap

		cooldown=46
		mp_usage=46

		use(mob/M)
			if(..()!=0)
				var/trap/thorn/T = new/trap/thorn //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	pitfall_trap

		cooldown=48
		mp_usage=48

		use(mob/M)
			if(..()!=0)
				var/trap/pitfall/T = new/trap/pitfall //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	mud_trap

		cooldown=42
		mp_usage=42

		use(mob/M)
			if(..()!=0)
				var/trap/mud/T = new/trap/mud //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	razor_trap

		cooldown=50
		mp_usage=50

		use(mob/M)
			if(..()!=0)
				var/trap/razor/T = new/trap/razor //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	sleep_trap

		cooldown=48
		mp_usage=48

		use(mob/M)
			if(..()!=0)
				var/trap/sleep/T = new/trap/sleep //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	spear_trap

		cooldown=50
		mp_usage=50

		use(mob/M)
			if(..()!=0)
				var/trap/sleep/T = new/trap/spear //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
	fate_trap

		cooldown=52
		mp_usage=52

		use(mob/M)
			if(..()!=0)
				var/trap/sleep/T = new/trap/fate //change the trap path to set which trap it places.
				T.owner = M
				T.loc = get_step(M,M.dir)
trap
/*
this one's really simple-

	fire
		icon_state = "fire trap"
		sparkle = "fire"
		damage = 20
*/
	ice
		icon_state = "ice trap"
		sparkle = "icy"
		damage = 5
		stun = 20
	psychic
		icon_state = "psychic trap"
		sparkle = "p explode"
		damage = 50
		stun = 0
	sand
		icon_state = "sand trap"
		sparkle = "dirt"
		damage = 25
		stun = 25
	leaf
		icon_state = "leaf trap"
		sparkle = "leaf"
		damage = 0
		stun = 50
	lightning
		icon_state = "lightning trap"
		sparkle = "electricity"
		damage = 35
		stun = 10
	spike
		icon_state = "spike trap"
		sparkle = "dust"
		damage = 38
		stun = 15
	bomb
		icon_state = "bomb trap"
		sparkle = "fire ball"
		damage = 60
		stun = 0
	mud
		icon_state = "mud trap"
		sparkle = "dust"
		damage = 40
		stun = 20
	earth
		icon_state = "earth trap"
		sparkle = "dirt"
		damage = 45
		stun = 0
	pitfall
		icon_state = "pitfall trap"
		sparkle = "dust"
		damage = 10
		stun = 60
	thorn
		icon_state = "thorn trap"
		sparkle = "thorns"
		damage = 30
		stun = 30
	razor
		icon_state = "razor trap"
		sparkle = "blade storm"
		damage = 50
		stun = 0
	sleep
		icon_state = "sleep trap"
		sparkle = "sleep"
		damage = 0
		stun = 100

	spear
		icon_state = "spear trap"
		sparkle = "dust"
		damage = 100
		stun = 0
	fate
		icon_state = "fate trap"
		sparkle = "fate"
		damage = 60
		stun = 60

projectile
	var/poison = 0
	general_projectiles

		/* VARIABLES FOR PROJECTILES

		icon_state
		range=5 (time it travels in tenths of seconds)
		damage = 5 (damage it does. 10 damage = 1 heart)
		explode_range=20 (how many pixels far it spreads when it explodes. 32 = 1 tile)
		sparkle = "fire" (the effect it sparkles on the target when hit, as an icon_state)

		drawn in skill.dmi

		EXAMPLE

		fire
			icon_state = "fire"
			range=5
			damage = 5
			explode_range=20
			sparkle = "fire" //uses skill.dmi

		*/
		pebble
			icon_state = "pebble"
			range = 10
			damage = 3
			sparkle = "dust"
		poison_dart
			icon_state = "dart"
			range = 10
			damage = 3
			poison = 10
			must_turn = 1
			sparkle = "dust"
		dildo
			icon_state = "dildo"
			range = 5
			damage = 0
			stun=10
			poison = 0
			must_turn = 1
			sparkle = "dust"
		potato_fired
			icon_state = "potato"
			range = 14
			stun = 5
			damage = 15
			must_turn = 1
			sparkle = "dust"
		photon_blast
			icon_state = "photon"
			range = 48
			damage = 5
			must_turn = 1
			sparkle = "electricity"
		blue_portal
			icon_state = "blue portal"
			range = 48
			damage = 10
			stun = 10
			must_turn = 1
			sparkle = "electricity"
		orange_portal
			icon_state = "orange portal"
			range = 48
			damage = 20
			must_turn = 1
			sparkle = "electricity"
		elven_arrow
			icon_state = "elven arrow"
			range = 10
			damage = 14
			speed=32
			sparkle = "dust"
			must_turn =1
		paradox_arrow
			icon_state = "paradox arrow"
			range = 5
			damage = 5
			speed=32
			sparkle = "shadow sickle"
			must_turn =1
		glue
			icon_state = "glue"
			range = 40
			damage = 5
			stun = 15
			speed=10
			sparkle = "glue"
		apocalypse_arrow
			icon_state = "apocalypse arrow"
			range = 5
			damage = 6
			speed=32
			sparkle = "shadow sickle"
			must_turn = 1
		twist
			icon_state = "twist"
			range = 6
			damage = 6
			speed=32
			sparkle = "icy"
			must_turn =1
		dark_arrow
			icon_state = "dark arrow"
			range = 12
			damage = 12
			sparkle = "dust"
			must_turn =1
		orc_arrow
			icon_state = "orc arrow"
			range = 10
			damage = 11
			sparkle = "dust"
			must_turn =1
		shadow_arrow
			icon_state = "shadow arrow"
			range = 13
			damage = 13
			sparkle = "dust"
			must_turn =1
		dragon_arrow
			icon_state = "dragon arrow"
			range = 15
			damage = 13
			sparkle = "dust"
			must_turn =1
		bone_arrow
			icon_state = "bone arrow"
			range = 16
			damage = 10
			sparkle = "dust"
			must_turn =1
		dwarven_arrow
			icon_state = "dwarven arrow"
			range = 16
			damage = 7
			sparkle = "dust"
			must_turn =1
		divine_arrow
			icon_state = "divine arrow"
			range = 20
			damage = 16
			sparkle = "dust"
			must_turn =1
		time_burst
			icon_state = "time burst"
			range = 20
			damage = 1
			sparkle = "ice"
			must_turn =1
		ninja_star
			icon_state = "ninja star"
			range = 20
			damage = 1.5
			sparkle_time=0
			sparkle=null
		fate
			icon_state = "fate"
			range = 20
			damage = 15
			stun = 5
			sparkle_time=0
			sparkle=null
		tomahawk
			icon_state = "tomahawk"
			range = 12
			damage = 3
			sparkle_time=0
			sparkle=null
		refined_arrow
			icon_state = "refined arrow"
			range = 20
			damage = 15
			sparkle = "dust"
			must_turn =1
		magma_arrow
			icon_state = "magma arrow"
			range = 20
			damage = 16
			sparkle = "flame"
			must_turn =1
		static_blast
			icon_state = "static blast"
			range = 20
			damage = 3
			speed = 100
			sparkle = "dust"
			must_turn =0
		nether_arrow
			icon_state = "nether arrow"
			range = 20
			damage = 17
			sparkle = "chaotic"
			must_turn =1
		nocturnal_arrow
			icon_state = "nocturnal arrow"
			range = 20
			damage = 18
			sparkle = "chaotic"
			must_turn =1
		nitrous_arrow
			icon_state = "nitrous arrow"
			range = 20
			damage = 19
			sparkle = "chaotic"
			must_turn =1
		spear
			icon_state = "spear"
			range = 20
			damage = 38
			sparkle = "dust"
			must_turn =1
		sand_arrow
			icon_state = "sand arrow"
			range = 20
			damage = 21
			sparkle = "dust"
			must_turn =1
		steam_arrow
			icon_state = "steam arrow"
			range = 20
			damage = 22
			sparkle = "storm"
			must_turn =1
		time_arrow
			icon_state = "time arrow"
			range = 10
			damage = 24
			sparkle = "time"
			must_turn =1

		krewljolt_arrow
			icon_state = "krewljolt arrow"
			range = 20
			damage = 30
			sparkle = "electricity"
			must_turn =1

			stun = 5
			poison = 10
			explode_range = 30


		psy_bullet
			icon_state = "psy bullet"
			range = 20
			damage = 20
			sparkle = "mental"
			must_turn =1
		teeth
			icon_state = "teeth"
			range = 3
			damage = 1
			sparkle = "blood"
			must_turn =1
		love_arrow
			icon_state = "love arrow"
			range = 20
			damage = -13
			sparkle = "heart"
			must_turn =1
		sand_spit
			icon_state = "sand spit"
			range = 14
			damage = 14
			sparkle = "dust"
			must_turn =1
		grime
			icon_state = "grime"
			range = 14
			damage = 16
			sparkle = "dust"
			must_turn =1
		dust
			icon_state = "dust"
			range = 60
			damage = 5
			sparkle = "dust"
		shadow_sickle
			icon_state = "recycle"
			must_turn=1
			range = 5
			damage = 20
			explode_range=0
			sparkle = "shadow sickle"
		electric
			icon_state = "electric"
			must_turn=1
			range = 5
			damage = 13
			explode_range=12
			sparkle = "electricity"
		lightning_bolt
			icon_state = "lightning bolt"
			must_turn=1
			range = 7
			damage = 14
			explode_range=16
			sparkle = "electricity"
		storm
			icon_state = "storm"
			must_turn=1
			range = 10
			damage = 20
			explode_range=13
			sparkle = "storm"
		dirt
			icon_state = "dirt"
			must_turn=1
			range = 5
			damage = 6
			explode_range=20
			sparkle = "dust"
		heart
			icon_state = "dirt"
			must_turn=1
			range = 7
			damage = -20
			explode_range=14
			sparkle = "heart"
		fire_ball
			icon_state = "fire ball"
			range = 7
			damage = 15
			explode_range = 6
			sparkle = "fire"
		mental
			icon_state = "mental"
			range = 10
			damage = 16
			explode_range = 10
			sparkle = "p explode"
		plague
			icon_state = "plague"
			range = 12
			damage = 17
			explode_range = 13
			sparkle = "splot"
			must_turn = 1
		water
			icon_state = "water"
			range = 13
			damage = 19
			stun_time = 15
			explode_range = 16
			sparkle = "water"
			must_turn = 0
		blaze
			icon_state = "blaze"
			range = 13
			damage = 16
			stun_time = 20
			explode_range = 64
			sparkle = "flame"
			must_turn = 1
		snow_ball
			icon_state = "snow ball"
			range = 13
			damage = 20
			stun_time = 0
			explode_range = 13
			sparkle = "flame"
			must_turn = 1
			must_turn = 1
		steam
			icon_state = "steam"
			range = 13
			damage = 30
			stun_time = 5
			explode_range = 13
			sparkle = "flame"
			must_turn = 1
		brain
			icon_state = "brain"
			range = 13
			damage = 25
			stun_time = 0
			explode_range = 2
			sparkle = "brain"
			must_turn = 1
		drain
			icon_state = "drain"
			range = 13
			damage = 27
			stun_time = 0
			explode_range = 2
			sparkle = "chaotic"
			must_turn = 1
		sand_ball
			icon_state = "sand ball"
			range = 13
			damage = 29
			stun_time = 0
			explode_range = 2
			sparkle = "dust"
			must_turn = 1
		crystal
			icon_state = "crystal"
			range = 13
			damage = 35
			stun_time = 0
			explode_range = 2
			sparkle = "crystal"
			must_turn = 1
		divine
			icon_state = "divine"
			range = 13
			damage = 25
			stun_time = 10
			poison = 10
			explode_range = 2
			sparkle = "divine"
			must_turn = 1
		darknesss
			icon_state = "darkness"
			range = 13
			damage = 35
			stun_time = 0
			explode_range = 2
			sparkle = "darkness"
			must_turn = 1
		ancient
			icon_state = "ancient"
			range = 13
			damage = 40
			stun_time = 10
			poison=10
			explode_range = 2
			sparkle = "dirt"
			must_turn = 1
		time
			icon_state = "darkness"
			range = 13
			damage = 40
			stun_time = 0
			explode_range = 10
			sparkle = "chaos"
			must_turn = 1


		psychic
			icon_state = "psychic"
			range = 13
			damage = 22
			explode_range = 14
			sparkle = "p explode"
			must_turn = 1
		megaice
			icon_state = "megaice"

			sparkle = "icy"
			range=6
			damage = 10
			explode_range=1

			sparkle_time = 1

			speed=16

			stun_time = 20
ability

	/* VARIABLES FOR SHOOTING ABILITIES

	cooldown (in tenths of seconds how long it takes before it can be used again)
	mp_usage (10 mana = 1 blip)

	Draw the ability in skill.dmi
	icon_state is not needed


	EXAMPLE

	fire

		cooldown=20
		mp_usage=20

		use(mob/M)
			if(..()!=0)
				M.shoot("fire")
	*/

	shadow_sickle

		cooldown=20
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/shadow_sickle")
	megaice

		cooldown=18
		mp_usage=25

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/megaice")
	lightning_bolt

		cooldown=17
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/lightning_bolt")
	fire_ball

		cooldown=19
		mp_usage=28

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/fire_ball")
	electric

		cooldown=20
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/electric")
	dirt

		cooldown=6
		mp_usage=13

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/dirt")
	heart

		cooldown=10
		mp_usage=23

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/heart")

	dust

		cooldown=5
		mp_usage=10

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/dust")
	psychic

		cooldown=21
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/psychic")
	plague

		cooldown=22
		mp_usage=32

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/plague")
	storm

		cooldown=24
		mp_usage=33

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/storm")
	water

		cooldown=26
		mp_usage=34

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/water")
	blaze

		cooldown=28
		mp_usage=35

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/blaze")

	snow_ball

		cooldown=30
		mp_usage=36

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/snow_ball")
	drain

		cooldown=34
		mp_usage=38

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/drain")
	sand_ball

		cooldown=35
		mp_usage=39

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/sand_ball")

	crystal

		cooldown=36
		mp_usage=40

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/crystal")
	divine

		cooldown=38
		mp_usage=41

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/divine")
	darkness

		cooldown=32
		mp_usage=42

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/darkness")
	ancient

		cooldown=32
		mp_usage=43

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/ancient")
	brain

		cooldown=32
		mp_usage=37

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/brain")

	fate

		cooldown=32
		mp_usage=37

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/fate")






















/*EVENTS!
	...... You should probably guess that this means something that'll give the winner a reward...
	So basically I was thinking that I could create like 6 maps off on the side 3 maps for singles and
	3 for doubles. Anyways... The goal would be to send each person in the event to one of the chosen maps and see
	who can complete the map first. The winner would be awarded. They can't be in a team unless
	it's on one of the maps that are meant for doubles. Anywho... The reward would be a unique armor or weapon
	that you can't get anywhhere else but from that.

	was considering a PvP warzone type thing. maybe later.*/