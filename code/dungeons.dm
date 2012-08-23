
dungeon

	var/z=0
	var/start_loc = list(5,5)
	var/solo=0
	var/level_req = 0
//	parent_type = /obj
	dungeon_one
		start_loc = list(26,10)
		z=2
		solo=1

	dungeon_two
		start_loc = list(13,10)
		z=4
		level_req = 2

	dungeon_three
		start_loc = list(18,21)
		z=5
		level_req = 3

	dungeon_four
		start_loc = list(13,6)
		z=6
		level_req = 4

	dungeon_five
		start_loc = list(43,40)
		z=9
		level_req = 5

	dungeon_six
		start_loc = list(21,12)
		z=10
		level_req = 7

	dungeon_seven
		start_loc = list(41,7)
		z=11
		level_req = 9

	dungeon_eight
		start_loc = list(11,15)
		z=12
		level_req = 10
	dungeon_nine
		start_loc = list(24,8)
		z=15
		level_req = 12
	dungeon_ten
		start_loc = list(23,17)
		z=16
		level_req = 14
	dungeon_eleven
		start_loc = list(5,9)
		z=17
		level_req = 16
	dungeon_twelve
		start_loc = list(7,4)
		z=18
		level_req = 18
	dungeon_thirteen
		start_loc = list(22,16)
		z=20
		level_req = 20
	dungeon_fourteen
		start_loc = list(24,47)
		z=22
		level_req = 22
	dungeon_fifteen
		start_loc = list(23,3)
		z=23
		level_req = 24
	dungeon_sixteen
		start_loc = list(24,13)
		z=24
		level_req = 26
	dungeon_seventeen
		start_loc = list(27,5)
		z=27
		level_req = 28
	dungeon_eighteen
		start_loc = list(27,7)
		z=28
		level_req = 30
	dungeon_nineteen
		start_loc = list(18,4)
		z=29
		level_req = 32
	dungeon_twenty
		start_loc = list(23,20)
		z=30
		level_req = 34
	dungeon_twentyone
		start_loc = list(23,7)
		z=32
		level_req = 36
	dungeon_twentytwo
		start_loc = list(24,40)
		z=33
		level_req = 38
	dungeon_twentythree
		start_loc = list(4,43)
		z=34
		level_req = 40
	dungeon_twentyfour
		start_loc = list(14,49)
		z=35
		level_req = 42
	side_dungeon_one
		start_loc = list(4,25)
		z=38
		level_req=6
	side_dungeon_two
		start_loc = list(35,4)
		z=39
		level_req=13
	side_dungeon_three
		start_loc = list()
		z=40
		level_req=20
	side_dungeon_four
		start_loc = list(16,4)
		z=37
		level_req=32
	side_dungeon_boss
		start_loc = list(26,13)
		z = 40
		level_req = 40
	side_dungeon_rabbits
		start_loc = list(18,8)
		z = 41
		level_req = 25
	dungeon_twentyfive
		start_loc = list(23,2)
		z=42
		level_req = 44
	dungeon_twentysix
		start_loc = list(23,2)
		z=43
		level_req = 46
	dungeon_twentyseven
		start_loc = list(23,2)
		z=44
		level_req = 48
	dungeon_twentyeight
		start_loc = list(16,34)
		z=45
		level_req = 50
	dungeon_twentynine
		start_loc = list(3,2)
		z=49
		level_req = 52
	dungeon_thirty
		start_loc = list(33,18)
		z=51
		level_req = 54
	dungeon_thirtyone
		start_loc = list(18,11)
		z=52
		level_req = 56
	dungeon_thirtytwo
		start_loc = list(15,36)
		z=54
		level_req = 58
	sirius
		start_loc = list(21,3)
		z=47
		level_req = 46
	laserdog
		start_loc = list(25,16)
		z = 50
		level_req = 50
	portal
		start_loc = list(8,6)
		z = 53
		level_req = 51
	final_boss
		start_loc = list(3,4)
		z = 56
		level_req = 60
turf

	PvP_area
		stepped_on(player/p)
			if(istype(p) && p.client)
				p.team = p.key

//23 1 42 23 1 43 23 1 44


