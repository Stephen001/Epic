
mob

	proc


		angle(a)


			angle = a
			icon_state = "[race] h"
			var/s = "[race] h"
			if(armor)
				s = armor.name

			mob2(s)



var/list/icon_cache = list()
item
	var
		orx=0
		ory=0
		rotate=0
		y_off=0
		x_off=0

proc
	Icon(file=null,state="null",angle=0,dir=SOUTH,frame=0,moving=0,ct = "0 0 0",origin_x=0,origin_y=0,rot_alter=0,y_off=0,x_off=0)//icon cache
		var/a = "iconsa [file]_[state]_[dir]_[frame]_[moving]_[angle]_[ct],[origin_x],[origin_y],[rot_alter],[y_off],[x_off]"

		if(icon_cache.Find(a))

			return icon_cache[a]
		else
			var/icon/I = icon(file,state,dir,frame,moving)

			if(origin_x || origin_y || rot_alter || y_off || x_off)

				if(origin_x || origin_y || rot_alter)
					I.Shift(WEST,8)

					if(origin_x)
						I.Shift(EAST,origin_x)
					if(origin_y)
						I.Shift(NORTH,origin_y)
					if(rot_alter)
						I.Turn(-rot_alter)

					I.Shift(EAST,8)

				if(y_off)
					I.Shift(NORTH,y_off)
				if(x_off)
					I.Shift(EAST,x_off)



			I.Turn(-angle)



			icon_cache+=a
			icon_cache[a] = fcopy_rsc(I)
			return icon_cache[a]



mob/var/w_overlays = list()
mob
	var
		swinging_1=0
		swinging_2=0
mob/proc

	mob2(sta)

		if(armor)
			icon = Icon(armor.icon,sta,angle)
		else
			icon = Icon('item.dmi',sta,angle)




		w_overlays = list()

		if(weapon_1)
			w_overlays += Icon(weapon_1.icon,weapon_1.icon_state,ca(w_angle),ct = "[weapon_1.cr] [weapon_1.cg] [weapon_1.cb]",origin_x=weapon_1.orx,origin_y=weapon_1.ory,rot_alter=weapon_1.rotate,y_off=weapon_1.y_off,x_off=weapon_1.x_off)
			if(swinging_1 && weapon_1.icon == 'item.dmi')
			//	world.log << "test"
				w_overlays += Icon('item.dmi',"swing",ca(w_angle),ct = "[weapon_1.cr] [weapon_1.cg] [weapon_1.cb]",origin_x=weapon_1.orx,origin_y=weapon_1.ory,rot_alter=weapon_1.rotate,y_off=weapon_1.y_off,x_off=weapon_1.x_off)


		for(var/item/I in vanity)
			w_overlays += Icon(I.icon,I.icon_state,angle,ct = "[I.cr] [I.cg] [I.cb]",origin_x=I.orx,origin_y=I.ory,rot_alter=I.rotate,y_off=I.y_off,x_off=I.x_off)
		if(weapon_2)
			w_overlays += Icon(weapon_2.icon,weapon_2.icon_state,ca(s_angle),ct = "[weapon_2.cr] [weapon_2.cg] [weapon_2.cb]",origin_x=weapon_2.orx,origin_y=weapon_2.ory,rot_alter=weapon_2.rotate,y_off=weapon_2.y_off,x_off=weapon_2.x_off)
			if(swinging_2 && weapon_2.icon == 'item.dmi')
				w_overlays += Icon('item.dmi',"swing 2",ca(s_angle),ct = "[weapon_2.cr] [weapon_2.cg] [weapon_2.cb]",origin_x=weapon_2.orx,origin_y=weapon_2.ory,rot_alter=weapon_2.rotate,y_off=weapon_2.y_off,x_off=weapon_2.x_off)



		underlays = null
		underlays += Icon('item.dmi',legs,dir2angle(dir))

	ca(an)

		an += angle

		if(an>360)
			an = abs(360-an)

		return an






cache
	var/list/cache_cont = list()

world

	New()
		..()

	//	reboot_wait()
		read_cache()



	Del()
		..()
		write_cache()


	proc



		write_cache()

			var/savefile/F2 = new("[world.name].guilds")

			var/guild_group/g = new/guild_group

			g.guilds = guilds

			g.Write(F2)

			var/savefile/F = new("[world.name].cache")

			var/cache/o = new/cache

			o.cache_cont = icon_cache

			o.Write(F)





		read_cache()


			var/savefile/F2 = new("[world.name].guilds")

			var/guild_group/g = new/guild_group

			g.Read(F2)

			guilds = g.guilds

			var/savefile/F = new("[world.name].cache")

			var/cache/o = new/cache

			o.Read(F)

			global.icon_cache = o.cache_cont




cache
	var/list/cache = list()

guild_group
	var/guilds = list()


var/cache/cache = new