

mob/var/menu_open=0
atom/var/nomob = 0
mob
	var/mp_restore = 50
	var/hp_restore = 1
	var/mp_max = 20
	var/hp_max = 40
	var/lock_dir = null
	var/class = ""
	var/update_hud = 0
	var/pulses = list()
	var/power_box/movable/carrying = null
//	var/obj/fader
//	proc/fade()
	//	if(fader)
	//		flick('screenfade.dmi',fader)
	var/warps = list()
	var/can_craft = 0
client/Command()
	if(istype(mob,/gameclient))
		return
	..()

player

	parent_type = /liv

	verb/autosell()
		if(auto_sell)
			auto_sell=0
			src.damage_number("auto sell ON")
		else
			auto_sell=1
			src.damage_number("auto sell OFF")

	proc/summon_companion()

		if(companion)

			companion_items = list()
			for(var/item/I in companion.items)
				companion_items += I

			companion.loc = null
			companion.summon_owner = null
			companion = null


		else

			if(companion_name == null)

				companion_name = input(src,"Choose a name for your companion.") as null|text

				companion_name = html_encode(companion_name)

				if(lentext(companion_name)>100)
					companion_name = "Mercenary"



			new/Enemy/companion(src)


	see_invisible=1
	bump(atom/a)
		..()
		a.bumped(src)

	var/restoring=0
	var/pspeed = 0
	var/companion_name = null
	var/companion_items = list()
	var/check_in=0
	var/on_ice=0
	var/levelcomplete = list()
	var/Enemy/companion/companion
	slow_down()
		if(on_ice)
			return
		else
			..()
	action(t)
		if(!client) return

		if(lock_dir)
			dir = lock_dir
		..()
		powered  = 0
		if(live)

			if(PLAY_MUSIC)

				var/turf/tm = loc
				if(tm.has_music)

					if(tm.music <> current_music)

						play_music(tm.music)

			angle(dir2angle(dir))




			overlays = w_overlays
			overlays+=NameOverlay

			for(var/s in pulses)
				overlays += s
				spawn(5)
					if(s && s in pulses)
						pulses -= s
			if(sneak)
				overlays += image('item.dmi',icon_state = "sneak")
			if(emote)
				overlays += image('item.dmi',icon_state = "[emote]")
			for(var/s in epics)
				if(s in underlays)
					continue
				underlays += image('epic attacks.dmi',icon_state = s)

			if(companion)

				if(companion.z <> z)

					companion.z = z
					companion.set_pos(src.px,src.py)

			for(var/s in underlays)
				if(s in epics)
					continue
				else
					underlays -= image('epic attacks.dmi',icon_state = s)

			if(orb)
				if(istype(orb,/item/orb/))
					class = orb:orbname
			if(has_epic("earth"))
				pulse_counter++
				if(pulse_counter >= 30)
					pulse()
					pulse_counter=0
			levele.maptext = "<font color = #F8F8F8 >level [level] [race] [class]"
			if(heropoints)
				levele.maptext = "<font color = #F8F8F8 >[levele.maptext] ([heropoints] hero points)"
			if(pvppoints)
				levele.maptext = "<font color = #F8F8F8 >[levele.maptext]<br>  -[pvppoints] pvp points"
			if(stunned) return
			if(live==0 && dungeon && length(party)>1)
				overlays+=image(icon='item.dmi',icon_state="help",layer=10)
			if(restoring && damaged==0)
				if(mp-5 >=0)

					if(hp<=hp_max) hp += hp_restore + passive("Sleeper")
					mp-=1
					overlays += image(icon='item.dmi',icon_state="restore",layer=10)
			else
				mp_restore--

				if(mp_restore == 0)
					mp_restore = 25

					if(pspeed == 0)

						var/boost = 1

						if(orb("double mana regen"))
							boost = 2
						if(orb("triple mana regen"))
							boost = 3
						if(has_epic("fire"))
							boost += 4
						if(mp+(5*boost)<=mp_max)
							mp+=(5+(passive("Genious")*2))*boost
						else mp = mp_max

						boost=1
						var/boost2=0
						if(race == "human")
							boost2=2
						if(orb("double hp regen"))
							boost = 2
						if(orb("triple hp regen"))
							boost = 3

						if(hp+(0.5*boost)<=hp_max) hp+=(0.5+boost2)*boost
						else hp = hp_max


			if(menu_open == 0 && armor)
				var/Fa = 0
				if(has_epic("wind"))
					Fa = 3
				move_speed = 5+armor.speedboost+pspeed+(passive("Sprint")/5)+Fa
				if(has_epic("earth"))
					move_speed = 3
			for(var/ability/a in get_skills())

				if(a.can_use==1)
					if(a.mp_usage>mp || a.hp_usage>hp)
						a.can_use=0
						hbar.update()

				if(a.can_use==0)
					if(a.mp_usage<=mp && a.hp_usage<=hp)
						a.can_use=1
						hbar.update()


			//int



			update_hud++
			if(update_hud == 10)
				update_hud = 0
				hp_bar.update(src)


			inview=src

			if(confirmed_option)



				set_int("")



				var/IN = inside()
				var/F = front(20)

				for(var/withdraw_npc/w in F)

					set_int("withdraw - q")
					view_bank()
					return

				for(var/priest/w in F)

					set_int("blessings - q")
					view_belt()
					return

				can_bank=0
				for(var/deposit_npc/d in F)

					set_int("deposit - q")
					can_bank=1
					return

				for(var/player/p in IN)

					if(p in src.party)

						if(p <> src)

							if(p.live==0)

								src.set_int("rez [p] - e")
								return
				for(var/Enemy/p in IN)

					if(p == src.companion)

						if(p.live==0)

							src.set_int("rez [p] - e")
							return

				for(var/liv/l in IN)
					if(l.live==0 && l <> src && inview <> l && l.client==null && self_view == 0 && l.can_loot==1)
						src.inview = l
						src.set_int("[l] - q")
						return
				can_craft = 0
				for(var/liv/anvil/l in F)
					can_craft = 1
					set_int("craft - q")
					return
				for(var/liv/enchantment_table/e in F)
					can_enchant = 1
					set_int("enchant - q")
					return
				for(var/chest/c in F)
					if(c.icon_state == "chest" && inview <> c && self_view == 0)
						inview = c
						set_int("chest - q")
						return

				for(var/shopkeeper/c in F)
					inview = c
					set_int("shop - q")
					return
				for(var/guild_npc/g in F)
					set_int("guild - e")
					return
				for(var/door/d in F)
					set_int("open - e")
					return


				for(var/portal/p in IN)
					set_int("portal - e")
					return

				for(var/portal/dungeon_portals/p in IN)
					set_int("portal - e")
					return
				for(var/lever/l in F)
					if(l.on==0)
						set_int("lever - e")
						return
				for(var/obj/spawns/p in IN)
					if(p.name in warps)
						if(respawn == p.name)
							if(length(warps) >=2)
								set_int("warp - e")
								return
					set_int("save - e")
					return

				for(var/quest_npc/d in F)
					set_int("quest - e")
					return

				for(var/sign/s in F)
					set_int("[s.msg]")
					return

				for(var/Enemy/E in F)
					if(E.msg)
						set_int("talk - e")
						return
				for(var/atom/A in IN)
					if(A.i_caption)
						set_int("[A.i_caption]")
						return
				for(var/atom/A in F)
					if(A.f_caption)
						set_int("[A.f_caption]")
						return
				if(carrying == null)
					for(var/power_box/movable/c in F)
						set_int("carry - e")
						return
				else

					set_int("drop - e")
					return

				inview=src

			//end int



			powered=0
	move()
		if(!client) return
		if(live==0) return
		if(menu_open || !confirmed_option) return

		if(lock_dir)
			dir = lock_dir
		..()

