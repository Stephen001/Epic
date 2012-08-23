#define ALERT_TYPE 1
mob

	var
		HudObject/back_label
		HudButton/ok_button
		HudButton/cancel_button
		obj/question
		HudOptionGroup/option_group
		confirmed_option = 1
		option
	verb
		yes()
			confirmed_option = 1
			option = "yes"
		no()
			confirmed_option = 1
			option = "no"
	proc

		ok()
			confirmed_option = 1

		cancel()
			confirmed_option = 1

			option_group.hide()
			ok_button.hide()
			cancel_button.hide()
			question.invisibility=2

		alerts(capt,o1="ok",o2="cancel",time=300)

			alertses(capt)

			return



			if(ALERT_TYPE == 1)

				winset(src,"default.child","is-visible=true")

				winset(src,"window1.message","text = \"[capt]\"")
				winset(src,"window1.yes","text = \"[o1]\"")
				winset(src,"window1.no","text = \"[o2]\"")

				confirmed_option = 0
				while(src && confirmed_option == 0)
					sleep(1)
				confirmed_option = 1
				winset(src,"default.child","is-visible=false")

			if(ALERT_TYPE == 1)
				return


			if(!ok_button)
				ok_button = new(src, "Ok")
				ok_button.pos(110+120, 110+70)
				ok_button.background(rgb(91,193,62))

			if(!cancel_button)
				cancel_button = new(src, "Cancel")
				cancel_button.pos(178+120, 110+70)
				cancel_button.background("#f55")


			ok_button.action("[o1]")
			ok_button.pos(110+120+39, 110+70)

			question.maptext = "<font color=#F8F8F8 >[capt]"

			question.screen_loc = "8,9"

			option_group = new(src)
			option_group.pos(110+120, 200+30)
			option_group.add(-10,-74,icon='back.dmi', layer=option_group.layer-1)


			var/count=0

			confirmed_option=0

			option_group.show()
			ok_button.show()
			cancel_button.hide()
			question.invisibility=0

			while(src && !confirmed_option && count++<time && option_group.visible)
				if(src && client) client.mouse_pointer_icon = 'mouse.dmi'
				else
					return null
				sleep(1)


			if(!src || !client)
				return null

			client.mouse_pointer_icon = 'mouse.dmi'

			option_group.hide()
			ok_button.hide()
			cancel_button.hide()
			question.invisibility=2


		options(capt,ops=list("yes","no"),o1="ok",o2="cancel",time=300)

			if(ALERT_TYPE == 1)

				winset(src,"default.child","is-visible=true")

				winset(src,"window1.message","text = \"[capt]\"")

				winset(src,"window1.yes","text = \"[ops[1]]\"")
				winset(src,"window1.no","text = \"[ops[2]]\"")

				confirmed_option = 0
				option = null

				while(src && confirmed_option == 0 && option == null)
					sleep(1)
				if(!src) return

				confirmed_option = 1
				winset(src,"default.child","is-visible=false")

				return option

			if(ALERT_TYPE == 1)
				return


			if(!ok_button)
				ok_button = new(src, "Ok")
				ok_button.pos(110+120, 110+70)
				ok_button.background(rgb(91,193,62))

			if(!cancel_button)
				cancel_button = new(src, "Cancel")
				cancel_button.pos(178+120, 110+70)
				cancel_button.background("#f55")


			ok_button.action("[o1]")
			cancel_button.action("[o2]")
			ok_button.pos(110+120, 110+70)
			question.maptext = "<font color=#F8F8F8 >[capt]"
			question.screen_loc = "8:4,9:16"

			option_group = new(src)
			for(var/o in ops)
				option_group.add_option("[o]")

			option_group.pos(110+120, 200+30)

			option_group.add(-10,-74,icon='back.dmi', layer=option_group.layer-1)


			var/count=0

			confirmed_option=0

			option_group.show()
			ok_button.show()
			cancel_button.show()
			question.invisibility=0

			while(src && !confirmed_option && count++<time && option_group.visible)
				if(src && client) client.mouse_pointer_icon = 'mouse.dmi'
				else
					return null
				sleep(1)


			if(!src || !client)
				return null

			client.mouse_pointer_icon = 'mouse.dmi'

			option_group.hide()
			ok_button.hide()
			cancel_button.hide()
			question.invisibility=2


			if(option_group.mode == option_group.OPTION)

				if(option_group.value)
					return option_group.value
				else
					return null

			else

				if(option_group.selected.len)
					return option_group.selected
				else
					return null



