quest_npc
	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=0

	icon_state = "person"

	New()
		..()

		NameOverlay = new/obj
		NameOverlay.maptext_width = 128
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -16
		NameOverlay.pixel_x=-32
		NameOverlay.maptext = "<center><font color = #F8F8F8 >\[QUEST]<br>[name]"
		overlays += NameOverlay
		var/X = text2path("/quest/[qname]")

		quest = new X

	proc
		talked_to(player/m)

			if(m.live && m.client && m.confirmed_option)
				if(m.has_quest(quest))

					var/quest/q = m.has_quest(quest)
					if(q.complete)
						if(m.get_reward(q.reward,q))
							m.alerts("thanks, take this")


							m.heropoints++

							m.level++
							m.update_dungeons()
							m.levele.maptext = "<font color = #F8F8F8 >level [m.level] [m.class]"
							if(m.heropoints)
								m.levele.maptext = "<font color = #F8F8F8 >[m.levele.maptext] ([m.heropoints] hero points)"

							return
						else
							return
					m.alerts("complete my quest")

				else

					if(m.has_completed(quest))
						m.alerts("thanks bro")
						return
					else

						m.alerts("[quest.desc]")

						switch(m.options("[quest.name]"))
							if("yes")
								m.get_quest(quest.type)



	var
		quest/quest
		qname = ""

	technician
		qname = "kill_master_orc"


quest

	var
		desc
		name
		reward = list()
		complete=0

		qname

	proc
		complete(player/p)

			complete = 1


	//		p.get_reward(reward,src)




	kill_master_orc

		qname = "Reclaim the lab"

		name = "kill master orc"
		desc = "the orcs took my lab. if you get it back for me i'll give you something."
		reward = list("100","weapon/katana")

player

	var/quest/quests = list()
	var/quest/completed_quests = list()
	var/quest_info/qmenu = new()
	var/obj/qname

	kill(mob/m)

		for(var/quest/q in quests)

			if(!m.client && findtext(q.name,m.name) && findtext(q.name,"kill"))

				complete_quest("kill [m.name]")

	proc/get_reward(r = list(),quest/q)

		if(inv_count+length(r) <=25)

			quests-=q
			completed_quests+=q

			for(var/xs in r)

				if(text2num(xs) != null)

					add_gold(text2num(xs))


				else

					var/X = text2path("/item/[xs]")

					items += new X


		else

			src.alerts("need [length(r)] more inventory space")
			return 0
		qmenu.update(src)
		return 1

	proc/has_completed(quest/q)

		for(var/quest/q2 in completed_quests)

			if(q2.name == q.name)
				return q2

		return null

	proc/has_quest(quest/q)

		for(var/quest/q2 in quests)

			if(q2.name == q.name)
				return q2

		return null

	proc/get_quest(tx)

		quests += new tx
		qmenu.update(src)


	proc/complete_quest(tx)

		for(var/quest/q in quests)
			if(q.name == tx)
				q.complete(src)
		qmenu.update(src)



quest_info
	parent_type = /HudGroup

	icon = null
	layer=101

	var
		quest_display/displays = list()

	proc/update(player/p)

		var/display_list = list()

		for(var/quest/q in p.quests)

			if(q.complete)
				display_list += "TURN IN - [q.qname] "

			else
				display_list += "[q.qname]"

		p.qname.screen_loc = "3,14:-[((length(display_list)+1)*13)]"

		p.qname.maptext = {"<font color = #F8F8F8 ><p align = "right">Quests:<br>"}

		for(var/x in display_list)

			p.qname.maptext = "<font color = #F8F8F8 >[p.qname.maptext]<br>[x]"

quest_display

	parent_type = /obj
	maptext_width=100
	maptext_height = 20