obj
	sparkle
		icon = 'skill.dmi'
		density=0
		New(mob/m,_icon_state)

			icon_state = _icon_state
			loc = m.loc
			layer = MOB_LAYER+5
			pixel_y = m.step_y + (m.pixel_y/2)
			pixel_x = m.step_x + (m.pixel_x/2)

			walk_rand(src,0.3,2)
			spawn(2)
				del(src)

mob/var/respawn = ""
mob/var/level = 1
mob/var/stunned = 0
mob/var/can_enchant = 0
//client
//	control_freak=1
mob
	var/fan = 0
player
	hp_max = 40
	mp_max = 20

	var/load=0

	proc/respawn()
		loc = locate(respawn)
	set_state()

		if(vel_y <> 0 || vel_x <> 0)
			if(legs <> "legs-moving")
				legs = "legs-moving"
				underlays = null



				underlays += Icon('item.dmi',"legs-moving",dir2angle(dir))
		else
			if(legs <> "legs")
				legs = "legs"
				underlays = null
				underlays += Icon('item.dmi',"legs",dir2angle(dir))

		for(var/s in epics)
			if(s in underlays)
				continue
			underlays += image('epic attacks.dmi',icon_state = s)
		for(var/s in underlays)
			if(s in epics)
				continue
			else
				underlays -= image('epic attacks.dmi',icon_state = s)
	proc/dieo()

		var/mlist = list()
		for(var/mob/m in party)
			if(m.live && m <> src && m.z == src.z && src.live)
				live=0
				m.damage_number("[src] is dead.")
				return
			else
				if(m.live==0 && m <> src)

					mlist += m


		loc = locate(respawn)
		hp = hp_max
		mp = mp_max
		add_gold(-level)

		var/partyl = list()

		for(var/mob/m in party)
			if(m.z == z && m.live==0 && m <> src)
				partyl += m

		if(dungeon && length(partyl)==0)
			leave_dungeon()

		for(var/player/m in mlist)
			if(m && m.live == 0)
				m.leave_party()
				m.die()




	die()

		var/mlist = list()

		if(dungeon && canrez==1)
			for(var/mob/m in party)
				if(length(party)==1 && m == src && src.revives)
					src.revives--
					src.loc = rez_loc
					src.hp = src.hp_max
					src.damage_number("[src.revives] lives left.")
					return
				if(m.live && m <> src && src.live)
					live=0
					m.damage_number("[src] is dead.")

					return
				else
					if(m.live==0 && m <> src)

						mlist += m
					else
						if(m.live == 1 && m <> src && m.dungeon)
							return


		loc = locate(respawn)
		hp = hp_max
		mp = mp_max

		if(team <> key)
			add_gold(-level)

		chatbox("[src] died.")

		armor=null
		vanity=list()
		orb=null
		items=list()
		weapon_1=null
		weapon_2=null
		level=null
		sparkles=list()
		pulses=list()

		if(team == key)
			team = 1
			src << "you are no longer in a PvP zone"

		load()

		live = 1

		if(dungeon)
			for(var/player/m in mlist)
				if(m && m.live == 0 && m <> src)
					m.canrez = 0
					m.leave_party()

		if(length(party)==1 && dungeon)
			leave_dungeon()
		for(var/player/m in mlist)
			m.canrez = 1

	proc/die_perm()
		del_hud()

	var/canrez=1
	//	spawn(10)
	//		client.load()

	Logout()


		chatbox("[src] is offline")

		for(var/player/p in guildplayers())
			p << "<font color=purple><b>(GUILD)[src] left"

		die_perm()

		if(dungeon && length(party)==1)

			leave_dungeon()

		leave_party()

		..()

		if(src)
			del(src)

	proc/stuck()
		var/X = px
		var/Y = py
		alert(src,"You have activated the 'stuck' command. Do not move for 10 seconds to have your location restored to your respawn(whether in a dungeon or in a town).")
		spawn(100)
			if(src.px == X && src.py == Y)

				if(src.dungeon)
					src.loc = src.rez_loc
				else
					src.loc = locate(respawn)


	verb/who()


		var/ss = "Players online:"
		for(var/player/p in world)
			if(p.client)
				ss += "\n [p]: level [p.level] [p.race] [p.class]"
		src.story(ss)


	proc/join_party(mob/m)

		for(var/mob/M in m.party)
			if(M.dungeon)
				src << "you can't join a party which is doing a dungeon"
				m << "you can't have a member join if you are in a dungeon"
				return

		if(length(party)>1)
			leave_party()

		for(var/mob/M in m.party)
			M.party += src
		src.damage_number("joined [m]!")

		party = m.party

		if(m.dungeon)
			dungeon = m.dungeon
			loc = m.loc

		if(get_dist(src,m) >=10)
			loc = m.loc
			m << "[src] warps to you"
			src << "you warp to [m]"


	proc/leave_party()

		var/dungeon_check = 0

		for(var/mob/M in party)
			M.party -= src

			M << "[src] leaves the party"


			if(M.dungeon)
				dungeon_check = 1


		if(dungeon_check)

			die()

			dungeon=null

		if(length(party)>1)
			src.damage_number("left party")

		party = list()
		party+=src


		src << "you leave the party"


	Login()

		chatbox("[client] is online")

