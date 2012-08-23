
// a projectile is a type of mob that travels in a straight
// line until it hits a dense object (turf or mob).
atom/var/team=0
atom/var/half_wall = 0
mob
	proc

		move_angle(_angle,speed)

			angle = _angle

			vel_x = cos(angle) * speed
			vel_y = sin(angle) * speed


projectile

	parent_type = /mob

	icon = 'skill.dmi'
	density=0
	general_projectiles
		pwidth = 16
		pheight = 16
		pixel_x = -16
		pixel_y = -16



	heal
		icon_state = "heal"
		pwidth = 16
		pheight = 16
		pixel_x = -16
		pixel_y = -16
		damage = -10
		range = 3
	fire2
		icon_state = "fire"
		pwidth = 16
		pheight = 16
		pixel_x = -16
		pixel_y = -16
		range=5
		damage = 30
		explode_range=20
		sparkle = "fire"
	fire
		icon_state = "fire"
		pwidth = 16
		pheight = 16
		pixel_x = -16
		pixel_y = -16
		range=5
		damage = 5
		explode_range=20
		sparkle = "fire"
	ice
		icon_state = "ice"
		pwidth = 16
		pheight = 16
		pixel_x = -16
		pixel_y = -16
		range=6
		damage = 2
		explode_range=0
		sparkle = "ice"
		sparkle_time = 1

		speed=8

		stun_time = 10


	arrow
		icon_state = "arrow"
		pwidth = 16
		pheight = 16
		pixel_x = -16
		pixel_y = -16
		range=10
		speed=5
		damage=6
		explode_range=0
		sparkle = "dust"
		sparkle_time = 1
		must_turn=1

	cannon
		icon_state = "cannon"
		pwidth = 8
		pheight = 8
		pixel_x = -24
		pixel_y = -24
		range=8
		sparkle = "dust"

	var
		// how many pixels per tick the projectile will move
		speed = 10

		// the amount of damage dealt when the projectile hits a mob
		damage = 8
		stun = 0
		sparkle = null
		sparkle_time=2
		explode_range = 0
		range=10
		hit_turfs=1
		stun_time = 0

		must_turn=0
		// the mob that fired the projectile
		mob/owner

	// m is the mob firing the projectile, angle is the direction
	// the projectile will travel in
	slow_down()
		return
	var/set_vx
	var/set_vy
	action()
		..()
	//	vel_y = set_vy
	//	vel_x = set_vx

		for(var/target/t in orange(1,src))
			t.powered=1


	New(mob/m, angle)
		if(m)

			if(istype(m,/player))
				if(m:race == "grouhlian")
					damage+=2
			active = 1
			active_mobs += src

			pwidth = 7
			pheight = 7
			pixel_x = -15
			pixel_y = -15

			loc = get_step(m,m.dir)
			owner = m

			if(findtext(name,"arrow")==0)
				m.view_sound('magic_use.wav')
			// offset the bullet slightly to make it appear
			// where the player's gun is
			var/dx = 6 * cos(angle - m.pwidth)
			var/dy = 6 * sin(angle - m.pheight)

			set_pos(m.px - pixel_x - m.pwidth/2 + dx, m.py - pixel_y - m.pheight/2 + dy)

			vel_x = cos(angle) * speed
			set_vx = vel_x
			vel_y = sin(angle) * speed
			set_vy = vel_y

			if(must_turn)
				icon = Icon(icon,icon_state,angle)

			hit_turfs=1

			spawn(range)
				if(owner == m)
					loc = null
		else
			spawn()
				loc = null
	// make projectiles able to hit mobs

	proc/get_dirs(atom/m)
		var/l = list()
		l += dir
		l += turn(dir,45)
		l += turn(dir,-45)



	can_bump(mob/m)

		if(hit_turfs==0)
			return 0

		if(m.half_wall)
			return 0

		if(istype(m))

			if(m == owner || m.team == owner.team) return 0
			if(istype(m,/power_box/movable))
				return 0




		if(m.density==1)

			for(var/mob/m2 in orange(2,src))
				if(bounds_dist(m2,src)<=explode_range && m2.team <> owner.team)
					bmump(m2)

			bmump(m)
			loc=null

		if(m in locs)

			return m.density




		return ..()

	// hitting mobs calls their damage() proc
	bump(turf/m)
		if(istype(m))
			loc = null
		..()
	proc/bmump(atom/m)
		if(!owner || !m) return
		if(m == owner || m.team == owner.team && damage>0) return
		if(istype(m,/liv/))
			var/liv/l = m

			if(findtext(name,"arrow")==0)
				l.view_sound('magic_hit.wav')


			if(l.reflect)
				l.shoot(name)
				return
			else
				if(stun_time)
					l.stun(owner,stun_time)



				if(owner.orb("+50% projectile damage"))
					damage += (damage/2)

				if(owner.has_epic("fire"))
					if(findtext(name,"arrow")==0)
						damage = damage*2

				if(l.has_epic("water"))

					damage = damage/2

				l.damage(damage,owner)


				if(poison)

					l.poisonme(owner,poison/2,poison/5)

				if(stun)

					l.stun(owner,stun)

				if(src && sparkle && l )
					l.sparkles+=sparkle
					spawn(sparkle_time)
						if(l)
							l.sparkles-=sparkle

		if(istype(m,/target) || istype(m,/turret))
			m.powered=1
mob
	var/reflect=0


	// these are the different types of projectiles

