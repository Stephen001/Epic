mob
	var/shooting=0
	var/shielding=0

	var/mouse_down=0

	var/angle=0
	var/w_angle=-45
	var/s_angle=45
	var/can_attack=1



	proc
		dir2angle(d)
			var/di = EAST
			var/turnangle = 0
			while(d <> turn(di,45*(++turnangle)))
			return turnangle*45

client

	show_popup_menus=0


	MouseDown(atom/a,turf/T,anything,var/params)
		if(!mob.live) return
		var/k = params2list(params)

		mob.mouse_down=1


		if(mob.menu_open==0)

			if(k["right"]=="1")

				if(mob.weapon_2)
					mob.weapon_2.down(mob,T)
				if(mob.weapon_1)
					mob.weapon_1.down2(mob,T)
			if(k["left"]=="1")

				if(mob.weapon_1)
					mob.weapon_1.down(mob,T)
				if(mob.weapon_2)
					mob.weapon_2.down2(mob,T)

			if(k["middle"]=="1")

				if(mob.armor && mob.armor.ability)
					mob.armor.ability.use(mob)
	MouseUp(anything,turf/T,anything,var/params)
		if(!mob.live) return
		var/k = params2list(params)

		mob.mouse_down=0

		if(mob.menu_open==0)
			if(k["right"]=="1")
				if(mob.weapon_2)
					mob.weapon_2.up(mob,T)
				if(mob.weapon_1)
					mob.weapon_1.up2(mob,T)
			if(k["left"]=="1")
				if(mob.weapon_1)
					mob.weapon_1.up(mob,T)
				if(mob.weapon_2)
					mob.weapon_2.up2(mob,T)
mob
	proc
		b1(turf/T,button=0)
			if(!src.live) return

			src.mouse_down=1

			if(src.menu_open==0)

				if(button==1)
					if(src.weapon_2)

						src.weapon_2.down(src,T)

					if(src.weapon_1)
						src.weapon_1.down2(src,T)
				if(button==2)

					if(src.weapon_1)
						src.weapon_1.down(src,T)
					if(src.weapon_2)

						src.weapon_2.down2(src,T)

		b2(turf/T,button=0)
			if(!src.live) return

			src.mouse_down=0

			if(src.menu_open==0)
				if(button==1)
					if(src.weapon_2)
						src.weapon_2.up(src,T)
					if(src.weapon_1)

						src.weapon_1.up2(src,T)
				if(button==2)
					if(src.weapon_1)
						src.weapon_1.up(src,T)
					if(src.weapon_2)

						src.weapon_2.up2(src,T)


// helper procs
proc/GetAngle(x1,y1,x2,y2)   // these can be pixel offsets or real x,y values
	var/dx = x2-x1
	var/dy = y2-y1
	if(!dy) return (dx>=0) ? 90 : 270
	. = arctan(dx/dy)  // angle offset from vertical, clockwise
	if(dy<0) return .+180
	if(dx<0) return .+360

//proc/arctan(m) return arcsin(m/sqrt(1+m*m))//STUPid bitch doesnt WORK

proc
	getMovableAngle( var/atom/movable/A, var/atom/movable/B )
		var/apx = A.x*world.icon_size+A.step_x
		var/apy = A.y*world.icon_size+A.step_y
		var/bpx = B.x*world.icon_size+B.step_x
		var/bpy = B.y*world.icon_size+B.step_y
		return GetAngle(apx, apy, bpx, bpy)






	arctan(n)
		return arccos(1 / sqrt(1 + n * n))

	arctan2(x, y)

		if(x > 0)
			if(y > 0)
				return arctan(y / x)
			else
				return -arctan(y / x)
		else if(x < 0)
			if(y >= 0)
				return 180 - arctan(y / x)
			else
				return arctan(y / x) - 180
		else
			if(y > 0)
				return 90
			else if(y < 0)
				return -90
			else
				return 0