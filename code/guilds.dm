guild

	var/players = list()

	var/guild_name
	var/guild_color = "white"
	var/leader
	var/initialized=0

	New(name,color="white",player/p)
		if(name <> null && color <> null && p <> null)
			if(initialized==0)
				initialized = 1
				guild_name = name
				guild_color = color
				leader = p.key

				global.guilds += src

				add_player(p)

				p.chatbox("[p] created the new guild: <b>[guild_name]")

	proc/add_player(player/p)

		if(istype(p))
			p.title = guild_name
			p.faction_color = guild_color
			p.NameOverlay.maptext = "<center>[p.name]<br><font color = [p.faction_color]>\<[p.title]></font>"
			players += p.key

	proc/remove_player(player/p)

		if(p && istype(p))
			p.title = null
			p.faction_color = "white"
			p.NameOverlay.maptext = "<font color = #F8F8F8 ><center>[p.name]"
			players -= p.key

			p.story("You were removed from your guild.")

			if(p.key == leader)
				for(var/player/pw in world)
					if(pw.key in players)
						pw.story("Your guild leader has disbanded the guild.")
						remove_player(pw)

				global.guilds -= src


var/guilds = list()

guild_npc
	parent_type = /liv
	density=1
	live=1
	hp = 1.#INF
	team=0

	icon_state = "person"
	name = "guild manager"
	New()
		..()
		NameOverlay = new/obj
		NameOverlay.maptext_width = 64
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -24
		NameOverlay.maptext = "<font color = #F8F8F8 ><center>[name]"
		overlays += NameOverlay
	proc/talked_to(player/p)
		p.alerts("For 3000 gold, you can make a guild or invite new players here.")
		if(!p) return
		if(p.guild())
			switch(p.options("invite or remove player to guild?",list("invite","remove")))
				if("invite")
					if(p)
						p.guild_invite()
				if("remove")
					if(p)
						var/pname = input(p,"Type the name of the player you wish to remove. Type your name to disband.") as null|text
						if(pname && p)
							var/guild/g = p.guild()

							var/check=0
							for(var/n in g.players)
								if(n == pname)
									check=1
									switch(p.options("remove [n]?"))
										if("yes")
											if(p)
												var/check2=0
												for(var/player/pf in world)
													if(pf.client && pf.key == n)
														g.remove_player(pf)
														check2=1
												if(check2==0)
													g.players -= n
							if(check == 0)
								if(p)
									p << "No such players exists in your guild"

		else
			switch(p.options("create guild?"))
				if("yes")
					if(p && p.get_gold()>3000)

						namepick

						var/gname = input(p,"Type a name for your guild.") as null|text
						if(length(gname) <= 0 || length(gname) > 100)
							p.damage_number("Too long")
							return
						if(gname && p)

							var/color = input(p,"Choose a color for your guild.") as null|color
							if(color && p)

								for(var/guild/g in global.guilds)
									if(g.guild_name == gname)
										p.damage_number("Name taken")
										goto namepick

								new/guild(gname,color,p)

								p.add_gold(-3000)
					else
						p.damage_number("not enough gold")
						return


player

	proc/guild()
		for(var/guild/g in global.guilds)
			if(g.leader == key)
				return g
		return null
	proc/guildplayers()
		var/guild/g = getguild()
		if(g)
			var/rlist = list()
			for(var/m in g.players)
				for(var/player/p in world)
					if(p.key == m)
						rlist += p
			return rlist
		else
			return null
	proc/getguild()
		for(var/guild/g in global.guilds)
			if(key in g.players)
				return g
		return null

	proc/get_guild()

		for(var/guild/g in global.guilds)

			if(key in g.players)

				title = g.guild_name
				faction_color = g.guild_color
				NameOverlay.maptext = "<font color = #F8F8F8 ><center>[name]<br><font color = [faction_color]>\<[title]></font>"


	proc/guild_invite()

		var/plist = list()
		for(var/player/p in orange(10,src))
			if(p.getguild() == null && p <> src && p.live && p.confirmed_option)
				plist+=p

		if(!length(plist))
			src << "nobody in view"
			damage_number("nobody in view")
			return

		var/player/p = options("pick a player to invite",plist)
		if(p)

			for(var/player/p1 in view(10,src))
				if(p1.getguild() == null && p1.live && p1.confirmed_option && p1.name == p)

					p = p1
			if(istext(p))
				damage_number("not in view")
				return
			if(p)
				switch(p.options("join [src]'s guild?",list("yes","no")) )
					if("yes")

						if(p)
							if(p.getguild() == null && p.live && p.confirmed_option && get_dist(p,src)<=10)

								var/guild/g = guild()
								if(g)
									g.add_player(p)

					else

						src.damage_number("[p] declined")