//		if(isfan(client))
//			fan = 1
	//	if(key == "Yut Put")
	//		client.control_freak = 0

		inview = src


		NameOverlay = new/obj
		NameOverlay.maptext_width = 128
		NameOverlay.maptext_height = 100
		NameOverlay.pixel_y = -24
		NameOverlay.pixel_x=-32


		NameOverlay.maptext = "<font color = #F8F8F8 ><center>[client]"

		controls.up = "w"
		controls.left = "a"
		controls.down = "s"
		controls.right = "d"


	//	light = new(src, 2)
	//	light.intensity = 1
		angle(1)

		hp = hp_max
		mp = mp_max

		do_hud()

		respawn = "start"

	//	var/create=0
		if(load)
			load()

		else
		//	src.alerts("Welcome to Epic.<hr> Use the W,A,S,D keys to move your character. Go into the cave ahead to begin...<hr>")
			loc= locate(25,14,99)
			Move(loc)
		//	create = 1
		get_guild()
		for(var/player/p in guildplayers())
			if(p <> src) p << "<font color=purple><b>(GUILD) [client] joins"

		qmenu.update(src)
		winset(src,"default.chatbar","is-visible = false")
		winset(src,"default.map","focus=true")

		client.mouse_pointer_icon = 'mouse.dmi'

		name = key

