
// File:    utilities.dm
// Library: Forum_account.Hub
// Author:  Forum_account
//
// Contents:
//   This file contains some procs that are used by
//   servers.dm.

proc
	// make an HTTP request to the specified URL and return
	// the content in the response.
	__http(url)
		var/list/http = world.Export(url)

		if(!http)
			return ""

		var/f = http["CONTENT"]
		if(f)
			return file2text(f)
		else
			return ""