player
	proc/warp_out()


		if(dungeon)

			var/T = block(locate(1,1,z),locate(50,50,z))

			var/portal/dungeon_exits/p = null

			for(var/turf/X in T)

				for(var/portal/dungeon_exits/P in X)

					p = P

					break

			if(!p) return

			if(p.name in levelcomplete)


				switch(options("warp out of this dungeon?",list("yes","no")) )
					if("yes")

						p.activate(src)
mob
	proc/story(msg)

		src << output("<hr>[msg]<hr>","story.output")
		winset(src,"default.storychild","right = 'story'")
		winset(src,"default.storychild","is-visible=true")

	verb
		exitstory()
			if(confirmed_option==0)
				confirmed_option=1
			winset(src,"default.storychild","is-visible=false")
	proc/alertses(msg)

		winset(src,"alert.label","text = \"[msg]\"")
		winset(src,"default.storychild","right = 'alert'")
		winset(src,"default.storychild","is-visible=true")

		confirmed_option=0
		while(confirmed_option==0)
			sleep(1)


player
	proc/update_dungeons()
		if(!client) return
		for(var/portal/dungeon_portals/p in world)
			client.images -= p.vimg
			client.images -= p.vimg2

			if(p.name in levelcomplete && p.vimg in client.images)

				client.images -= p.vimg
				client.images += p.vimg2

				continue

			if(p.name in levelcomplete)

				client.images += p.vimg2
				continue
			else
				if(p.vimg2 in client.images)
					client.images -= p.vimg2

			if(p.D.level_req <= level)
				client.images += p.vimg
				continue
			else
				if(p.vimg in client.images)
					client.images -= p.vimg


