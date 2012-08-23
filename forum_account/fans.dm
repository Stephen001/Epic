
// File:    fans.dm
// Library: Forum_account.Hub
// Author:  Forum_account
//
// Contents:
//   This file contains the world.GetFans proc, which returns
//   a list of users who are fans of the specified hub entry.

world
	proc
		GetFans(author = "", game = "")

			// If neither value is specified, use world.hub to get
			// the author and game.
			if(!author && !game)
				var/pos = findtext(hub, ".")
				author = copytext(hub, 1, pos)
				game = copytext(hub, pos + 1)

			// if only the author is specified (ex: "Forumaccount.TestGame")
			// we split the string to get the author and game.
			else if(author && !game)
				var/pos = findtext(author, ".")
				game = copytext(author, pos + 1)
				author = copytext(author, 1, pos)

			var/url = "http://www.byond.com/games/[author]/[game]?command=view_fans"

			var/html = __http(url)

			if(!html)
				return null

			// trim the HTML to just the part we need
			var/start = findtext(html, {"<div class="guild_member_list">"})

			if(!start)
				return list()

			var/end = findtext(html, "</div>", start)

			html = copytext(html, start, end)

			// pull each user name out of the HTML.
			var/list/fans = list()
			var/pos = findtext(html, " <a href=")

			while(pos)

				var/start_pos = findtext(html, ">", pos)
				var/end_pos = findtext(html, "</a>", pos)

				var/name = copytext(html, start_pos + 1, end_pos)
				fans += name

				pos = findtext(html, " <a href=", pos + 1)

			return fans
