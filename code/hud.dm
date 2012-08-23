





mob/var/item/book

HudObject
	maptext = ""
	slot


		var
			ability/skill
			numb




		MouseDrop(HudObject/slot/a)

			if(istype(a))
				var/n1 = null
				var/n2 = null

				if(skill)

					n2 = skill

				if(a.skill)

					n1 = a.skill


				skill = n1
				a.skill = n2


				update()
				a.update()

		proc/sets_ability(sk)
			var/X = text2path("/ability/[sk]")
			if(X) skill = new X
			else
				skill = null

		proc/update()

			var/icon/I = icon('hud slots.dmi')
			if(skill)
				var/icon/I2 = icon(skill.icon,skill.icon_state)
				I.Blend(I2,ICON_OVERLAY)
				mouse_drag_pointer = fcopy_rsc(I)

				if(skill.can_use==0)
					var/icon/I3 = fcopy_rsc(I)
					I.Blend(I3,ICON_MULTIPLY)
					I.Scale(32,24)

			icon = fcopy_rsc(I)


hotslot_bar
	parent_type = /HudGroup

	icon = 'hud slots.dmi'
	layer=101

	var
		HudObject/slot/slot_1
		HudObject/slot/slot_2
		HudObject/slot/slot_3
		HudObject/slot/slot_4
		HudObject/slot/slot_5

	__add_object(x, y, icon_state, txt, width, height, value, l = null, icon/I = null)

		// create a new object and set its position, including
		// the specified x,y and its base x,y
		var/HudObject/slot/h = new(src, icon, icon_state, value = value)

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


	proc/set_ability(num,skill,mob/m)
		m.abils[num] = skill
		switch(num)
			if(1)
				slot_1.sets_ability(skill)
			if(2)
				slot_2.sets_ability(skill)
			if(3)
				slot_3.sets_ability(skill)
			if(4)
				slot_4.sets_ability(skill)
			if(5)
				slot_5.sets_ability(skill)
		update()
	proc/update()
		slot_1.update()
		slot_2.update()
		slot_3.update()
		slot_4.update()
		slot_5.update()

	New()
		..()

		slot_1 = add(1*32,0*32+10,null)
		slot_2 = add(2*32,0*32+10,null)
		slot_3 = add(3*32,0*32+10,null)
		slot_4 = add(4*32,0*32+10,null)
		slot_5 = add(5*32,0*32+10,null)
		slot_1.overlays+="1"
		slot_1.numb = 1
		slot_2.overlays+="2"
		slot_2.numb = 2
		slot_3.overlays+="3"
		slot_3.numb = 3
		slot_4.overlays+="4"
		slot_4.numb = 4
		slot_5.overlays+="5"
		slot_5.numb = 5
		update()

mob
	var

		hotslot_bar/hbar = new()
		item_menu/hmenu = new()
		obj/interact_label = new()
		capt

	proc
		set_int(tx)
			if(!istext(tx) || capt == tx) return
			capt = tx
			interact_label.maptext = "<font color = #F8F8F8 >[tx]"
			interact_label.screen_loc = "10:[lentext(tx)],10"

		set_nm(tx)
			if(!istext(tx)) return

			hmenu.oname_label.maptext = "<font color = #F8F8F8 >[tx]"


	proc/shoot(string,ang = angle)
		var/X = text2path("/projectile/[string]")
		if(X)

			if(src)
				if(src.has_epic("fire"))
					if(findtext(string,"arrow")==0)
						new X(src,convert(ang-20))
						new X(src,convert(ang+20))


			new X(src,ang)

player
	var/obj/levele

	proc

		get_skills()

			var/l  = list()
			l+=hbar.slot_1.skill
			l+=hbar.slot_2.skill
			l+=hbar.slot_3.skill
			l+=hbar.slot_4.skill
			l+=hbar.slot_5.skill

			return l




		use_skill(num)
			switch(num)
				if(1)
					if(hbar.slot_1.skill)
						hbar.slot_1.skill.use(src)
				if(2)
					if(hbar.slot_2.skill)
						hbar.slot_2.skill.use(src)

				if(3)
					if(hbar.slot_3.skill)
						hbar.slot_3.skill.use(src)

				if(4)
					if(hbar.slot_4.skill)
						hbar.slot_4.skill.use(src)

				if(5)
					if(hbar.slot_5.skill)
						hbar.slot_5.skill.use(src)
			hbar.update()


		do_hud()

			hmenu = new(src)
			hbar = new(src)
			hp_bar = new(src)
			qmenu = new(src)

			qname = new/obj
			qname.maptext_height = 500
			qname.maptext_width = 500
			qname.maptext = {"<font color = #F8F8F8 ><p align = "right">Quests:"}
//			qname.screen_loc = "9:10,13:12"

			qname.layer = MOB_LAYER+30
			client.screen+=qname


			hp_bar.update(src)
			qmenu.update(src)


			interact_label = new/obj
			client.screen+=interact_label
			interact_label.maptext_width = 100
			interact_label.maptext_height=100
			interact_label.layer = MOB_LAYER+30
			interact_label.screen_loc = "10:10,10"

			hmenu.oname_label = new/obj

			client.screen+=hmenu.oname_label

			hmenu.oname_label.maptext_width = 300
			hmenu.oname_label.maptext_height=100
			hmenu.oname_label.layer = hmenu.layer+10

			hmenu.oname_label.screen_loc = "5,5"

			if(hmenu.visible)
				hmenu.oname_label.invisibility=0
			else
				hmenu.oname_label.invisibility=1

			hmenu.name_label = new/obj

			client.screen+=hmenu.name_label

			hmenu.name_label.maptext_width = 300
			hmenu.name_label.maptext_height=100
			hmenu.name_label.layer = hmenu.layer+10

			hmenu.name_label.screen_loc = "3,9:4"

			if(hmenu.visible)
				hmenu.name_label.invisibility=0
			else
				hmenu.name_label.invisibility=1





			hmenu.desctext = new/obj

			client.screen+=hmenu.desctext

			hmenu.desctext.maptext_width = 300
			hmenu.desctext.maptext_height=100
			hmenu.desctext.layer = hmenu.layer+10

			hmenu.desctext.screen_loc = "8,5:4"

			if(hmenu.visible)
				hmenu.desctext.invisibility=0
			else
				hmenu.desctext.invisibility=1



			question = new/obj
			question.maptext_width = 160
			question.maptext_height = 160
			question.maptext = ""
			question.screen_loc = "8:4,10"
			question.invisibility=1
			client.screen+=question
			question.layer = MOB_LAYER+100


			levele = new/obj
			levele.maptext_width = 300
			levele.maptext_height = 160
			levele.maptext = "<font color = #F8F8F8 >level [level]"
			levele.screen_loc = "2:4,15"
			client.screen+=levele
			levele.layer = MOB_LAYER+100

			spawn()
				hmenu.hide()

		del_hud()

			hmenu.hide()
			hbar.hide()
			hp_bar.hide()

			del(hmenu)
			del(hbar)
			del(hp_bar)
			del(interact_label)

