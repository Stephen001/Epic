

HudObject/stat_bar

	var/icon_states
	var/displayed_value=null

	var/hearts = list()
	var/backs = list()

	proc/update(top_amount,bottom_amount)


		if(length(hearts) == 0 || length(backs) == 0)
			var/i = 20
			while(i-- <> 0)

				var/obj/O = new/obj
				O.icon = 'hud slots.dmi'
				O.icon_state = icon_state
				O.pixel_x = 18*i
				O.layer = 100
				hearts += O
		//		overlays += O
				hearts[O] = i
			i = 20
			while(i-- <> 0)

				var/obj/O = new/obj
				O.icon = 'hud slots.dmi'
				O.icon_state = "no [icon_state]"
				O.pixel_x = 18*i
				O.layer = 100
				backs += O
			//	underlays += O
				backs[O] = i

		top_amount = (round(top_amount,10))/10
		bottom_amount = (round(bottom_amount,10))/10

		underlays = null
		overlays = null

		for(var/obj/O in hearts)
			if(hearts[O] > top_amount)
				if(O in overlays)
					overlays-=O
				else
					continue
			else
				if(O in overlays)
					continue
				else
					overlays+=O

		for(var/obj/O in backs)
			if(backs[O] > bottom_amount)
				if(O in underlays)
					underlays-=O
				else
					continue
			else
				if(O in underlays)
					continue
				else
					underlays+=O



	/*	while(inte2--)

			world << "inte2 [inte2] inte [inte]"
			if(inte2 > inte)
				overlays += image('hud slots.dmi',"no [icon_state]",pixel_x=(18*inte2))

			else
				overlays += image('hud slots.dmi',"[icon_state]",pixel_x=(18*inte2))
*/



stat_bars
	parent_type = /HudGroup

	__add_object(x, y, icon_state, txt, width, height, value, l = null, icon/I = null)

		// create a new object and set its position, including
		// the specified x,y and its base x,y
		var/HudObject/stat_bar/h = new(src, icon, icon_state, value = value)

		if(!isnull(I))
			h.icon = I

		h.pos(x, y, sx, sy)

		if(!isnull(width) || !isnull(height))
			h.size(width, height)

		if(!isnull(l))
			h.layer = l
		else if(layer >= 0)
			h.layer = layer

		objects += h

		if(!isnull(txt))
			h.set_text(txt)

		// if this group is visible we have to show the
		// new object to all clients viewing this group
		if(visible)
			for(var/client/c in clients)
				__show_object(h, c)

		return h
	var
		HudObject/stat_bar/hp
		HudObject/stat_bar/mp

	layer=101
	New()
		..()
		hp = add(34,420,"hp")
		mp = add(34,400,"mp")
		show()

	proc/update(mob/m)

		if(m.hp > m.hp_max)
			m.hp = m.hp_max

		if(m.mp > m.mp_max)
			m.mp = m.mp_max

		hp.update(m.hp,m.hp_max)
		mp.update(m.mp,m.mp_max)


obj
	hit_effect
		icon = 'skill.dmi'
		icon_state = "nono"
		layer = MOB_LAYER + 50
		New(mob/m)
			loc =m.loc
			step_x = m.step_x
			step_y = m.step_y
			pixel_x = m.pixel_x + 16 + rand(-3,3)
			pixel_y = m.pixel_y + 16 + rand(-3,3)



			flick("hit effect [rand(1,4)]",src)
			spawn(4)
				del(src)


