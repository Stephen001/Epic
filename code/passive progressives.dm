item/var/pl = "$"
mob/var/itemname = "'s items"
passive_progressive

	parent_type = /item

	var/group


	New()
		..()
		spawn()
			desc = "<br>[descr]<br><br>[lev]/[levmax]"
			icon_state = name
			icon = 'item.dmi'
			price = lev
			pl = "/[levmax]"

	proc/player_get(player/p,level=1)

		if(name in p.passives)

			p.passives[name] = level
			lev = level

			desc = "<br>[descr]<br><br>[lev]/[levmax]"

			price = lev
			pl = "/[levmax]"

		else
			if(level <= levmax)

				p.passives+=name
				p.passives[name]=level

				lev = level

				desc = "<br>[descr]<br><br>[lev]/[levmax]"

				price = lev
				pl = "/[levmax]"

	var/levmax = 5
	var/lev = 0
	var/descr = ""
//	SPEED
	Reflexes
		descr =  "+5% dodge chance per level"//
		group = "speed"
	Undetected
		descr = "Reduces distance enemies can spot you by one tile per level."//
		levmax = 3
		group = "speed"
	Artifice
		descr = "+5% critical hit chance per level."//
		group = "speed"
	Agility
		descr = "+1 base swingspeed per level."//
		group = "speed"
	Sprint
		descr = "+0.2 base move speed per level."//
		group = "speed"



//	POWER
	Tank
		descr = "+7 base HP per level."//
		group = "power"
	Bashing
		descr = "+2 base stun per level."//
		group = "power"
	Sleeper
		descr = "+1 HP restore while resting per level."//
		group = "power"
		levmax = 3
	Brute
		descr = "+1 base attack per level."//
		group = "power"
	Anger
		descr = "+1 damage per level when health<30."//
		group = "power"


//	MAGIC
	Powerhouse
		descr = "+5 base MP per level."//
		group = "magic"
	Genious
		name = "Genius"
		descr = "+2 base mana regen per level."//
		group = "magic"
	Caster
		descr = "+5% chance to not use up MP when casting per level."//
		group = "magic"
	Vampire
		descr = "+5 base mana drain per level."//
		group = "magic"
		levmax = 3
	Blitz
		descr = "-10% spell cooldowns per level."//
		group = "magic"



skill_belt

	parent_type = /liv
	name = "Your blessings"
	itemname = ""
	New()
		loc = null

		for(var/X in typesof(/passive_progressive/))
			items += new X

		for(var/item/I in items)
			if(I.name == "passive progressive")
				items -= I




mob

	var/passives = list()

	var/skill_belt/belt

	var/heropoints = 0

	proc

		passive(passive)

			if(passive in passives)
				return passives[passive]
			else
				return 0

		view_belt()

			if(belt)
				inview = belt
			else
				belt = new/skill_belt



priest

	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=1

	icon_state = "priest"

	New()
		..()
		name = "priest"

		NameOverlay = new/obj
		NameOverlay.maptext_width = 128
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -16
		NameOverlay.pixel_x=-32
		NameOverlay.maptext = "<center><font color = #F8F8F8 >[name]"

		overlays += NameOverlay








