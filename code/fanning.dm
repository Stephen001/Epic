proc
	isfan(client/c)
		if(c.key in Get_Fans(world.hub))
			return 1
		return 0
	Get_Fans(hub)
		var/p = RetrievePage(hub,"fans")
		. = list()
		if(!findtext(p,"guild_member_list"))
			return
		var/pfans = copytext(p,findtext(p,"guild_member_list")+30, findtext(p,"bottom_space"))
		while(findtext(pfans,"[html_encode("\">")]"))
			var
				a = findtext(pfans, "[html_encode("\">")]")
				keyg
				m
			if(findtext(copytext(pfans, a, a+16), "[html_encode("<img")]"))
				pfans = copytext(pfans, a+16)
				a = findtext(pfans, "[html_encode("\">")]")
				m = 1
			var/b = findtext(pfans, "[html_encode("</a>")]", a)
			keyg = copytext(pfans, a+9, b)
			pfans = (copytext(pfans, b+4))
			.[keyg] = (m? "MEMBER" : )
	RetrievePage(page,type)
		var/append
		switch(type)
			if("fans") append = "&command=view_fans"
		page = "http://byond.com/hub/[page][append]"
		var/list/http[]=world.Export(page)
		if(!http)
			world << "FAIL @ [page]"
		return html_encode(file2text(http["CONTENT"]))
