mob
	var
		race = "human"
		class_has = 0

player

	var/ability/race_ability
	proc

		pick_race(char/races/r)
			race = r.name
			var/X = text2path("/ability/[r.ac]")
			if(X) race_ability = new X

		enter_character_creator()

			if(!client) return

			client.eye = loc
			client.perspective = EYE_PERSPECTIVE
			loc = null

			new/char/character_background(client)
			new/char/race_selection(client)
			new/char/okay_button(client)

			winset(src,"default.name2","is-visible=true")
			winset(src,"default.name","is-visible=true")
			winset(src,"default.name","text = \"[key]\"")

			while(class_has==0)
				confirmed_option=0
				sleep(1)

			class_has=0

			angle(angle)

			confirmed_option=1
			loc = client.eye
			client.eye = src


			name = winget(src,"default.name","text")

			if(name == "")
				name = key
		//	if(name == "Yut Put" && key <> "Yut Put")
		//		name = "Wannabe"
			if(lentext(name) > 25)
				name = key
			name = html_encode(name)

			NameOverlay = new/obj
			NameOverlay.maptext_width = 128
			NameOverlay.maptext_height = 100
			NameOverlay.pixel_y = -24
			NameOverlay.pixel_x=-32
			NameOverlay.maptext = "<font color = #F8F8F8 ><center>[name]"

			winset(src,"default.name","is-visible=false")
			winset(src,"default.name2","is-visible=false")

			for(var/char/c in client.screen)
				client.screen -= c
				del(c)




char
	parent_type = /obj

	var/player/owner

	New(client/c)
		c.screen+=src
		spawn_parts(c)
		owner = c.mob
		..()

	proc/spawn_parts()
		return null


	layer = 300

	character_background

		icon = 'c_back.dmi'
		screen_loc = "1,1 to 18,15"

		layer = 250

	race_selection

		screen_loc = "5,4"
		maptext_width = 350
		maptext_height = 100
		var/plist = list()
		spawn_parts(client/c)

			var/Z=4
			for(var/X in typesof(/char/races/))
				var/char/races/r = new X(c)

				r.numz = Z
				Z+=2

				r.bar = src





		proc/update_info(char/races/r)

			maptext = "[r.desc]<br><br>\[PASSIVE][r.power_1]<br>\[ACTIVE][r.power_2]"

	okay_button

		icon = 'okay button.dmi'
		screen_loc = "5,2"

		Click()
			if(usr.client)
				usr.class_has=1


	races

		var/char/race_selection/bar

		var/numz=0

		layer = 300

		Click()
			if(usr.client)
				usr:pick_race(src)

		New(client/c)
			if(name <> "races")
				..()
			maptext = "<center>[name]"
			maptext_width=64
			maptext_height=64
			spawn() update()

		proc/update()

			screen_loc = "[numz],8"
			if(owner && owner.race == name)
				underlays += "selected"
				bar.update_info(src)
			else
				underlays = null
			spawn(0.5)
				if(src) update()

		icon = 'item.dmi'

		var

			power_1
			power_2
			ac

		orc //full tank
			icon_state = "orc c"
			desc = "Orc men are hardy creatures enhanced by hard skin and primal rage."
			power_1 = "Orc Hide: +20 more HP than other races"
			power_2 = "Primal Rage: Sacrifice 10 HP to do an instant spin attack(if melee weapon is equipped)."

			ac = "primal_rage"

		dwarf //part archer mostly tank
			icon_state = "dwarf c"

			desc = "Dwarves are raised around the volcanic city of Rossor, where they develop a higher resistance to injury. The dwarves like to hit things."

			power_1 = "Hardy: Reduce base damage taken by 3"
			power_2 = "Bash: Stun an opponent in front of you."
			ac = "bash"

		human //part tank mostly archer

			icon_state = "human c"
			desc = "The most common race in the world. Humans are skilled at hunting, and are capable of healing quickly."

			power_1 = "Prayer: +2 bonus to health regeneration"
			power_2 = "Healing pulse: Stun nearby enemies and regain health for each enemy stunned."
			ac = "healing_pulse"
		elf //full archer

			icon_state = "elf c"

			desc = "Elves are dominant among other species. They are light and quick on their feet, making them difficult to hit."
			power_1 = "Agile: +5% chance to dodge attacks"
			power_2 = "Dash: Short burst of speed."
			ac = "dash"

		beast //part mage mostly archer

			icon_state = "beast c"
			desc = "Beasts are humans who have been cursed by the gods. Beasts are skilled with magic while still having the logic humans possess."
			power_1 = "Cursed: Mana can not be drained from you."
			power_2 = "Deafening Roar: Drain all of your mana to stun a wide range of opponents."
			ac = "AoE/deafening_roar"

		grouhlian //part archer mostly mage

			icon_state = "grouhlian c"

			desc = "Grouhlians, otherwise known as 'dead people' or 'zombie men', inhabit Grouhl. Grouhlians are skilled at using magic."

			power_1 = "Spellcraft: Projectiles do +2 damage."
			power_2 = "Blackblood: Exchange 5 HP for 10 mana."
			ac = "blackblood"

		cogman //full mage

			icon_state = "cogman c"

			desc = "Cogmen are from the sacred city of Clockwerk and understand magic that no other race has ever even attempted."
			power_1 = "Superspell: +7% Critical hit chance"
			power_2 = "Time Burst: Fire a powerful projectile"

			ac = "time_burst"














