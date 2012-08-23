
obj
	texty
		New()
			..()

			spawn(5)
				del(src)
mob
	proc
		damage_number(amount,color="white",style="<b>")


			var/obj/O = new/obj/texty
			O.loc = src.loc
			O.pixel_y = src.pixel_y+19
			O.pixel_x = src.pixel_x+24
			O.step_x = src.step_x
			O.step_y = src.step_y

			O.maptext_height = 64
			O.maptext_width = 48
			if(isnum(amount))
				amount = round(amount)
				amount = "-[amount]"
			O.maptext = "<font color = [color]>[style][amount]"

			O.layer = MOB_LAYER + 1000

			walk(O,NORTH,0.5,2)