portal

	PvP_arena
		icon_state = "dungeon portal"
		activate(player/m)
			if(istype(m))
				m.damage_number("PVP Zone")
				m.x += src.xp
				m.y += src.yp
				m.step_x = 0
				m.step_y = 0

				spawn()
					if(m.companion)
						m.summon_companion()

		var/xp
		var/yp
		north
			yp=2
		east
			xp=2
		south
			yp=-2
		west
			xp=-2


	PvP_portal
		icon_state = "dungeon portal"
		New()
			..()
			var/obj/O = new/obj
			O.pixel_y = 8
			O.layer = MOB_LAYER
			O.loc = src.loc
			O.maptext_height = 32
			O.maptext_width = 32
			O.maptext = "<font color = #F8F8F8 ><center>PVP"
		activate(player/m)
			if(m.level >= 10)

				m.loc = locate("PvP arena")
			else
				m.damage_number("must be level 10")
	PvP_portal_exit

		activate(player/m)
			m.team = 1
			m << "You are no longer in a PvP zone"
			m.loc = locate(m.respawn)
			m.save()


	dungeon_portals
		id=1
		icon_state = "dungeon portal"
		var/dungeon/D

		var/side = 0

		var/vimg
		var/vimg2
		New()
			..()
			var/turf/T = loc
			if(T)
				T.tag = name

			vimg = image('turf.dmi',icon_state = "darrow",loc = T,pixel_y = 24)

			vimg2 = image('turf.dmi',icon_state = "varrow",loc = T,pixel_y = 24)

			if(side)
				icon_state = "green dungeon portal"

			spawn()
				if(D && D.level_req)
					var/obj/O = new/obj
					O.pixel_y = 8
					O.layer = MOB_LAYER
					O.loc = src.loc
					O.maptext_height = 32
					O.maptext_width = 32
					O.maptext = "<font color = #F8F8F8 ><center>[D.level_req]"

		dungeon_one
			D = new/dungeon/dungeon_one
		dungeon_two
			D = new/dungeon/dungeon_two
		dungeon_three
			D = new/dungeon/dungeon_three
		dungeon_four
			D = new/dungeon/dungeon_four
		dungeon_foure
			D = new/dungeon/dungeon_four
		dungeon_five
			D = new/dungeon/dungeon_five
		dungeon_six
			D = new/dungeon/dungeon_six
		dungeon_seven
			D = new/dungeon/dungeon_seven
		dungeon_eight
			D = new/dungeon/dungeon_eight
		dungeon_eighte
			D = new/dungeon/dungeon_eight
		dungeon_nine
			D = new/dungeon/dungeon_nine
		dungeon_ten
			D = new/dungeon/dungeon_ten
		dungeon_eleven
			D = new/dungeon/dungeon_eleven
		dungeon_twelve
			D = new/dungeon/dungeon_twelve
		dungeon_twelvee
			D = new/dungeon/dungeon_twelve
		dungeon_thirteen
			D = new/dungeon/dungeon_thirteen
		dungeon_fourteen
			D = new/dungeon/dungeon_fourteen
		dungeon_fifteen
			D = new/dungeon/dungeon_fifteen
		dungeon_sixteeen
			D = new/dungeon/dungeon_sixteen
		dungeon_sixteen
			D = new/dungeon/dungeon_sixteen
		dungeon_seventeen
			D = new/dungeon/dungeon_seventeen
		dungeon_eighteen
			D = new/dungeon/dungeon_eighteen
		dungeon_nineteen
			D = new/dungeon/dungeon_nineteen
		dungeon_twenty
			D = new/dungeon/dungeon_twenty
		dungeon_twentye
			D = new/dungeon/dungeon_twenty
		dungeon_twentyone
			D = new/dungeon/dungeon_twentyone
		dungeon_twentytwo
			D = new/dungeon/dungeon_twentytwo
		dungeon_twentythree
			D = new/dungeon/dungeon_twentythree
		dungeon_twentyfour
			D = new/dungeon/dungeon_twentyfour
		dungeon_twentyfoure
			D = new/dungeon/dungeon_twentyfour
		side_dungeon_one
			D = new/dungeon/side_dungeon_one
			side=1
		side_dungeon_two
			D = new/dungeon/side_dungeon_two
			side=1
		side_dungeon_four
			D = new/dungeon/side_dungeon_four
			side=1
		side_dungeon_boss
			D = new/dungeon/side_dungeon_boss
			side=1
		side_dungeon_rabbits
			D = new/dungeon/side_dungeon_rabbits
			side=1

		secret

			D = new/dungeon/side_dungeon_rabbits
			side=1
		portal

			D = new/dungeon/portal
			side=1

		dungeon_twentyfive
			D = new/dungeon/dungeon_twentyfive
		dungeon_twentysix
			D = new/dungeon/dungeon_twentysix
		dungeon_twentyseven
			D = new/dungeon/dungeon_twentyseven
		dungeon_twentyeight
			D = new/dungeon/dungeon_twentyeight
		dungeon_twentyeighte
			D = new/dungeon/dungeon_twentyeight
		dungeon_twentynine
			D = new/dungeon/dungeon_twentynine
		dungeon_thirty
			D = new/dungeon/dungeon_thirty
		dungeon_thirtyone
			D = new/dungeon/dungeon_thirtyone
		dungeon_thirtytwo
			D = new/dungeon/dungeon_thirtytwo
		dungeon_thirtytwoe
			D = new/dungeon/dungeon_thirtytwo
		sirius
			D = new/dungeon/sirius
			side=1
		laserdog
			D = new/dungeon/laserdog
			side=1
		final_boss
			D = new/dungeon/final_boss

		activate(mob/m)


			m.enter_dungeon(D)


	dungeon_exits
		id=-1
		var/dname
		var/fourth=null
		var/side = 0
		var/story
		dungeon_one
			dname = "The Dark Cave"
			story = "As the hero of your village, you adventured into the dark cave and angered a pack of orcs.<br><br><b>You have completed your first dungeon!</b><br><br> This is just a taste of the many more adventures to come. The second dungeon is indicated by the portal with the number 2 on it!"
		dungeon_two
			dname = "Grizzly Grove"
			story = "The orcs attacked your forest, and you thwarted their army."
		dungeon_three
			dname = "Abandoned Power Plant"
			story = "You went into the power plant taken over by the orcs and destroyed their leader in the name of your village."
		dungeon_foure
			dname = "The Orc Fortress"
			fourth="first town"
			story = "After being angered by the recent orc attacks, you discovered the orc fortress and slayed their greatest warrior. You saved your village from the orcs."
		dungeon_five
			dname = "The Shady Forest"
			story = "You went into the elf camp and destroyed all you saw. The dark elves seem to be building an army."
		dungeon_six
			dname = "Castle of Darkness"
			story = "You discovered the dark elf castle and killed their strongest warrior. This will help the light elves in the war, and the prisoners were saved."
		dungeon_seven
			dname = "Shadowspear Mine"
			story = "You went into the mine and found the elf traitor and left it with his ugly head mounted on a stick."
		dungeon_eighte
			dname = "Blood Stream Woods"
			fourth= "Rossor"
			story = "You followed the trail of the dark elves into the forest and found that they were building a new army with the orc leader. You enter the dwarven or Rossor, ready to hunt down the heretics."
		secret
			dname = "Secret :P"
			fourth = "buny buny buny buny buny buny"
			story = "WHAT THE F-"
			invisibility=2
		dungeon_nine
			dname = "Drake's Breath Volcano"
			story = "You found the dwarven traitors and slayed the leader of the mine. The elven slaves are free and a strange cryptic ruin inside the mine spoke of a great monster who could be summoned with a spell found only in ancient dwarven spellbooks."
		dungeon_ten
			dname = "The Dwarven Annals"
			story = "You tracked down the dwarven renegades and found them burning down the great ancient library. They fled before destroying it, but managed to steal ancient texts about a great dragon."
		dungeon_eleven
			dname = "The Desert of Doom"
			story = "Having heard stories of dwarven soldiers not returning from the desert, you trekked across the sands hoping to find the dwarven traitors. They were found digging for some strange stone which they managed to escape with, but you were able to kill their sand beast and make the desert safe once more."
		dungeon_twelvee
			dname = "The Summoning of the Dragon"
			fourth = "Grouhl"
			story = "The dwarves, dark elves, and orcs culminated together and formed a starnge cult. They summoned a great dragon so that they could make armor and weapons from its coat to provide for a powerful army. You thwarted their efforts, saving the lands and slaying the dragon."
		dungeon_thirteen
			dname = "The Marshes of Malice"
			story = "You were told to go into the swamp because it was rumoured to be the source of a strange disease that was killing Grouhl's villagers. You slayed the swamp beast, and now you must stop the disease from spreading further."
		dungeon_fourteen
			dname = "The Ghost Town"
			story = "The disease turned an entire town of people into violent and mindless zombies. You reclaimed the town, and killed their leader, Jones."

		dungeon_fifteen
			dname = "The Zombie Laboratory"
			story = "You found a strange laboratory created by the humans, and discovered it was being used to create the zombie virus. Luckily, you destroyed the scientists and burned the laboratory to the ground. You found notes speaking of a Plague Demon in the Great Labyrinth that the disease was being procured from, and now you must destroy it."


		dungeon_sixteeen
			dname = "The Great Labyrinth"
			fourth = "Huzza"
			story = "You went into the labyrinth and killed the plague demon and its worshippers. The zombie virus will no longer spread and the people of Grouhl will be safe. However, you were unable to find a way out and ended up in the strange town of Huzza."

		dungeon_seventeen
			dname = "Temple of the Zephyr"
			story = "Hearing stories about the Wind God and his worshippers suddenly becoming violent, you went into the temple, pacified the god, and discovered dark elves who were angering the god."
		dungeon_eighteen
			dname = "Temple of the Raindrop"
			story = "You calmed down the water god, and found that it was also being angered by the dark elves."
		dungeon_nineteen
			dname = "Temple of the Ember"
			story = "The god of fire was enraged by the behaviors of the other gods, but you were able to calm him down and warn him of the dark elves. He kneeled before you as the hero and promised to keep his temple safe."
		dungeon_twentye
			dname = "Temple of the Apocalypse"
			fourth = "The Underlife"
			story = "The Chaos God has become extremely upset by the imbalance of chaos in the world. Mankind has disturbed this fragile equilibrium and the Gods can no longer control it. The Chaos god has lived with this sad reality for a long time, however when the Dark Elves tried to control him he was finally pushed over the edge. He killed you, sending you to the Underlife and promising that he would destroy all forms of life in the world by whatever means possible."
		dungeon_twentyone
			dname = "The Demon Trials"
			story = "Keeping a low profile, you go through the Demon Trials to learn the ways of the demons and discover who you must destroy in order to return to the surface."
		dungeon_twentytwo
			dname = "Purgatory"
			story = "You enter the lands of Purgatory tracing the Demon King's trail and find that angels are being corrupted into terrible demons."
		dungeon_twentythree
			dname = "Pain"
			story = "The lands of Pain were filled with monsters and demons and you regettingly had to slay the corrupted angels within. You destroyed the army they were building to bring to the surface and discovered the location of the Demon King, Blazekid."

		dungeon_twentyfoure
			dname = "Temple of Peace"
			fourth = "Gallax"
			story = "You slayed the demon king Blazekid, the child of the flame. You used the power you gained by defeating him to return to the surface. Time in the Underlife, however, is not the same as time spent in the Overworld. You returned to a strange and chaotic future."

		side_dungeon_one
			dname = "Rat-infested Cave"
			side=1
			story = "You traveled into the cave with the intention of slaying the wolfs who protected the thieving rats. To your surprise they weren't protecting the rats because they chose to, but because the rats were collecting food for the chefs! Now that the chefs have been taken care of the rat and wolf infestation should be gone for good."
		side_dungeon_two
			dname = "Amnesia Mine"
			side = 1
			story = "You heard stories of a mine in which people would enter and come back months later not knowing anything about themselves. This was an old folk myth, but as you journeyed deeper into the mine and started losing your memory you began to realize that this story may have been a reality and that you were living it. You fought strange monsters inside, and barely escaped with your life."
		side_dungeon_four
			dname = "Palace of Corruption"
			side=1
			story = "You traveled to the Palace of Corruption to put an end to the rampage. Little did you know, this was not the source of it. Upon reaching the end of the palace you encountered a Berserker and found out where he thinks the source of corruption is. Now the question is: Will you be turned to the source of the corruption, or just another dead end?"

		side_dungeon_boss
			side = 1
			dname = "Remnants of the Empire"
			story = "You discovered an old demon reawakened by the angels who once ruled a great empire. Luckily you, as the hero, arrived just in time to stop him from bringing havoc to the lands and trying to claim his empire once more."
		side_dungeon_rabbits
			side = 1
			dname = "The Rabbit Temple"
			story = "You entered a temple and killed some rabbits. How do you feel, jerk?"
		dungeon_twentyfive
			dname = "Space Mine"
			story = "You enter the mine only to find that the miners have been murdered."
		dungeon_twentysix
			dname = "Alien Ship"
			story = "You board the alien ship to kick them off your ship."
		dungeon_twentyseven
			dname = "Call from the Past"
			story = "You find yourself taken back through time to a strange temple. A magical light leads you out of the temple and back to Gallax. It melts into the floor in the captain's chamber, revealing a portal through time to confront the source of the chaos."
		dungeon_twentyeighte
			dname = "Timeshatter"
			fourth = "Clockwerk"
			story = "You entered the Timeshatter, a dimension where time itself seems to hold no power. The God of Time has been corrupted by the evils of the raging Chaos God. You were able to calm the God of Time, but he could offer you no help. The Chaos God stole his power and plans to use it to wipe out all life on the planet so that it can be recreated- He wishes to reset time itself. The Chaos God hides within the great city of Clockwerk, the God of Time's home. You go to Clockwerk and hope to find the Chaos God and destroy him."
		dungeon_twentynine
			dname = "The Engine of Time"
			story = "In order to access the Tower of Time within Clockwerk, you have to first disable the three defense units set up within the Great Clock's inner workings. The first one was set up in the Engine of Time, and you disabled it. Now you must go into the Records of All History to find the next magical defensive ward."
		dungeon_thirty
			dname = "The Halls of History"
			story = "The second line of defense preventing you from accessing the Tower of Time was in the Halls of History. When you destroyed it you discovered the location from which Clockwerk was breached by the Chaos God. Markings on the walls suggest that the final protective ward is in Clockwerk's Sacred Upperparts."
		dungeon_thirtyone
			dname = "The Sacred Upperparts"
			story = "Now that the final line of defense is destroyed, you can access the great Tower of Time to confront the Chaos God and save the universe."
		dungeon_thirtytwoe
			dname = "Tower of Time"
			story = "You scaled the grand Tower of Time, and observed the inner workings of the universe. At the end, you confronted the Clockturne- Previously the clock upon which all of the universe had relied on- and defeated it. The Chaos God corrupted the great Clock so that he could control it as he did the God of Time. The fabric of the universe is shattered to pieces, and you entered a rift that you knew would bring you to the Chaos God. Now, at the Spine of the Universe, you prepare yourself for the final confrontation. Will you get to him in time? Or is time not on your side?"
			fourth = "Spine of the Universe"
		sirius
			dname = "Sirius"
			story = "You boarded the lost Sirius Starship and discovered the soldiers were all taken over by a strange virus while in hibernation which caused them to become zombie-like monsters. You destroyed them all, and then blew up the ship so that the glitch could not spread any further."
			side=1
		laserdog
			dname = "sweet bro and hella jeff fight octagons byond"
			story = "soon you will be able to defeat octogons and save your land..."
			side=1
		portal
			dname = "Wormhole Laboratories"
			story = "You were incapacitated in a strange part of Clockwerk and woke up in a strange building. A strange voice led you through puzzling chambers. At the end, you arrived at a fiery pit with a smoldering table in its center. The cake promised by the mysterious voice was lie. Oh yeah, you woke up in Clockwerk after entering the pit of fire and blacking out. Still alive."
			side=1
		final_boss
			dname = "The Epic Finale"
			story = "It's over."
			fourth = "Forever's Respite"


		New()
			..()
			tag="[name] exit"

		activate(mob/m)
			if(m.dungeon)
				var/craplist = list()
				for(var/player/M in m.party)
					if(M in craplist) return
					if(M.dungeon)

						craplist += M

						M.can_dothat = 0
						m.chatbox("<b>[M] completed [src.dname]</b>")

						var/ss = story
						if(src.side == 0)
							if(src.name in M.levelcomplete)
								M.levele.maptext = "<font color = #F8F8F8 >level [M.level]"
							else
								M.levelcomplete+=src.name
								M.level++
								M.levele.maptext = "<font color = #F8F8F8 >level [M.level]"

						M.update_dungeons()

						M.loc = locate("[name]")

						if(fourth)
							if(fourth in M.warps)

								M.respawn = fourth

							else
								M.respawn = fourth
								M.warps += fourth
								ss+="\n You discovered a new location: [fourth]"
						if(side)
							ss+="\n You completed a side dungeon."

						M.story(ss)

						M.save()

				m.leave_dungeon()



