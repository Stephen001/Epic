mob
	proc/orb(t)

		if(orb && orb.passive == t)
		//	var/item/orb/O = orb
			return orb:orbname
		else
			return 0

