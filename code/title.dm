gameclient
	parent_type = /mob

	move()
		return

	Move()
		return

	action()
		return

	invisibility=1


	Login()
		..()

		client.mouse_pointer_icon = 'mouse.dmi'

		play_music('title.ogg')


		if(has_file())

			loc = locate(/turf/title)
		else


			loc = locate(/turf/first_title)

	proc/option(t)

		if(t == "new")

			if(client)
				var/player/p = new/player
				spawn()
					if(client)
						client.focus=p
						client.mob = p


		//		p.fade()

		if(t == "load")
			var/player/m = new/player
			m.load=1
			spawn()
				if(client)
					client.focus=m
					client.mob = m

		//	m.fade()

turf

	first_title

	title

	title_image
		layer = 100
		icon = 'title.png'
	moon
		layer = 100
		icon = 'moon.png'
	moonloc


	titlestuff

		icon = 'title.dmi'


		layer=101

		var/option

		Click()
			if(istype(usr,/gameclient))
				var/gameclient/g = usr
				g.option(icon_state)

		load_game

			icon_state = "load"


		new_game

			icon_state = "new"

		big_new

			icon = 'big new.dmi'
			icon_state = "new"