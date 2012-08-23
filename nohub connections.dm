mob

	verb

		connect_to_host()

			var/X = input(src,"Type in the address of the world you are joining. (This is the BYOND address, which the host can provide to you via the BYOND pager.)") as null|text
			if(X && findtext(X,"byond://"))
				src << link(X)
			else
				alert("Incorrect format for link, or no link provided")

		host_game()

			var/X = input(src,"Type in the port number to host the game on.") as null|num

			if(X == null)
				X = 0

			if(X!=null && world.OpenPort(X))

				alert("The world is now open to connections.")
				world.log << {"The game is now being hosted on this link:<br>byond://[world.address]:[world.port]"}
			else
				alert("Failed to host world on port [X]")