item/var/absorb_mana = 0
mob

	var
		stat_bars/hp_bar
		hp=30
		mp=20
		damaged=0
		berserk = 0
	proc/damage(damage,mob/m,mana_absorb = 0,hp_absorb = 0,crit = 1)


		if(m.team == src.team && damage > 0) return

		if(istype(m,/player) && m:companion)

			m:companion.target = src


		var/dodge = 0



		if(istype(src,/player))
			var/player/p = src

			if(p.orb("25% dodge chance"))
				dodge=25
			if(p.orb("40% dodge chance"))
				dodge = 40

			if(race == "dwarf")
				damage -= 3

			dodge += p.passive("Reflexes")*5
			if(race == "elf")
				dodge += 5

		if(dodge > 100)
			dodge = 100
		var/dd = prob(dodge)

		if(dd==1)

			src.view_sound('dodge.wav')


			src.pulses += image('item.dmi',icon_state = "dodge",layer=10)
			spawn(2)
				src.pulses = list()


			return

		var/boost2 = 0
		if(m.race == "cogman")
			boost2=7
		if(crit == 1 && rand( (m.passive("Artifice")*5)+boost2,100) ==100)
			crit = 2



		if(crit <> 1 && crit <> 0)

			sparkles += "crit"
			spawn(5)
				if(src) sparkles -= "crit"

		if(crit == 1 && src.berserk)
			crit = 2


		var/X = hp

		if(crit == 2 && m.orb("triple criticals"))
			crit = 3

		if(m.has_epic("wind"))
			crit++
		if(m.orb("+5 damage"))
			damage += 5
		var/final_damage = ((damage * crit) + m.passive("Brute"))
		if(has_epic("earth"))
			final_damage = final_damage/2

		if(team == key)
			final_damage = final_damage/2

		hp -= final_damage

		m.sneak=0

		new/obj/hit_effect(src)


		if( m.hp < 30 )
			hp -= m.passive("Anger")

		view_sound('damage.wav')

		mana_absorb += passive("Vampire")*5

		if(m.has_epic("water"))
			hp_absorb += final_damage/2

		if(mana_absorb && class <> "beast")
			if(mp - mana_absorb>0)
				mp -= mana_absorb
			else
				mp = 0

			if(m.mp + mana_absorb < m.mp_max)
				m.mp += mana_absorb
			else
				m.mp = m.mp_max
		if(hp_absorb)
			if(hp - hp_absorb>0)
				hp -= hp_absorb
			else
				hp = 0

			if(m.hp + hp_absorb < m.hp_max)
				m.hp += hp_absorb
			else
				m.hp = m.hp_max
		if(damaged == 0)
			if(damage>=0)
				damaged = 1
				spawn(5)
					if(src)
						damaged = 0
			else
				damaged = -1
				spawn(2)
					if(src)
						damaged = 0

		if(hp < X)
			damagetaken += X-hp

		if(hp <= 0)
			hp = 0
			die(m)

		if(carrying)
			carrying.carried = null
			carrying.pixel_y -= 8
			carrying.layer = MOB_LAYER
			carrying = null

		if(client) hp_bar.update(src)
		if(m.client) m.hp_bar.update(m)
		else if(istype(src,/Enemy/))
			var/Enemy/E = src
			E.vrange = 25
			E.target = m




	proc/die(mob/m)
		..()
	proc/kill(mob/m)

mob
	var/poisoned = 0
	proc/poisonme(mob/M,amount,dmg)
		if(poisoned)
			poisoned+=amount
			return

		poisoned+=amount

		poison(M,dmg)


	proc/poison(mob/M,dmg)

		if(poisoned && M)

			poisoned--

			src.damage(dmg,M)

			src.sparkles += "poison"
			spawn(6)
				if(src)
					sparkles -= "poison"

			spawn(10)
				if(M)
					poison(M)

	proc
		// update the mob's angle
		spark5(flash)
			sparkles += flash
			spawn(5)
				sparkles -= flash
		get_swing(item/weapon/w)
			var/l = list()
			for(var/mob/M in front(w.w_range))
				if(M <> src && get_dist(M,src)<=w.t_range)
					l+=M
			return l
		stun(mob/M,amount)
			if(M.has_epic("water"))
				amount += 5
			src.vel_y=0
			src.vel_x=0
			var/ms = src.move_speed
			src.move_speed = 1

			src.move(M.dir)

			src.damaged=1
			src.stunned=1
			if(orb("50% stun resist"))
				amount = amount/2
			if(orb("100% stun resist"))
				amount = 1
			spawn(amount + (M.passive("Bashing")*2))
				src.move_speed = ms
				src.stunned=0
				src.damaged=0
				src.slow_down()





		attack(item/weapon/w)
			if(shielding)


				var/item/apparel/shield/s

				if(src.weapon_1 && istype(src.weapon_1,/item/apparel/shield/) && src.weapon_1.can_attack==0)
					s = src.weapon_1
				if(src.weapon_2 && istype(src.weapon_2,/item/apparel/shield/) && src.weapon_2.can_attack==0)
					s = src.weapon_2
				if(s)

					if(s.x_off==0)

						view_sound('swing.wav')
						s.x_off=5
						angle(angle)
						spawn(5)
							s.x_off =0
							angle(angle)

						for(var/liv/M in front(32))


							if(s)
								view_sound('shield block.wav')
								M.stun(src,s.delay)


			if(w.can_attack && shooting && shielding==0)
				shooting=0
				w.can_attack=0
				w.effect(src)
				view_sound('swing.wav')
				for(var/liv/M in get_swing(w))
					if(M.team == team && w.damage>0) continue
					var/hit = 1
					if(M.shielding==1)
						if(src in M.front(32))
							hit=0

							var/item/s

							if(M.weapon_1 && istype(M.weapon_1,/item/apparel/shield/) && M.weapon_1.can_attack==0)
								s = M.weapon_1
							else
								if(M.weapon_2 && istype(M.weapon_2,/item/apparel/shield/) && M.weapon_2.can_attack==0)
									s = M.weapon_2

								else
									if(M.weapon_1)
										s = M.weapon_1
									if(M.weapon_2)
										s = M.weapon_2

							if(s.defense == 0)
								s.defense = round(s.damage/2)

							if(w.damage > s.defense)

								M.damage(w.damage - s.defense,src)
							view_sound('shield block.wav')
							stun(M,s.delay)

					if(hit)

						var/crit
						var/c = rand(w.swingspeed,100)

						if(c == 100)
							crit = 2
						else
							crit = 1

						if(istype(M,/Enemy))

							if(dir == M.dir && M:target <> src)

								crit = 4

						view_sound('sword hit.wav')

						var/obj/O = new/obj
						O.icon = Icon('skill.dmi',state = "",angle = rand(0,360))

						O.loc = M.loc
						O.py = M.py+3
						O.px = M.px-8
						O.layer = MOB_LAYER+10

						flick("slash",O)


						spawn(3)
							del(O)


						if(w.flash)
							var/zs = w.flash
							M.spark5(zs)


						if(w.poison)
							M.poisonme(src,w.poison/2,w.poison/5)
						if(w.stun)
							M.stun(src,w.stun)
						crit += attackbuff

						M.damage(w.damage,src,w.absorb_mana,w.absorb_hp,crit)



				if(w == weapon_1)
					w_angle = 120
					angle(angle)
					animate_sword(w)

				if(w == weapon_2)
					s_angle = -120
					angle(angle)
					animate_sword2(w)

