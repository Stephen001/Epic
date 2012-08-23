

var/reboot_time = 5

world

	proc

		reboot_wait()

			spawn(reboot_time * 36000)

				messagee("<b>World rebooting in 10 seconds")
				sleep(100)
				messagee("<b>World rebooting in 5 seconds")
				sleep(50)
				messagee("<b>World rebooting now..")
				world.Reboot()