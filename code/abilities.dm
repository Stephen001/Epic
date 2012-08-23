


mob/var/abils = list("null","null","null","null","null")
trap
	parent_type = /obj
	icon = 'skill.dmi'
	var/mob/owner
	var/damage = 0
	var/sparkle = ""
	var/stun=0
	var/can_explode=1
	fire
		icon_state = "fire trap"
		sparkle = "fire"
		damage = 20
	New()
		..()
		spawn()
			if(owner)
				owner.view_sound('magic_use.wav')
		spawn(200)
			if(src)
				del(src)
	proc
		explode(mob/m)
			if(m && owner)
				if(owner && m.team <> owner.team && can_explode && m.live)
					can_explode = 0
					m.damage(damage,src.owner)
					var/s = sparkle
					m.sparkles.Add(sparkle)
					m.view_sound('magic_hit.wav')
					if(stun)
						m.stun(owner,stun)
					spawn(5)
						if(m)
							m.sparkles.Remove(s)
						if(src)
							del(src)
			else
				del(src)

proc/convert(num)

	if(num > 360)
		num = num-360

	return num
mob
	var/pulse_counter = 0
	var/ability/sneak/sneak_abil = new()
	proc
		sneak()
			if(sneak_abil)
				sneak_abil.use(src)
		pulse()
			src.view_sound('magic_use.wav')
			src.pulses += image('item.dmi',icon_state = "super pulse",layer=10)
			spawn(5)
				src.pulses = list()

			for(var/liv/m in orange(4,src))
				if(bounds_dist(m,src) <=40 && src <> m)
					m.stun(src,20)
					src.view_sound('magic_hit.wav')
ability
	parent_type = /obj

	icon = 'skill.dmi'

	var/cooldown=0
	var/can_use=1
	var/mp_usage=0
	var/hp_usage=0

	New()
		..()
		icon_state = name

	sneak
		cooldown = 5
		mp_usage=1
		use(mob/M)
			if(..()!=0)

				if(M.sneak)
					M.sneak=0

				else

					for(var/Enemy/E in orange(5,M))
						if(E.team <> M.team && E.live && E.summon_owner <> M)
							M.damage_number("Enemies nearby.")
						return

					var/MS =  (15 + (M.passive("Undetected")*2))*2
					M.sneak = MS

					var/X = M.hp
					var/Y = M.vel_x+M.vel_y
					var/obj/O = new/obj
					O.screen_loc = "11,6"
					if(M.client)
						M.client.screen+=O

					while(M.sneak)


						O.maptext = "sneak: [M.sneak]/[MS]"


						if(M.shooting)
							M.sneak=0
						if(M.hp < X)
							M.sneak = 0

						Y = M.vel_x+M.vel_y

						if(Y)

							var/_y = 0
							for(var/Enemy/E in orange(7,M))
								if(E.team <> team && E.live)
									_y++

							if(_y)
								M.sneak -= _y+1
							if(M.sneak < 0)
								M.sneak = 0
								M.damage_number("Spotted!")
								break


						sleep(2)

						if(M.sneak <> 0 && M.sneak < MS)
							M.sneak++
					del(O)




	primal_rage//: -10 hp, instant spin 30 cd
		cooldown = 30
		mp_usage = 5
		use(mob/M)
			if(..()!=0 && M.hp > 10)
				if(M.weapon_1)
					M.hp -= 10
					M.spin(M.weapon_1)
				else
					if(M.weapon_2)
						M.hp -= 10
						M.spin(M.weapon_2)
	bash//: 5 stun in front 15 cd

		cooldown = 15
		mp_usage = 2
		use(mob/M)
			if(..()!=0 && M.reflect==0)


				M.view_sound('swing.wav')

				for(var/liv/m in M.front(20))
					if(M <> m && M.team <> m.team)

						m.sparkles += "dust"
						spawn(5)

							m.pulses = list()
							m.sparkles -= "dust"

						M.view_sound('shield block.wav')

						m.stun(M,5)

						if(istype(m,/Enemy/))
							var/Enemy/e = m
							e.vrange = 10
							e.target = M

	healing_pulse//: pulse, heal +7 for each 30 cd
		cooldown=30
		mp_usage=10

		use(mob/M)
			if(..()!=0)
				M.view_sound('magic_use.wav')
				M.pulses += image('item.dmi',icon_state = "pulse",layer=10)
				spawn(5)
					M.pulses = list()

				for(var/liv/m in orange(2,M))
					if(bounds_dist(m,M) <=20 && M <> m)
						M.view_sound('magic_hit.wav')
						m.stun(M,10)
						M.hp+=7
						if(M.hp > M.hp_max)
							M.hp = M.hp_max

	dash//: +7 speed 10 cd

		cooldown=10
		mp_usage=2

		use(mob/M)
			if(..()!=0)
				M.view_sound('swing.wav')
				if(M.armor)
					M.armor.speedboost += 7
					spawn(10)
						M.armor.speedboost -= 7

	AoE/deafening_roar//: 10 aoe drain all mana 10 stun 100 cd

		cooldown = 100
		range=10
		stun=10
		mp_usage=30

		use(mob/M)
			if(..()!=0)

				M.mp = 0


	blackblood//: -5 hp +10 mana 10 cd
		cooldown = 5
		mp_usage = 5
		use(mob/M)
			if(..()!=0 && M.hp > 5)
				M.view_sound('magic_hit.wav')
				M.view_sound('swing.wav')
				M.hp -= 5
				M.mp += 5
				if(M.mp > M.mp_max)
					M.mp = M.mp_max
				M.hbar.update(M)
	time_burst//: all mana damage equal to half mana 100 cd
		cooldown = 100
		mp_usage = 1
		use(mob/M)

			if(..()!=0)
				var/projectile/p = new/projectile/general_projectiles/time_burst(M,M.dir2angle(M.dir))
				p.damage = M.mp/2
				M.mp = 0

	arrow_barrage
		cooldown = 50
		mp_usage = 50