mob
	var/attackbuff=0
	var/beserk=0

	proc
		spin(item/weapon/w)

			view_sound('swing.wav')
			for(var/liv/M in orange(1,src))
				if(M.team == team && w.damage>0) continue

				view_sound('sword hit.wav')
				M.damage(w.damage,src,w.absorb_mana,w.absorb_hp,2)

			if(w == weapon_1)
				w_angle = 360
				angle(angle)
				animate_sword(w)

			if(w == weapon_2)
				s_angle = -360
				angle(angle)
				animate_sword2(w)




		animate_sword(item/weapon/w)

			var/boost = 1
			if(has_epic("wind"))
				boost = 2
			if(w_angle>=-90)
				swinging_1 = 1
				w_angle -= (w.swingspeed+passive("Agility"))*boost
				angle(angle)
				spawn(world.tick_lag)
					animate_sword(w)
			else
				swinging_1 = 0
				w_angle = -45
				angle(angle)
				spawn(w.delay)
					w.can_attack=1

		animate_sword2(item/weapon/w)

			var/boost = 1
			if(has_epic("wind"))
				boost = 2
			if(s_angle<=90)
				swinging_2 = 1
				s_angle += (w.swingspeed+passive("Agility"))*boost
				angle(angle)
				spawn(world.tick_lag)
					animate_sword2(w)
			else
				swinging_2 = 0
				s_angle = 45
				angle(angle)
				spawn(w.delay)
					w.can_attack=1

		shield(item/shield)


	//		var/item/w
	//		if(shield == weapon_1 && weapon_2)
	//			w = weapon_2
	//		if(shield == weapon_2 && weapon_1)
	//			w = weapon_1

			if(shooting) return

			shielding=1

			if(weapon_2 == shield)
				s_angle=0
				w_angle=-90
//				if(weapon_1) weapon_1.can_attack=0
			if(weapon_1 == shield)
				s_angle=90
				w_angle=0
//				if(weapon_2) weapon_2.can_attack=0


			angle(angle)

		unshield(item/i)

			shielding=0

			s_angle=45
			w_angle=-45

			if(i)
				i.can_attack=1



			angle(angle)

		point(item/apparel/shield/shield)


			if(weapon_2 == shield)
				s_angle=0
				w_angle=-90

			if(weapon_1 == shield)
				s_angle=90
				w_angle=0

			if(istype(shield))
				if(weapon_2 == shield)

					if(weapon_1) weapon_1.can_attack=0

				if(weapon_1 == shield)

					if(weapon_2) weapon_2.can_attack=0

	//		can_attack=0



			angle(angle)

		unpoint(item/i)

			s_angle=45
			w_angle=-45


			if(i)
				i.can_attack=1


			angle(angle)

