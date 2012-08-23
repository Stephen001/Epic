
// File:    servers.dm
// Library: Forum_account.Hub
// Author:  Forum_account
//
// Contents:
//   This file contains a world proc that gets info
//   about all public servers that are running for
//   the specified game.

world
	proc
		// The world.GetServers() proc returns a list of /Server
		// objects which contain information about each public
		// server listed on the game's hub page. If no author and
		// game are specified, the values from the world.hub var
		// are used.
		//
		// This proc returns null if the hub could not be reached.
		GetServers(author = "", game = "")

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

			var/url = "http://www.byond.com/games/[author]/[game]&format=text"

			var/html = __http(url)

			if(!html)
				return null

			var/list/server_list = list()

			// import the text into a savefile
			var/savefile/f = new()
			f.ImportText("", html)

			// for each folder inside /world
			f.cd = "world"
			for(var/d in f.dir)

				// extract the information for that world
				f.cd = "/world/[d]"
				server_list += new /Server(f)

			return server_list

// The Server object contains information about a publicly listed server.
Server
	var
		name
		url
		version
		host
		status
		list/players

	New(savefile/f)
		url = f["url"]
		version = f["server_version"]
		host = f["host"]
		status = f["status"]
		players = f["players"]

		if(!players)
			players = list()