//		use(mob/M)
		//	if(..()!=0)

	spiral_cancer

		cooldown = 50
		mp_usage = 50
		use(mob/M)
			if(..()!=0 && M.reflect==0)




				M.pulses += image('item.dmi',icon_state = "rasengan",layer=10)
				M.pulses += image('item.dmi',icon_state = "wind god organ pull",layer=10)
				spawn(15)
					M.pulses = list()

				M.view_sound('swing.wav')
				if(M.armor)
					M.armor.speedboost += 10
					M.move(M.dir)
					spawn(5)
						M.armor.speedboost -= 10
						M.slow_down()

						for(var/liv/m in M.front(20))
							if(M <> m && M.team <> m.team)


								m.pulses += image('item.dmi',icon_state = "rasengan",layer=10)
								m.sparkles += "spiral cancer"
								spawn(5)

									m.pulses = list()
									m.sparkles -= "spiral cancer"

								M.view_sound('magic_hit.wav')

								m.stun(M,10)

								m.damage(20,M)

								if(istype(m,/Enemy/))
									var/Enemy/e = m
									e.vrange = 10
									e.target = M


	kamehameha


		cooldown = 30
		mp_usage = 20
		var
			stun=10
			damage=10
			delay=20
		use(mob/M)
			if(..()!=0 && M.reflect==0)

				var/beams = list()

				for(var/turf/T in orange())


					if(M.dir == get_dir(M,T))

						var/obj/O = new/obj
						beams += O
						O.icon = 'skill.dmi'
						O.icon_state = "beam"
						O.loc = T


						O.icon = Icon(O.icon,O.icon_state,M.angle)

						O.dir = dir

						for(var/liv/m in T)
							if(M <> m && M.team <> m.team)
								M.view_sound('magic_hit.wav')

								if(stun)
									m.stun(M,stun)
								if(damage)
									m.damage(damage,M)

								if(istype(m,/Enemy/))
									var/Enemy/e = m
									e.vrange = 10
									e.target = M

				spawn(delay)
					for(var/obj/O in beams)
						del(O)



	shield
		var/time = 10
		var/pulse

		cooldown = 30
		mp_usage = 20
		use(mob/M)
			if(..()!=0 && M.reflect==0)



				if(pulse)
					M.pulses += image('item.dmi',icon_state = "[pulse]",layer=10)

				M.reflect=1
				spawn(time*3)
					M.reflect=0
					M.pulses = list()

	AoE
		var/range = 1
		var/effect = ""
		var/pulse = ""
		var/stun = 0
		var/damage = 0
		cooldown=20
		mp_usage=20
		use(mob/M)

			if(..()!=0)
				M.view_sound('magic_use.wav')
				if(pulse <> "")
					M.pulses += image('item.dmi',icon_state = "[pulse]",layer=10)
					spawn(5)
						M.pulses = list()
				if(effect <> "")
					for(var/turf/T in orange(range,M))
						if(T.density==0)

							var/image/I = image('skill.dmi',icon_state = "[effect]")

							T.overlays += I
							spawn(5)

								T.overlays-=I


				for(var/liv/m in orange(range,M))
					if(M <> m && M.team <> m.team)
						M.view_sound('magic_hit.wav')

						if(stun)
							m.stun(M,stun)
						if(damage)
							m.damage(damage,M)

						if(istype(m,/Enemy/))
							var/Enemy/e = m
							e.vrange = 10
							e.target = M
				return 1
			else
				return 0


	fire

		cooldown=20
		mp_usage=20

		use(mob/M)
			if(..()!=0)
				M.shoot("fire")
	fire_trap

		cooldown=30
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				var/trap/fire/T = new/trap/fire
				T.owner = M
				T.loc = get_step(M,M.dir)
	summon_chaos

		cooldown=150
		mp_usage=30

		use(mob/M)
			if(..()!=0)
				var/Enemy/chaos_spirit/E = new
				E.loc = M.loc
				E.summon_owner = M

				M.view_sound('summon.wav')

				spawn(300)
					if(E && M)
						E.die(M)
					else
						if(E)
							E.die(E)
	rush

		cooldown=30
		mp_usage=10

		use(mob/M)
			if(..()!=0)
				M.view_sound('swing.wav')
				if(M.armor)
					M.armor.speedboost += 10
					spawn(5)
						M.armor.speedboost -= 10
	berserk

		cooldown=60
		hp_usage=10

		use(mob/M)
			if(..()!=0)
				if(M.attackbuff)
					M.attackbuff=0

				M.view_sound('swing.wav')

				M.attackbuff += 1

				M.pulses += image('item.dmi',icon_state = "anger",layer=10)
				spawn(5)
					M.pulses = list()

				M.berserk = 1

				spawn(50)
					M.pulses = list()
					M.attackbuff = 0
					M.berserk = 0

	roar

		cooldown=30
		mp_usage=10

		use(mob/M)
			if(..()!=0)
				M.view_sound('magic_use.wav')
				M.pulses += image('item.dmi',icon_state = "roar",layer=10)
				spawn(5)
					M.pulses = list()

				for(var/liv/m in orange(6,M))
					if(M <> m)
						M.view_sound('magic_hit.wav')
						m.stun(M,1)
						if(istype(m,/Enemy/))
							var/Enemy/e = m
							e.vrange = 10
							e.target = M

	pulse

		cooldown=30
		mp_usage=10

		use(mob/M)
			if(..()!=0)
				M.view_sound('magic_use.wav')
				M.pulses += image('item.dmi',icon_state = "pulse",layer=10)
				spawn(5)
					M.pulses = list()

				for(var/liv/m in orange(2,M))
					if(bounds_dist(m,M) <=20 && M <> m)
						M.view_sound('magic_hit.wav')
						m.stun(M,10)
	super_pulse

		cooldown=50
		mp_usage=20

		use(mob/M)
			if(..()!=0)
				M.view_sound('magic_use.wav')
				M.pulses += image('item.dmi',icon_state = "super pulse",layer=10)
				spawn(5)
					M.pulses = list()

				for(var/liv/m in orange(4,M))
					if(bounds_dist(m,M) <=40 && M <> m)
						m.stun(M,20)
						M.view_sound('magic_hit.wav')
	ice

		cooldown=20
		mp_usage=20

		use(mob/M)
			if(..()!=0)
				M.shoot("ice")
	poison_dart

		cooldown=40
		mp_usage=0

		use(mob/M)
			if(..()!=0)
				M.shoot("general_projectiles/poison_dart")
	cannon

		cooldown=20
		mp_usage=0

		use(mob/M)
			if(..()!=0)
				M.shoot("cannon")


	heal

		cooldown=0.5
		mp_usage=5

		use(mob/M)
			if(..()!=0)
				M.shoot("heal")

	proc

		use(mob/M)
			if(can_use==0) return 0

			if(M.mp < mp_usage)
				return 0
			if(M.hp < hp_usage)
				return 0

			var/X = 0

			var/Z = M.passive("Caster")*5

			if(rand(Z,100) == 100)
				X = 1

			if(X==0)

				var/mod = 1
				if(M.has_epic("water"))
					mod = 0.5
				M.mp -= mp_usage*mod
				M.hp -= hp_usage

			can_use=0
			var/cd = cooldown

			cd -= cd*(M.passive("Blitz")/20)



			if(M.orb("half cooldowns"))
				cd = cd/2
			if(M.orb("no cooldowns"))
				cd = 0.5

			if(M.has_epic("fire"))
				var/item/weapon/w = M.weapon_1
				var/item/weapon/w2 = M.weapon_2

				if(w)
					if(findtext(w.name,"staff"))
						w.can_attack = 1
				if(w2)
					if(findtext(w2.name,"staff"))
						w2.can_attack = 1


			spawn(cd)
				can_use=1
				if(M && M.client)
					M.hbar.update()
			..()