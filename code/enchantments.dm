
item

	var/enchantment/enchantment
	var/bprice=0
	var/ename
	var/passive = ""
	proc/add_enchantment(enchantment/e)

		if(istype(src,/item/enchantment_crystals/)) return

		var/X = e.apply(src)

		if(X)
			remove_enchantment()

			enchantment = e

			ename = "<font color=[e.color]>[e.name] "

			bprice = e.percent

			price += bprice


		return X

	proc/remove_enchantment()
		if(enchantment)
			ename = ""
			enchantment.remove(src)
			enchantment = null
			price -= bprice
			bprice = 0
	sun_crystal//crafting
		icon_state = "sun crystal"
		New()
			..()
			desc = "glows with power"
	sand_crystal//crafting
		icon_state = "sand crystal"
		New()
			..()
			desc = "feels hard and gritty"



	enchantment_crystals
		var/enchant
		var/base_e
		var/tier=1
		stackable=1
		New()
			..()
			enchant = "/enchantment/[base_e]/tier_[tier]"
			var/X = text2path(enchant)
			enchantment = new X
			desc = "enchants items with [base_e]"
		power
			base_e = "power"
			icon_state = "power crystal"
			brute_crystal
				tier = 1
			violent_crystal
				tier = 2
		agility
			base_e = "agility"
			icon_state = "agility crystal"
			lightweight_crystal
				tier = 1
			agile_crystal
				tier = 2
		defense
			base_e = "defense"
			icon_state = "defense crystal"
			tough_crystal
				tier = 1
			hard_crystal
				tier = 2
		drain
			base_e = "drain"
			icon_state = "drain crystal"
			vampiric_crystal
				tier = 1
			dark_crystal
				tier = 2
		mage
			base_e = "mage"
			icon_state = "mage crystal"
			magical_crystal
				tier = 1
			mystic_crystal
				tier = 2
		size
			base_e = "size"
			icon_state = "size crystal"
			large_crystal
				tier = 1
			huge_crystal
				tier = 2
		speed
			base_e = "speed"
			icon_state = "speed crystal"
			swift_crystal
				tier = 1
			sonic_crystal
				tier = 2
		stun
			base_e = "stun"
			icon_state = "stun crystal"
			solid_crystal
				tier = 1
			pulsing_crystal
				tier = 2
		sturdy
			base_e = "sturdy"
			icon_state = "sturdy crystal"
			strong_crystal
				tier = 1
			firm_crystal
				tier = 2
enchantment

	var/color = "blue"//color of enchantment name
	var/name//name of enchantment
	var/base_amount//not for editing
	var/percent//enchantment percent %

	proc/apply(item/I)//positive effect of enchantment

	proc/remove(item/I)//negative to remove


	power

		name = "brute"
		color = "red"

		apply(item/weapon/I)

			if(istype(I))
				if(istype(I,/item/weapon/bow/) || istype(I,/item/weapon/wire)) return 0

				base_amount = percent
				I.damage += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.damage -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 10
			name = "violent"
	speed

		name = "swift"
		color = "yellow"

		apply(item/weapon/I)

			if(istype(I))
				if(istype(I,/item/weapon/wire)) return 0
				if(istype(I,/item/weapon/bow/))
					base_amount = percent/2
					I.delay -= base_amount

					return 1
				else
					base_amount = percent
					I.swingspeed += base_amount
					return 1
			else
				return 0
		remove(item/weapon/I)

			if(istype(I,/item/weapon/bow/))
				I.delay += base_amount
			else
				I.swingspeed -= base_amount

			base_amount = 0

		tier_1
			percent = 5
		tier_2
			percent = 7
			name = "sonic"

	drain

		name = "vampiric"
		color = "purple"

		apply(item/weapon/I)

			if(istype(I))
				if(istype(I,/item/weapon/bow/) || istype(I,/item/weapon/wire)) return 0

				base_amount = percent
				I.absorb_mana += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.absorb_mana -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 10
			name = "dark"
	size

		name = "large"
		color = "teal"

		apply(item/weapon/I)

			if(istype(I))
				if(istype(I,/item/weapon/bow/) || istype(I,/item/weapon/wire)) return 0

				base_amount = percent
				I.w_range += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.w_range -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 7
			name = "huge"
	defense

		name = "tough"
		color = "green"

		apply(item/apparel/armor/I)

			if(istype(I))

				base_amount = percent
				I.defense += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.defense -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 10
			name = "hard"
	agility

		name = "light"
		color = "yellow"

		apply(item/apparel/armor/I)

			if(istype(I))

				base_amount = percent
				I.speedboost += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.speedboost -= base_amount
			base_amount = 0


		tier_1
			percent = 1
		tier_2
			percent = 2
			name = "agile"
	mage

		name = "magical"
		color = "blue"

		apply(item/apparel/armor/I)

			if(istype(I))

				base_amount = percent
				I.mage += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.mage -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 10
			name = "mystic"
	stun

		name = "solid"
		color = "yellow"

		apply(item/apparel/shield/I)

			if(istype(I))

				base_amount = percent
				I.delay += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.delay -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 10
			name = "pulsing"
	sturdy

		name = "sturdy"
		color = "green"

		apply(item/apparel/shield/I)

			if(istype(I))

				base_amount = percent
				I.defense += base_amount
				return 1
			else
				return 0
		remove(item/weapon/I)

			I.defense -= base_amount
			base_amount = 0


		tier_1
			percent = 5
		tier_2
			percent = 10
			name = "firm"