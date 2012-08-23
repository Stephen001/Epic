
mob
	var/item/weapon_1
	var/item/weapon_2
	var/inv_count=0

item
	parent_type = /obj
	icon = 'item.dmi'
	var/stackable=FALSE
	var/item_type = 0
	var/double=0
	var/sete=0
	proc

		down(mob/m,turf/T)

		up(mob/m,turf/T)


		down2(mob/m,turf/T)

		up2(mob/m,turf/T)


		effect(mob/m)

		use(mob/m,mouse)



			if(src in m.items || istype(src,/item/weapon/book/))

				if(m.bank && m.can_bank)
					if(length(m.bank.contents)<25)

						m.bank.items+=src
						m.items -= src

						if(m.weapon_1 == src)
							m.weapon_1 = null
						if(m.weapon_2 == src)
							m.weapon_2 = null
						if(m.armor == src)
							m.armor = null
						if(src in m.vanity)
							m.vanity -= src
						if(m.orb == src)
							m.orb = null
						if(m.idol == src)
							m.idol = null


						m.angle(m.angle)

						return

				if(src.item_type == 1)
					if(m.weapon_2 <> src && m.weapon_1 <> src)
						if(mouse == "right")

							if(m.weapon_1 && m.weapon_1.double)
								m.weapon_1 = null
							m.weapon_2 = src

							if(double)
								m.weapon_1 = null
						if(mouse == "left")
							if(m.weapon_2 && m.weapon_2.double)
								m.weapon_2 = null
							m.weapon_1 = src

							if(double)
								m.weapon_2 = null


					else
						if(m.weapon_2 == src)
							m.weapon_2 = null
						if(m.weapon_1 == src)
							m.weapon_1 = null
						if(m.orb == src)
							m.orb = null
						if(m.armor == src)
							m.armor = null
						if(m.idol == src)
							m.idol = null
						if(src in m.vanity)
							m.vanity -= src
					m.play_sound('die.wav')
					m.angle(m.angle)

				if(src.item_type == 2)
					effect(m)
				if(src.item_type == 3)

					if(src == m.armor)
						m.armor = null
						m.hp_max = 40 + (m.passive("Tank")*7)
						if(m.race == "orc")
							m.hp_max += 20
						m.mp_max = 20 + (m.passive("Powerhouse")*5)

					else
						m.armor = src
						m.hp_max = 40 + src.defense + (m.passive("Tank")*7)
						m.mp_max = 20 + src.mage + (m.passive("Powerhouse")*5)

					m.angle(m.angle)
					m.hp_bar.update(m)
				if(src.item_type == 4)

					if(m.weapon_2 <> src:book && m.weapon_1 <> src:book)
						if(mouse == "right")

							if(m.weapon_1 && m.weapon_1.double)
								m.weapon_1 = null
							m.weapon_2 = src:book

							if(double)
								m.weapon_1 = null
						if(mouse == "left")
							if(m.weapon_2 && m.weapon_2.double)
								m.weapon_2 = null
							m.weapon_1 = src:book

							if(double)
								m.weapon_2 = null


					else
						if(m.weapon_2 == src:book)
							m.weapon_2 = null
						if(m.weapon_1 == src:book)
							m.weapon_1 = null

					m.play_sound('die.wav')
					m.angle(m.angle)



				if(src.item_type == 5)
					if(src in m.vanity)
						m.vanity -= src
					else
						m.vanity += src
						m.angle(m.angle)
				if(src.item_type == 6)
					m.orb = src
				if(src.item_type == 7)
					m.idol = src


			else
				var/player/p = m
				if(p.belt)
					if(src in p.belt.items)
						var/passive_progressive/P5 = src
						if(m && m.confirmed_option && m.team <> m.key && p.heropoints && P5.lev < P5.levmax)
							switch(m.options("upgrade [P5]? ([P5.lev]/[P5.levmax])",list("yes","no")) )
								if("yes")
									if(m && m.client)

										P5.player_get(p,P5.lev+1)
										p.heropoints--
										p.levele.maptext = "<font color = #F8F8F8 >level [p.level]"
										if(p.heropoints)
											p.levele.maptext = "<font color = #F8F8F8 >[p.levele.maptext] ([p.heropoints] hero points)"

						return
				if(m.inv_count<25)
					if(src.item_type == 100)

						m.add_gold(src.price)
						m.inview.items-=src
					else

						if(istype(m.inview,/shopkeeper))

							if(m.inview.name == "pvp shop")
								if(m.pvppoints>src.price)

									m.pvppoints-=src.price

									var/X = src.type

									m.items += new X
									m.play_sound('get_item.wav')

									m.damage_number("you buy [src]")

								else

									m.damage_number("not enough pvp points")
									return
							else
								if(m.get_gold()>src.price)

									m.add_gold(-src.price)

									var/X = src.type

									m.items += new X
									m.play_sound('get_item.wav')
									m.damage_number("you buy [src]")

								else

									m.damage_number("not enough gold")
									return

						else
							m.inview.items -= src
							m.items += src
							m.play_sound('get_item.wav')
							if(istype(m.inview,/liv/))
								if(m.inview.weapon_1 == src)
									m.inview.weapon_1 = null
								if(m.inview.weapon_2 == src)
									m.inview.weapon_2 = null
								if(m.inview.armor == src)
									m.inview.armor = null
								if(src in m.inview.vanity)
									m.inview.vanity -= src
								if(m.inview.orb == src)
									m.inview.orb = null
								if(m.inview.idol == src)
									m.inview.idol = null
								m.inview.angle(m.inview.angle)
				else
					m.damage_number("inventory full")

			if(m.hmenu && m.inview && m.client)
				m.hmenu.update(m.inview,m)
				m.hp_bar.update(m)
			if(src in m.items)
				if(istype(m,/player))
					var/player/p = m
					for(var/quest/q in p.quests)

						if(m.client && findtext(q.name,src.name) && findtext(q.name,"find"))

							p.complete_quest("find [src.name]")


