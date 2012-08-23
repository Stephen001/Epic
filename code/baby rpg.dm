  #define DEBUG


/*

YUT:
	add crafts - DONE

		Overlord Steam armor - done
		steam cannon - steam bow + plasma rifle - DONE

		grand cog - steam armor + cog armor - DONE
		flaming dagger - burning cutlass + flame greatsword - DONE

		nocturne - malice striker + headsman axe - DOEN
		orb of steam - cog armor + orb of ultramancers - DONE

		robes of prophecy - calypso robes + darkfate cloak - DONE
		nimble steam armor - steam armor + aviator gear - DONE



	add clockturne's dungeon's loot - DONE

		fate spellbook - DONE
		gear rampage spellbook - DONE


	add Spine of the Universe - DONE

	add quests - DONE

	release 0.8 and blog it



MATT:


CIRE:

*/
mob
	var/warp=1
	icon = 'mob.dmi'


world
	fps = 30
	hub = "YutPut.epic"
	//HUB PASSWORD REMOVED
	name = "Epic"
	view="18x15"
//woot matbve rawr sex and monkeys
	mob = /gameclient
	turf = /turf/dark
	New()
		..()
//		lighting.init('sample-lighting-5.dmi')
	//	lighting.init()

client
	mouse_pointer_icon = 'mouse.dmi'

obj
	step_size = 8


	icon = 'objects.dmi'
	torch
		dont_reset = 1
		icon_state = "torch"


atom/proc/bumped(atom/movable/A)

atom
	var
		f_caption=null
		i_caption=null


var/const/WARP=2

portal
	parent_type = /obj
	icon = 'turf.dmi'
	icon_state = "portal"

	flags_ground = WARP

	var/id

	proc/activate(mob/m)

		var/turf/T = locate("[name][id*-1]")
		if(T)
			m.loc = T
			m.Move(m.loc)
	p
		id=1
		p2
			name = "p"
			id=-1


	cp
		id=1
		cp2
			name = "cp"
			id=-1
	mp
		id=1
		mp2
			name = "mp"
			id=-1

	New()
		..()
		var/turf/T = loc
		if(T)
			T.tag = "[name][id]"
