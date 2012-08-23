var/list/dyeCache = list();

mob

	var
		item/vanity = list()
		item/orb
	proc
		can_dye(item/i,item/dye)

			if(istype(dye,/item/dye))
				if(istype(i,/item/weapon/))
					return 1
				if(istype(i,/item/apparel/armor))
					return 1
				if(istype(i,/item/dye))
					return 1
			return 0

		dye(item/i,item/dye/dye)

			if(istype(i,/item/dye))

				var/item/dye/I = i

				I.red += dye.red
				I.blue += dye.blue
				I.green += dye.green

				var/icon/I2 = icon('item.dmi',icon_state = "dye")

				I2.Blend(rgb(I.red,I.green,I.blue))
				I.icon = I2



			else
				/*
				var/icon/I = icon(i.icon,i.icon_state)
				I.Blend(rgb(dye.red,dye.green,dye.blue))
				i.icon = I

				i.cg += dye.green
				i.cr += dye.red
				i.cb += dye.blue
				*/
				i.icon = createIconDye( i.icon, rgb(dye.red, dye.green, dye.blue) );

			return 1

proc
	createIconDye(var/icon, var/color) {
		var/id = "[icon]+[color]";
		if(!dyeCache.Find(id)) {
			var/icon/I = new(icon);
			I.Blend( color, ICON_ADD );
			dyeCache.Add(id);
			dyeCache[id] = I;
		}
		return dyeCache[id];
	}
