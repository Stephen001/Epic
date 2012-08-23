player

	verb/addmember()

		var/plist = list()
		if(length(party) <= 4)

			for(var/player/p in orange(10,src))
				if(length(p.party)==1 && p <> src && p.live && p.confirmed_option)
					plist+=p

			if(!length(plist))
				src.damage_number("nobody in view")
				return

			var/player/p = input(src,"pick a player to invite") in plist
			if(p)

				for(var/player/p1 in view(10,src))
					if(length(p1.party)==1 && p1.live && p1.confirmed_option && p1.name == p)

						p = p1
				if(istext(p))
					src.damage_number("[p] not in view")
					return
				if(p)
					switch(p.options("join [src]'s party?"))
						if("yes")

							if(p)
								if(length(p.party)==1 && p.live && p.confirmed_option && get_dist(p,src)<=10)

									p.join_party(src)

						else

							p.damage_number("declined party")
		else
			src.damage_number("party maxed out")



	verb/leaveparty()

		leave_party()
