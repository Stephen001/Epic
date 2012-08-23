area
	inv


		var/see

		Entered(mob/m)
			if(istype(m))
				m.see_invisible = src.see

		Exited(mob/m)
			if(istype(m))
				m.see_invisible=1


		building

			see = 0