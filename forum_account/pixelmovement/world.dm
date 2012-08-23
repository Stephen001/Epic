
// File:    world.dm
// Library: Forum_account.PixelMovement
// Author:  Forum_account
//
// Contents:
//   This file contains the global movement loop, some
//   other global things (variables), and other stuff.

var
	icon_width = -1
	icon_height = -1
	tick_count = 0

world
	tick_lag = 0.25

	proc
		// This is the global movement loop. It calls world.movement
		// every tick. If you want to change the behavior of the global
		// movement loop, override world.movement, not movement_loop.
		movement_loop()
			movement()
			spawn(world.tick_lag)
				movement_loop()

			tick_count += 1
			if(tick_count >= 1000)
				tick_count -= 1000

		movement()
			for(var/mob/m in world)
				m.check_loc()
				m.movement(tick_count)

		set_icon_size()
			if(isnum(world.icon_size))
				icon_width = world.icon_size
				icon_height = world.icon_size
			else
				var/p = findtext(world.icon_size, "x")
				icon_width = text2num(copytext(world.icon_size, 1, p))
				icon_height = text2num(copytext(world.icon_size, p + 1))

	New()
		world.set_icon_size()

		..()

		spawn(world.tick_lag)
			movement_loop()
