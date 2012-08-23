
// File:    performance-demo\optimization.dm
// Library: Forum_account.PixelMovement
// Author:  Forum_account
//
// Contents:
//   This file handles keyboard input. It adds keyboard macros
//   This file contains a few things that can greatly improve the
//   demo's performance:
//
//   1. Instead of calling the movement proc for all mobs on every
//      tick, this file modifies the global movement loop to only
//      call the movement proc for active mobs. It also maintains a
//      list of active mobs. If a mob is within view of a client, it
//      is active. If a mob is not within view, it's deactivated. This
//      way we don't use CPU time performing the movements of mobs that
//      nobody can see anyway.
//
//   2. The bullet's movement proc has been greatly simplified. By
//      default the movement proc will call set_flags, gravity,
//      action, and a few other procs. This isn't necessary for bullets,
//      they just move each tick in the same direction.
//
//   You can run this demo with or without optimization.dm included.
//   The purpose is to run it without this file, see how high world.cpu
//   gets, then include the optimizations and run it again to see how
//   much lower world.cpu is.
//
//   For me, without optimization.dm the CPU usage varies from 39 to 63.
//   With optimization.dm it depends on how many shooters are on the screen.
//   With zero shooters active CPU usage is zero. With one shooter active
//   CPU usage is between 0 and 16. With two shooters active it's between
//   0 and 23.
//
//   You can also create mobs that are never active. For example, a stationary
//   NPC doesn't need to have pixel movement behavior, but by default its
//   movement proc will be called every tick. You can use this technique to
//   keep these mobs out of the active_mobs list, you can override the NPC's
//   movement proc to make it do nothing, or you can use objs instead of mobs
//   for stationary objects.

var
	list/active_mobs = list()

world
	movement()
		// by default the global movement loop will call
		// check_loc and movement for all mobs in the world.
		// This is often unnecessary, so instead we only call
		// these procs for active mobs.
		for(var/mob/m in active_mobs)
			m.check_loc()
			m.movement()

mob

	var
		// 0 or 1 to determine if the mob is active or not.
		active = 0

		// the time until the mob will check again if it should
		// deactivate.
		active_check = 3



	movement()

		// we never want to deactivate the client's mob
		if(!client)
			active_check -= 1

			// if it's time to do the deactivation check...
			if(active_check <= 0)

				// check if there's a nearby client
				var/deactivate = 1
				for(var/mob/m in oview(8,src))
					if(m.client)
						deactivate = 0
						break

				// if no clients are nearby, remove this mob
				// from the list of active mobs.
				if(deactivate)
					active = 0

					active_mobs -= src
					return

				// if we get to this point the mob will remain
				// active, so we want to check again in 40 ticks.
				active_check = 40

		..()

var/list/loadedZLevels = list()

player

	// When the player moves from one tile to another, check
	// for mobs that need to be activated.
	active=1
	New()
		..()

		spawn()
			active = 1
			active_mobs += src
	Move(turf/T)
		var/orz = z
		if(T)
			if(T.z <> z)
				density=0

				if(carrying)
					carrying.carried = null
					carrying.pixel_y -= 8
					carrying.layer = MOB_LAYER
					carrying = null

			loadZLevelCheck(T.z)
			. = ..()
			if(T.z <> orz)
				density = 1
			if(client)

				for(var/mob/m in orange(7,src))
					if(!m.active)

						active_mobs += m
						m.active = 1
				for(var/turf/T1 in orange(1,src))
					if(T1.activated==0)
						loadZLevel(z)


proc
	loadZLevelCheck(var/zl)

		if(loadedZLevels.len < zl)
			loadedZLevels.len = zl
		if(loadedZLevels[zl] == null) // Check if it was loaded already.
			loadZLevel(zl)

	loadZLevel(var/zl)
		for(var/turf/t in block( locate(1, 1, zl), locate(world.maxx, world.maxy, zl) ))
			if(!t.activated)
				t.activateme()

		loadedZLevels[zl] = 1 // So it won't be loaded again :D