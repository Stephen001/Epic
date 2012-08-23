mob

	var/current_music=null
	var/PLAY_MUSIC=1

	var/sound/music

	verb/musicoff()
		if(PLAY_MUSIC==1)
			PLAY_MUSIC=0
			music.status = SOUND_MUTE
			src << music

		else
			PLAY_MUSIC=1

			play_music(music)

	proc/play_sound(soundfile)
		src << sound(soundfile,volume=rand(50,100))
	proc/view_sound(soundfile,viewr)
		for(var/mob/m in view(viewr,src))
			m.play_sound(soundfile)
	proc/play_music(musicfile)

		if(musicfile <> current_music)
			current_music = musicfile

			if(music)
				music.status = SOUND_MUTE
				src << music


			music =  sound(musicfile,repeat=1,wait=0,channel=2)
			if(PLAY_MUSIC)
				src << music
		else
			return
turf
	var/has_music=0
	var/music
area
	music

		var/music

	//	Entered(mob/m)
	//		if(istype(m) && m.client && m.PLAY_MUSIC==1)
	//			m.play_music(music)
		New()
			..()
			spawn()
				for(var/turf/t in src)
					t.has_music=1
					t.music = music
		final_boss_theme
			music = 'final boss theme.ogg'
		spine_theme
			music = 'spine theme.ogg'
		desert_theme
			music = 'desert theme.ogg'
		portal_theme
			music = 'portal theme.ogg'
		dungeon_boss
			music = 'dungeon boss.ogg'
		title
			music = 'title.ogg'
		dungeon_theme
			music = 'dungeons.ogg'
		dungeon_theme_2
			music = 'dungeon theme 2.ogg'
		first_town_theme
			music = 'first town theme.ogg'
		grouhl_theme
			music = 'grouhl theme.ogg'
		intro
			music = 'intro.ogg'
		mysterious_dungeon
			music = 'mysterious dungeon.ogg'
		rossor_theme
			music = 'rossor theme.ogg'
		ruins_theme
			music = 'ruins theme.ogg'
		huzza_theme
			music = 'huzza theme.ogg'
		underlife_theme
			music = 'underlife theme.ogg'
		huzza_boss
			music = 'huzza boss.ogg'
		gallax_theme
			music = 'gallax theme.ogg'
		skyrim_theme
			music = 'skyrim theme.ogg'
		sirius_theme
			music  = 'sirius.wav'
		clockwerk_theme
			music = 'clockwerk theme.ogg'
		laserdog_theme
			music = 'laserdog theme.wav'