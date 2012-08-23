
// File:    medals.dm
// Library: Forum_account.Hub
// Author:  Forum_account
//
// Contents:
//   This file contains client procs that add/remove medals
//   and get a list of all medals the client has.

client
	var
		list/medals

	proc
		AddMedal(medal)
			if(medals && (medal in medals))
				return 1

			var/result = world.SetMedal(medal, key)

			if(isnull(result))
				return 0

			if(medals)
				medals += medal

			return 1

		RemoveMedal(medal)
			if(medals && !(medal in medals))
				return 1

			var/result = world.ClearMedal(medal, key)

			if(isnull(result))
				return 0

			if(medals)
				medals -= medal

			return 1

		GetMedals()

			if(medals)
				return medals

			var/result = world.GetMedal("", src)

			if(isnull(result))
				return null

			medals = params2list(result)
			return medals