HudObject
	clip

		var/item/set_item
		var/grid_x
		var/grid_y
		var/obj/grizzle
		mouse_drag_pointer = 'mouse drag.dmi'
		mouse_over_pointer = 'mouse over.dmi'
		maptext_width = 32
		maptext_height = 32
		//Sorry I wasn't on yesterday ._. I passed out.
		//Sister was supposed to wake me up but she forgot to

		MouseDrag()

			if(set_item)
				set_item.drag(usr)
		MouseDrop(atom/a)

			if(set_item)
				set_item.drop(a,usr)

		MouseEntered()
			if(!istype(usr,/player)) return
			var/player/p = usr
			if(p.hmenu && p.hmenu.oname_label)
				if(set_item)
					if(p.hmenu.oname_label in p.client.screen)
						p.hmenu.oname_label.screen_loc = "[grid_x+1],[grid_y+3]"

						p.hmenu.desctext.maptext = "<font color = #F8F8F8 >[set_item.name]<br><br>[set_item.desc]"

				//		p.hmenu.desctext.maptext = "ADSSEHWEYWE"

						p.hmenu.oname_label.maptext = "<font color = #F8F8F8 >[set_item.ename][set_item.name] - [set_item.price][set_item.pl]"
				else
					if(icon_state == "trash can")


						p.hmenu.oname_label.screen_loc = "6,3"

						p.set_nm("drag here to sell")

					else

						if(icon_state == "view")

							p.hmenu.oname_label.screen_loc = "6,3"

							p.set_nm("drag here to view stats")
						else
							p.set_nm("")
				p.play_sound('dink.wav')
				p.hmenu.update(p.inview,p)
				overlays+=image('hud slots.dmi',icon_state="over")
		MouseExited()
			if(!istype(usr,/player)) return
			var/player/p = usr
			overlays=null
			if(p.hmenu && p.hmenu.oname_label)
				p.set_nm("")
				p.hmenu.update(p.inview,p)