//		NameOverlay()

		can_attack=1

		if(weapon_1)
			weapon_1.can_attack=1
		if(weapon_2)
			weapon_2.can_attack=1

		var/obj/O = new/obj
		O.screen_loc = "1,1 to 18,15"
		O.icon = 'turf.dmi'
		O.icon_state = "dark"
		O.layer = AREA_LAYER
		client.screen+=O
		showchat()
		update_dungeons()
		if(race_ability==null)
			spawn()
			//	loc= locate(25,14,99)
				enter_character_creator()
			//	loc= locate(25,14,99)
			//	Move(loc)
	//	var/obj/O2 = new/obj
	//	O2.screen_loc = "1,1 to 18,15"
	///	O2.icon = null
	//	O2.layer = MOB_LAYER+10000
	//	client.screen+=O2
	//	fader = O2


		levele.maptext = "<font color = #F8F8F8 >level [level]"
	var/obj/back
	can_bump(liv/a)
		if(istype(a))
			if(dungeon || team == key)

				if(istype(a,/player) && team <> key)
					return 0

				else

					if(a.team == team)
						return 0

					return a.live
			else
				if(istype(a,/player) || a.team == team)
					return 0
				else
					return 1
		if(ismob(a))
			if(istype(a,/power_box/movable))
				return 0
			if(a.nomob)
				return 0
			return a.density
		if(isturf(a))
			var/turf/T = a
			if(T.no_dense)
				return 0
		if(a.half_wall)
			return 1

		return ..()


	var/prefferedtypes = list(/item/weapon/wire,/item/key,/item/gold,/item/weapon/electric_charge)
	verb/original_scaling()
		winset(src,"default","size = 576x480")
	verb/fullscreen()
		if(fs)
			fs=0
			winset(src,"default","titlebar=false")
			winset(src,"default","is-maximized=true")
		else
			fs=1
			winset(src,"default","titlebar=true")
			winset(src,"default","is-maximized=false")
	var/fs=1
	key_down(k)

		if(k == "z")
			src.sneak()
		if(k == "return")

			src.yes()
			src.ok()
			src.exitstory()

			winset(src,"default.chatbar","is-visible = true")
			winset(src,"default.chatbar","focus = true")
			winset(src,"default.button1","is-visible=true")


		if(live==0) return


		if(k == "F3")
			emoticon("help")
		if(k == "F4")
			emoticon("mad")
		if(k == "F5")
			emoticon("sad")
		if(k == "F6")
			emoticon("happy")
		if(k == "F7")
			emoticon("woot")

		if(text2num(k))
			if(dungeon==null)
				if(team <> name)
					return
			use_skill(text2num(k))
			return
		if(k == "e")
			for(var/player/p in orange(0,src))

				if(p in src.party)

					if(p <> src)

						if(p.live==0)

							p.live =1
							p.density=1

							p.hp = p.hp_max




							return
			for(var/Enemy/companion/p in orange(0,src))

				if(p.summon_owner == src)

					if(p <> src)

						if(p.live==0)

							p.revive()

							return
			if(on_ground & WARP)
				for(var/portal/p in inside())
					play_sound('warp.wav')
					p.activate(src)
					return
			for(var/lever/l in front(20))
				l.on()
				return

			for(var/quest_npc/d in front(20))
				d.talked_to(src)
				return
			for(var/guild_npc/d in front(20))
				d.talked_to(src)
				return
			for(var/respec_npc/d in front(20))
				d.talked_to(src)
				return
			for(var/Enemy/E in front(20))
				if(E.msg)
					alerts("[E.msg]")
			for(var/obj/spawns/s in inside())

				if(s.name in warps)

					if(respawn == s.name)

						if(length(warps)>=2)

							var/se = input(src,"pick a destination") in warps
							if(se)
								play_sound('warp.wav')
								respawn = se
								respawn()


					else
						respawn = s.name
				else
					respawn = s.name
					warps += s.name

				save()

				return
			if(carrying == null)
				for(var/power_box/movable/c in front(20))
					if(c.carried == null)
						c.carried = src
						carrying = c
						carrying.pixel_y += 8
						carrying.layer = MOB_LAYER + 10
						return
			else
				carrying.carried = null
				carrying.pixel_y -= 8
				carrying.layer = MOB_LAYER
				carrying = null

				return

			for(var/door/d in front(20))
				if(d.locked)
					var/check=0
					for(var/item/key/i in items)
						if(i.icon_state == d.key_type)
							items -= i
							hmenu.update(inview,src)
							check=1
							break
					if(check)

						d.locked=0
					else

			//	else
		//			spawn(50)
		//				d.close()
				if(d.density==1 && d.locked==0)
					d.density=0
					d.opacity=0
					view_sound('open_door.wav')
					d.icon_state = "open door1"
				return


		if(k == "f")
			for(var/item/potion/p in items)
				p.effect(src)
				break
			hmenu.update(src,src)
		if(k == "q")

			hmenu.update(inview,src)
			hmenu.show()
			play_sound('open_inventory.wav')
			client.mouse_pointer_icon = 'mouse.dmi'
			menu_open=1
			move_speed=0
			slow_down()


			src.arrowupdate()
			showarrow.invisibility=0


		if(k == "r")
			restoring=1
		if(k == "shift")
			lock_dir = dir

		if(k == "t")

			if(inview <> src)

				for(var/item/I in inview.items)

					for(var/X in prefferedtypes)

						if(istype(I,X))

							I.use(src)
		if(k == "g")
			epic()

		if(k == "tab")

			if(race_ability)
				race_ability.use(src)

		if(k == "c")

			place_wire(1)



		if(k == "x")

			place_wire(-1)

		if(k == "northwest")
			src.stuck()
		if(k == "escape")
			src.warp_out()
		if(k == "o")

			b1(get_step(src,src.dir),1)
		if(k == "p")

			b1(get_step(src,src.dir),2)
		if(k == "space")
			pspeed = 3
		if(k == "southwest")
			client.eye = locate(/turf/moonloc)
		if(k == "i")

			if(armor && armor.ability)
				armor.ability.use(src)
		if(k == "`")
			if(key == "Yut Put" || key == "D-Cire" || key == "Blazekid" || key == "Put Yut")

				switch(input("what would you like to debug") in list("items #","get item","give town","item count","test companions","set level","test level cap","teleport","test damage","test character creation","toggle output","reset score"))
					if("items #")
						var/n = 0
						for(var/herp in typesof(/item/))
							n++
						world.log << "there are exactly [n-1] items in the game currently."


						n=0
						for(var/herp in typesof(/Enemy/))
							n++
						world.log << "[n-1] enemies"

						n=0
						for(var/herp in typesof(/ability))
							n++
						world.log << "[n-3] abilities"

						n=0
						for(var/herp in typesof(/portal/dungeon_portals/))
							n++
						world.log << "[n-1] dungeons"

						n=0
						for(var/herp in typesof(/quest/))
							n++
						world.log << "[n-1] quests"
					if("test companions")

						summon_companion()

					if("reset score")
						var/K = input("type a key") as null|text
						if(K)
							var/params = list("Level"=1,"Class"="none","Race"="human")
							world.SetScores(K,list2params(params))
					if("give town")

						var/player/p = input("pick a player") as mob in oview(10,src)
						if(p && istype(p,/player))
							p.warps = src.warps

					if("test level cap")


						level = 61

					if("set level")

						var/player/p = input("pick a player") as mob in oview(10,src)
						if(p && istype(p,/player))
							var/X = input("type a level") as null|num
							if(X)
								p.level = X



					if("teleport")
						loc = locate(15,16,54)
					if("get item")
						var/X = input("type in a type") as null|text
						var/X2 = text2path(X)
						if(X2)
							var/a = new X
							if(a)
								if(istype(a,/item/))
									items += a
									hmenu.update(src,src.inview)
					if("item count")
						damage_number(inv_count)
					if("test damage")
						damage(-10,src)
					if("test character creation")
						enter_character_creator()
					if("toggle output")
						if(output_shown)
							output_shown = 0
							winset(src,"default.output","is-visible=false")
						else
							output_shown = 1
							winset(src,"default.output","is-visible=true")



	var/output_shown=0
	verb/wsay(msg as text)

		var/guild/g = getguild()
		var/pretex = null
		if(g)
			pretex = "\<[title]> "
		var/tex = html_encode("[src]: [msg]")
		if(pretex)
			tex = "[pretex] [tex]"

		world << tex

		chatbox(tex)

		winset(src,"default.chatbar","is-visible = false")
		winset(src,"default.button1","is-visible = false")
		winset(src,"default.map","focus=true")
	verb/closechat()

		winset(src,"default.chatbar","is-visible = false")
		winset(src,"default.button1","is-visible = false")
		winset(src,"default.map","focus=true")

	key_up(k)
		if(live==0 || !confirmed_option) return
		if(k == "q")
			hmenu.hide()

			menu_open=0
			move_speed=5
			showarrow.invisibility=2
		if(k == "shift")
			lock_dir = null
		if(k == "r")
			restoring = 0
		if(k == "space")
			pspeed = 0
		if(k == "southwest")
			client.eye = src
		if(k == "o")

			b2(get_step(src,src.dir),1)
		if(k == "tab")
			self_view = 0


			for(var/liv/l in orange(0,src))

				if(l.live==0 && l <> src && inview <> l && l.client==null)
					src.inview = l

			for(var/chest/c in front(20))
				if(c.icon_state == "chest" && inview <> c)
					inview = c


			hmenu.update(inview,src)

		if(k == "p")

			b2(get_step(src,src.dir),2)

	var/self_view = 0
mob
	proc
		arrowupdate()

			if(!client) return

			if(showarrow == null)

				showarrow = new/obj
				client.screen+=showarrow
				showarrow.screen_loc = "10:8,9:16"

			showarrow.icon = null

			if(length(party)<>1 && dungeon)

				for(var/mob/M in party)
					if(M <> src && M.live==0)

						var/dx = M.px - px
						var/dy = M.py - py

						var/icon/I2 = Icon('item.dmi',"showarrow",arctan2(dx, dy))
						showarrow.icon = I2



	var/obj/showarrow




player/proc/set_respawn(t)
	respawn = t
	save()
	spawn()
		live=1

obj


	spawns
		dont_reset = 1
		icon = 'objects.dmi'
		icon_state = "spawn"

		New()
			..()
			spawn()
				var/turf/T = loc
				T.tag = name

		PvP_arena
		Rossor
		Grouhl
		Gallax
		Clockwerk
		Spine_of_the_Universe
		Rabbit_Hell
			name = "buny buny buny buny buny buny"
		Forevers_Respite
			name = "Forever's Respite"
		Huzza
		The_Underlife
		first_town//changing these names will bug saves
		start

