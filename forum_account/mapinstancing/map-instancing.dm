
var
	Maps/maps = new()

Maps
	var
		list/z = list()
		list/bases = list()
		list/file_bases = list()

	New()
		for(var/i = 1 to world.maxz)
			bases += 0

	proc
		load(filename)

			if(!fexists(filename))
				CRASH("The file '[filename]' does not exist.")

			var/savefile/f = new(filename)
			var/MapBase/base
			f >> base

			return base

		// create a MapBase for the z level (if we haven't already)
		// and create an instance of that base
		copy(map_z)

			// the argument to copy can be a z level or
			// a filename, if it's a filename we load the
			// MapBase from the file, then create an instance
			// of it
			if(istext(map_z))

				var/filename = map_z

				var/MapBase/base

				// if we've loaded it before, use the already-loaded one
				if(filename in file_bases)
					base = file_bases[filename]

				// otherwise we load it from disk
				else
					base = load(filename)

				// return a new instance of this base
				return base.make()

			var/MapBase/base = bases[map_z]

			// if we don't have a base for this z level, create one
			if(!base)
				base = new(map_z)
				bases[map_z] = base

			// create an instance of the base and return it
			return base.make()

		// makes a z level available for use
		clear(map_z)

			// if the z level is already available, do nothing
			if(map_z in z)
				return 0

			// otherwise, add it to the list of available z levels
			z += map_z
			return 1

		// return the next available z level, creating a new one if necessary
		get_z()
			if(z.len == 0)
				world.maxz += 1
				return world.maxz
			else
				var/next_z = z[1]
				z -= next_z

				return next_z

MapBase
	var
		// the z level the base map is on
		z

		// the size of the base map
		maxx
		maxy
		music
		// a 2D list of turf types
		list/turfs

		// a 2D list of area types for each turf
		list/areas

		// the list of objects placed on the map, for every
		// object three values are added to this list:
		//   the object's type path
		//   the object's x coordinate
		//   the object's y coordinate
		list/objects = list()

	New(map_z = -1)

		if(map_z == -1)
			return

		// if the argument is a z level we extract data from the map
		z = map_z

		for(var/x = 1 to world.maxx)
			var/turf/t = locate(x, 1, z)

			if(t)
				maxx = x
			else
				break

		for(var/y = 1 to world.maxy)
			var/turf/t = locate(1, y, z)

			if(t)
				maxy = y
			else
				break

		turfs = new(maxx, maxy)
		areas = new(maxx, maxy)

		for(var/x = 1 to maxx)
			for(var/y = 1 to maxy)
				var/turf/t = locate(x, y, z)
				turfs[x][y] = t.type
				if(t.has_music)
					music = t.music

				var/area/area = t.loc
				areas[x][y] = area.type

				for(var/atom/a in t)
					objects += a.type
					objects += a.x
					objects += a.y

	proc
		save(filename)
			var/savefile/f = new(filename)
			f << src

		// create a new instance of this map and return
		// a /Map object that represents it.
		make()

			var/Map/map = new(src)

			// find an available z value
			map.z = maps.get_z()

			// set all turfs on the new map
			for(var/x = 1 to world.maxx)
				for(var/y = 1 to world.maxy)
					if(x > maxx || y > maxy)
						var/turf/t = locate(x, y, map.z)
						t.icon = null
					else
						// remove existing objects on the map
						var/turf/t = locate(x, y, map.z)
						for(var/atom/movable/m in t)
							m.loc = null

						// make a new turf of the appropriate type
						var/turf_type = turfs[x][y]
						var/turf/new_turf = new turf_type(t)

						// set the area of the new turf
						var/area/a = locate(areas[x][y])
						a.contents += new_turf
						new_turf.music = music
						new_turf.has_music=1

			// populate the map with objects
			for(var/i = 1 to objects.len / 3)
				var/obj_type = objects[i * 3 - 2]
				var/obj_x = objects[i * 3 - 1]
				var/obj_y = objects[i * 3 - 0]

				map.objects += new obj_type(locate(obj_x, obj_y, map.z))

			return map
atom/var/dont_reset=0
atom/proc/reset_me()
turf
	dont_reset = 1
Map
	var
		z

		list/objects = list()

		MapBase/base

	New(MapBase/b)
		base = b

	proc
		// make this map's z level available for other maps to use
		free()
			maps.z += z
			del src

		// repopulate the map with objects that were initially there,
		// but have since been deleted
		repop()
			for(var/atom/movable/xw in objects)
				if(xw.dont_reset==0)
					del(xw)
				else
					if(ismob(xw))
						if(xw in active_mobs)
							if(xw:client) continue
							active_mobs -= xw
							xw:active=0
					xw.reset_me()


			for(var/i = 1 to objects.len)
				if(objects[i]) continue

				var/obj_type = base.objects[i * 3 - 2]
				var/obj_x = base.objects[i * 3 - 1]
				var/obj_y = base.objects[i * 3 - 0]

				objects[i] = new obj_type(locate(obj_x, obj_y, z))