client


	var/can_clickit=1
	Click(atom/a,turf/T,anything,params)
		if(can_clickit==0) return

		..()


		if(istype(a,/HudObject/clip))
			can_clickit=0
			spawn(0.1)
				can_clickit=1
			var/HudObject/clip/c = a
			if(c.icon_state == "trash can") return
			if(!c.set_item) return
			if(mob.mouse_down) return


			var/c2 = params2list(params)

			if(c2["right"] == "1")

				c.set_item.use(mob,"right")

			if(c2["left"] == "1")
				c.set_item.use(mob,"left")




item_menu
	parent_type = /HudGroup

	icon = 'hud slots.dmi'
	var/obj/name_label = null
	var/obj/desctext = new
	var/obj/oname_label = new
	var/HudObject/clip/trash_can = null
	var/HudObject/clip/eye = null
	layer=101

	__add_object(x, y, icon_state, txt, width, height, value, l = null, icon/I = null)

		// create a new object and set its position, including
		// the specified x,y and its base x,y
		var/HudObject/clip/h = new(src, icon, icon_state, value = value)

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

		HudObject/clip/buttons = list()

	New()
		..()




		var/y_size=5
		var/x_size=5

		while(y_size<>0)
			y_size--
			while(x_size<>0)
				x_size--
				var/HudObject/clip/a = add((x_size+1)*32,(y_size+3)*32,null)

				a.grid_x = x_size
				a.grid_y = y_size


				buttons += a


			x_size=5

		hide()



	proc/findbutton(xc,yc)

		for(var/HudObject/clip/c in buttons)

			if(c.grid_x == xc && c.grid_y == yc)
				return c
		return null

	show()
		..()
		if(name_label)
			name_label.invisibility=0
		if(oname_label)
			oname_label.invisibility=0
		if(desctext)
			desctext.invisibility=0
	//		desctext.maptext_width = 64
	//		desctext.maptext_height = 64
		for(var/HudObject/clip/c in buttons)
			if(c.grizzle)
				c.grizzle.invisibility=0

	hide()
		..()
		if(name_label)
			name_label.invisibility=2
		if(oname_label)
			oname_label.invisibility=2
		if(desctext)
			desctext.invisibility=2
			desctext.maptext = ""
		for(var/HudObject/clip/c in buttons)
			if(c.grizzle)
				c.grizzle.invisibility=2
	proc/update(mob/m,mob/m2)





		name_label.maptext = "<font color = #F8F8F8 >[m][m.itemname]"


		if(!trash_can && m == m2)
			trash_can = add(6*32,3*32,"trash can")

		if(m <> m2)
			del(trash_can)



		for(var/HudObject/clip/d in buttons)
			d.overlays=null
			d.set_item = null
			d.maptext=""
			if(d.grizzle)
				d.grizzle.maptext = ""
			if(d.invisibility==3)
				d.invisibility=0
		var/y_cell=4
		var/x_cell=0
		var/stacked_items = list()
		var/item_count=0
		for(var/item/I in m.items)
			var/stacked=0

			if(I.stackable)

				for(var/item/I2 in m.items)
					if(I2.name == I.name)

						for(var/HudObject/clip/c in buttons)
							if(c.set_item == I2)
								stacked=1
								stacked_items[I2] += 1
								goto stacka


						stacked_items+=I
						item_count--
						stacked=0
			stacka
			if(stacked==0)
				item_count++
				if(x_cell<>5)
					var/HudObject/clip/c = findbutton(x_cell,y_cell)
					if(c)
						if(I.item_type <> 3)
							c.overlays+=image(icon = I.icon,icon_state = I.icon_state,pixel_x = -32+I.movex,pixel_y=-18)
							if(I.item_type == 4)
								c.overlays+=image(icon = 'skill.dmi',icon_state = I.name,pixel_y=-2)
						else
							c.overlays+=image(icon = I.icon,icon_state = I.icon_state,pixel_x = -16,pixel_y=-18)
						c.set_item = I

						if(istype(I,/item/book))
							if(I:book == m.weapon_1)
								c.overlays += "l"
							if(I:book == m.weapon_2)
								c.overlays += "r"

						if(I == m.weapon_1)
							c.overlays+="l"
							if(I.double)
								c.overlays += "r"
						if(I == m.weapon_2)
							c.overlays+="r"
							if(I.double)
								c.overlays += "l"

						if(I == m.armor)
							c.overlays += "a"
						if(I in m.vanity)
							c.overlays += "v"
						if(I == m.orb)
							c.overlays += "o"
						if(I == m.idol)
							c.overlays += "i"
						x_cell++


				else
					x_cell=0
					y_cell--
					var/HudObject/clip/c = findbutton(x_cell,y_cell)
					if(c)
						if(I.item_type <> 3)
							c.overlays+=image(icon = I.icon,icon_state = I.icon_state,pixel_x = -32+I.movex,pixel_y=-18)
							if(I.item_type == 4)
								c.overlays+=image(icon = 'skill.dmi',icon_state = I.name,pixel_y=-2)
						else
							c.overlays+=image(icon = I.icon,icon_state = I.icon_state,pixel_x = -16,pixel_y=-18)
						c.set_item = I


						if(istype(I,/item/book))
							if(I:book == m.weapon_1)
								c.overlays += "l"
							if(I:book == m.weapon_2)
								c.overlays += "r"

						if(I == m.weapon_1)
							c.overlays+="l"
							if(I.double)
								c.overlays += "r"
						if(I == m.weapon_2)
							c.overlays+="r"
							if(I.double)
								c.overlays += "l"


						if(I == m.armor)
							c.overlays += "a"
						if(I in m.vanity)
							c.overlays += "v"
						if(I == m.orb)
							c.overlays += "o"
						if(I == m.idol)
							c.overlays += "i"
						x_cell++

		for(var/item/I in stacked_items)

			for(var/HudObject/clip/c in buttons)

				if(c.set_item == I)
					item_count++
					var/intz = stacked_items[I]

					if(intz)
						c.maptext = "<font color = #F8F8F8 >[(intz+1)-I.sete]"

		for(var/item/gold/g in m.items)

			item_count--

			for(var/HudObject/clip/c in buttons)

				if(c.set_item == g)

					c.maptext = "<font color = #F8F8F8 >[g.price]"

		for(var/passive_progressive/g in m.items)

			item_count--

			for(var/HudObject/clip/c in buttons)


				if(c.set_item == g)

					if(c.grizzle)
			//			if(!c.grizzle in c.overlays)
			//				c.overlays+=c.grizzle
						c.grizzle.maptext = "<font color = #F8F8F8 >[g.lev]"


					else
						var/obj/O = new
		//				c.overlays+=O
						m2.client.screen+=O
						O.screen_loc = c.screen_loc
						O.maptext_width = c.maptext_width
						O.maptext_height = c.maptext_height
						O.pixel_y = 0
						O.pixel_x = c.pixel_x

						O.layer=c.layer+10
						c.grizzle = O
						c.grizzle.maptext = "<font color = #F8F8F8 ><br><center>[g.lev]"



		for(var/item/weapon/wire/w in m.items)
			item_count--

		for(var/item/weapon/wire/w in m.items)
			item_count++
			break


		for(var/item/gold/g in m.items)
			item_count++
			break



		if(m == m2)
			m.inv_count = item_count
		if(istype(m,/skill_belt))
			for(var/HudObject/clip/c in buttons)
				if(!c.set_item)
					c.invisibility=3



mob



	var/item/items = list()
	proc/add_item(item/i)
		items+=i
		if(hmenu && inview && client)
			hmenu.update(inview,src)





