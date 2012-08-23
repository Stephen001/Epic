client/preload_rsc = 2
mob
	proc
		has_file()

			var/savefile/F = new(client.Import())
			if(F)
				var/Z
				F["has file"] >> Z

				return Z

player

	//yut's herpin' derpin' save system.
	var/title = ""
	proc


		upload_scores()
			if(!client) return

			var/C = "none"
			if(orb)
				C = class

			var/params = list("Level"=level,"Class"=C,"Race"=race)
			world.SetScores(name,list2params(params))

	proc
		save()
			src.client.Export()

			var/savefile/F = new()
			hp = hp_max
			mp = mp_max

			F["spawn"] << src.respawn
			F["warps"] << src.warps
			F["levelcomplete"] << src.levelcomplete
			F["level"] << src.level
			F["has file"] << 1

			if(weapon_1)
				F["weap1"] << src.weapon_1.name
			else
				F["weap1"] << null

			if(weapon_2)
				F["weap2"] << src.weapon_2.name
			else
				F["weap2"] << null

			if(armor)
				F["armor"] << src.armor.name
			else
				F["armor"] << null

			F["vanity"] << src.vanity



			if(companion)
				companion_items = list()
				for(var/item/I in companion.items)
					companion_items += I


			F["companion name"] << src.companion_name
			F["companion items"] << src.companion_items

			if(orb)
				F["orb"] << src.orb.name
			else
				F["orb"] << null
			if(idol)
				F["idol"] << src.idol.name
			else
				F["idol"] << null
			F["items"] << src.items

			F["level"] << src.level

			F["q"] << src.quests

			F["q2"] << src.completed_quests

			F["q2"] << src.completed_quests

			F["bank"] << bank
			F["passives"] << passives
			F["belt"] << belt
			F["heropoints"] << heropoints
			F["no points"] << 1
			F["s1"] << abils[1]
			F["s2"] << abils[2]
			F["s3"] << abils[3]
			F["s4"] << abils[4]
			F["s5"] << abils[5]
			F["pvppoints"] << pvppoints
			F["race"] << race
			F["race_ability"] << race_ability
			F["name"] << name
			src.client.Export(F)
			damage_number("saved","white")

			upload_scores()


		load()
			if(!client) return

			var/savefile/F = new(client.Import())

			if(F && has_file())


				var/w1
				var/w2
				var/a
				var/o
				var/i
				var/s_1
				var/s_2
				var/s_3
				var/v
				var/s_4
				var/s_5

				F["spawn"] >> src.respawn
				F["warps"] >> src.warps
				F["levelcomplete"] >> src.levelcomplete
				if(levelcomplete==null)
					levelcomplete = list()
				F["level"] >> src.level

				if(warps == null)
					warps = list()

				if("start" in warps)
					warps -= "start"
				warps += "start"


				F["weap1"] >> w1
				F["weap2"] >> w2
				F["armor"] >> a
				F["vanity"] >> v

				F["orb"] >> o
				F["idol"] >> i

				F["items"] >> src.items

				F["level"] >> src.level

				F["q"] >> src.quests

				F["q2"] >> src.completed_quests

				F["s1"] >> s_1
				F["s2"] >> s_2
				F["s3"] >> s_3
				F["s4"] >> s_4
				F["s5"] >> s_5



				F["companion name"] >> src.companion_name
				F["companion items"] >> src.companion_items

				if(companion)
					companion.items = list()
					for(var/item/I in companion_items)
						companion.items += I
				F["bank"] >> bank

				F["passives"] >> passives
				if(passives == null)
					passives = list()
				F["belt"] >> belt
				F["heropoints"] >> heropoints
				if(heropoints==null)
					heropoints = 0


				var/no_points=1
				F["no points"] >> no_points

				if(no_points==null)

					heropoints+=length(completed_quests)

				F["pvppoints"] >> pvppoints
				F["race"] >> race
				F["race_ability"] >> race_ability
				F["name"] >> name


				weapon_1 = null
				weapon_2 = null
				armor = null
				vanity = list()
				orb=null
				team = 1
		/*		if(ckey(key) == "expixel")
					if(items[1] == null || !istype(items[1], /item/weapon/sword/pixie_blade))
						items[1] = new/item/weapon/sword/pixie_blade
					if(items[2] == null || !istype(items[2], /item/apparel/armor/pixie_armor))
						items[2] = new/item/apparel/armor/pixie_armor*/

				if(key == "Falcon lazorz")
					var/item/wer = new/item/apparel/armor/falcon_armor
					items+=wer
					wer.use(src,"right")
				if(key == "ExPixel")
					var/item/wer = new/item/apparel/armor/falcon_armor
					items+=wer
					wer.use(src,"right")
				if(key == "D-Cire")
					var/item/wer = new/item/apparel/armor/cires
					items+=wer
					var/item/wer2 = new/item/weapon/sword/cire_scythe
					items+=wer2
					src.level = 90

				for(var/item/I in items)
					if(I.name == w1 && weapon_1==null)
						weapon_1 = I
						continue
					if(I.name == w2 && weapon_2==null)
						weapon_2 = I
						continue

					if(I.name == o && orb==null)
						orb = I
						continue
					if(I.name == i && idol==null)
						idol = I
						continue
					if(I in v)
						vanity += I
					if(I.name == a && armor==null)
						armor = I

						hp_max = 40 + armor.defense  + (passive("Tank")*7)
						mp_max = 20 + armor.mage + (passive("Powerhouse")*7)

						hp_bar.update(src)

						continue
					if(armor && weapon_1 && weapon_2)
						break


				hbar.set_ability(1,s_1,src)
				hbar.set_ability(2,s_2,src)
				hbar.set_ability(3,s_3,src)
				hbar.set_ability(4,s_4,src)
				hbar.set_ability(5,s_5,src)

				src.respawn()

				Move(loc)


