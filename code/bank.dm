bank
	parent_type = /liv


	New()

		loc = null



deposit_npc
	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=0

	icon_state = "person"
	name = "deposit"
	New()
		..()
		NameOverlay = new/obj
		NameOverlay.maptext_width = 64
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -24
		NameOverlay.maptext = "<center><font color = #F8F8F8 >[name]<br>\[bank]"
		overlays += NameOverlay

		icon = Icon(icon,icon_state,dir2angle(dir))
withdraw_npc
	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=0

	icon_state = "person"
	name = "withdraw"
	New()
		..()
		NameOverlay = new/obj
		NameOverlay.maptext_width = 64
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -24
		NameOverlay.maptext = "<center><font color = #F8F8F8 >[name]<br>\[bank]"
		overlays += NameOverlay

		icon = Icon(icon,icon_state,dir2angle(dir))
mob

	var/bank/bank
	var/can_bank=0

player

	bank = new()
	proc
		deposit_bank()
			can_bank = 1
			inview = src

		view_bank()

			if(bank)
				inview = bank
			else
				bank = new/bank


