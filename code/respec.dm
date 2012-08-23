respec_npc
	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=0

	icon_state = "person"
	name = "mind eraser"
	f_caption = "mind eraser - e"
	New()
		..()
		NameOverlay = new/obj
		NameOverlay.maptext_width = 64
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -24
		NameOverlay.maptext = "<font color = #F8F8F8 ><center>[name]"
		overlays += NameOverlay
	proc/talked_to(player/p)
		p.alerts("For 1000 gold, I can reset and refund all of your passive abilities for you.")

		if(!p) return
		switch(p.options("Reset your passives for 1000 gold?",list("yes","no")))
			if("yes")
				if(p)
					if(p.get_gold() >= 1000)

						p.add_gold(-1000)


						p.passives = list()
						p.belt = new()

						p.heropoints = length(p.completed_quests)

					else
						if(p)
							p.alerts("You don't have 1000 gold to pay me.")