mob

	var/can_dothat = 1
	var/party = list()

	New()
		..()
		party+=src

	var/Map/dungeon


	proc/enter_dungeon(dungeon/d)

		if(d.level_req > level)
			src.story("You must be level [d.level_req] or greater to enter this dungeon. Level up by completing dungeons and quests.")
			return
		if(d.solo)
			if(length(party) > 1)
				src.story("This dungeon must be done solo.")
				return

		for(var/mob/M in party)
			if(M.dungeon)
				loc = M.loc
				return

		dungeon = maps.copy(d.z)


		for(var/player/M in party)

			M.loc = locate(d.start_loc[1],d.start_loc[2],dungeon.z)
			M.Move(M.loc)

			M.rez_loc = M.loc

			if(length(party)==1)
				M.revives = 2

			M.dungeon = dungeon

		for(var/player/M in party)
			M.save()

	proc/leave_dungeon()

		if(dungeon)
			dungeon.repop()

			dungeon.free()

			for(var/player/M in party)

				M.dungeon=null
				M.revives=0

				if(M.companion)
					M.summon_companion()
					M.summon_companion()

				M.rez_loc = null
				for(var/item/I in M.items)
					if(I.del_out)
						M.items -= I
						if(M.hmenu)
							M.hmenu.update(M.inview,M)

mob/var/revives=0
mob/var/rez_loc = null