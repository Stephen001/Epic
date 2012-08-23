mob
	var/emote=null

	proc/emoticon(t)

		if(!t) return

		if(emote) return

		emote = t

		spawn(15)
			if(emote == t)

				emote = null