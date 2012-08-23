
/*
Example:

mob
	verb
		Test()
			var/ini_reader/IRead = new("TestINI.ini", INIREADER_INI)
			var/list/Dict = IRead.ReadSetting("text")
			if( Dict )
				world << Dict["intro"]
			Dict = IRead.ReadSetting("settings")
			if( Dict )
				world << "Settings: Show: [Dict["show"]]"
			Dict = IRead.ReadSetting("list")
			if( Dict )
				var/slist/L = Dict["MyList"]
				world << L.Item[1]
			IRead.SaveConfiguration("OutINI.ini")
*/

var/dversion = 0.9
world



	proc
		readINI()
			var/ini_reader/IRead = new("world-config.ini", INIREADER_INI)
			var/list/Dict = IRead.ReadSetting("config")
			if(Dict == null)
				return
			world.status = Dict["status"] + " v. [dversion]"
			world.name = "Epic " + Dict["world_name"]
			reboot_time = text2num(Dict["reboot_time"])
			if(!reboot_time)
				reboot_time = 5

world
	New()
		..()
		status = "v. [dversion]"
		name = "Epic [dversion]"
		readINI()
		reboot_wait()