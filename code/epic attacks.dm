mob

	var/epics = list()

	proc
		has_epic(ep)
			if(ep in epics)
				return ep
			return 0


		fire_epic()//focus on dealing damage

			//mp regenerates 5x faster ----

			//spell damage doubled ----

			//spell projectiles triple fire ---

			//staffs instantly recharge after casting a spell ---

			epics += "fire"

			spawn(100)
				epics -= "fire"



		wind_epic()//focus on speed and crit

			//+3 speed ---

			//all your attacks become criticals ---

			//swingspeed doubled ---

			//all arrows triple fire ---
			epics += "wind"

			spawn(100)
				epics -= "wind"

		earth_epic()//focus on tanking

			//melee attacks have max reach and are all spins ---

			//all damage halved ---

			//speed max is 3 ---

			//pulse every second ---
			epics += "earth"

			spawn(100)
				epics -= "earth"

		water_epic()//focus on mp and rapid casting

			//you drain all of the damage you do as mp ---

			//spells take up half mp ---

			//stuns are +5 ---

			//projectile damage taken halfed ---

			epics += "water"

			spawn(100)
				epics -= "water"

mob
	var/item/epic_idol/idol

	proc
		epic()
			if(idol)
				idol.epic_use(src)

item
	epic_idol


		item_type = 7

		var/cd=0
		proc
			epic_use(mob/m)

				if(m.hp <= m.hp_max/2 && cd == 0)

					m.mp = 0

					m.hp = m.hp/2

					cd = 1
					spawn(1200)
						cd=0

				else
					return 0



		water_idol
			icon_state = "water idol"
			desc = {"
			you drain all of the damage you do as mp,
			spells take up half mp,
			stuns are +5,
			projectile damage taken halfed, "}

			epic_use(mob/m)
				if(..() != 0)

					m.water_epic()


		fire_idol

			icon_state = "fire idol"
			desc = {"
			mp regenerates 5x faster,
			spell damage doubled,
			spell projectiles triple fire,
			staffs instantly recharge after casting a spell, "}


			epic_use(mob/m)
				if(..() != 0)

					m.fire_epic()
		wind_idol

			icon_state = "wind idol"
			desc = {"
			+3 speed,
			all your attacks become criticals,
			swingspeed doubled,
			all arrows triple fire, "}
			epic_use(mob/m)
				if(..() != 0)

					m.wind_epic()
		earth_idol

			icon_state = "earth idol"
			desc = {"
			melee attacks have max reach and are all spins,
			all damage halved,
			speed max is 3,
			pulse every second, "}
			epic_use(mob/m)
				if(..() != 0)

					m.earth_epic()