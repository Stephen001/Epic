
obj
	test_kraken
		icon = 'kraken.dmi'
	test_tentacle
		icon = 'big freaking tentacle.dmi'
		icon_state = "idle"
		t2
			dir = WEST

	test_balrog
		icon = 'necrospawn balrog.dmi'

		head
			icon_state = "middle"
		arm1
			icon_state = "arm 1"
		arm2
			icon_state = "arm 2"
	test_king

		icon = 'king at his throne.dmi'
mob

	final_boss_door
		icon = 'final boss door.dmi'

		pixel_x = -16

		f_caption = "finale - e"
		var/portal/dungeon_portals/final_boss/f = new()
		proc/activate(mob/m)

			switch(m.options("This is the final confrontation. You shall not return if you die here. Are you ready, hero?",list("yes","no")))
				if("yes")
					f.activate(m)


