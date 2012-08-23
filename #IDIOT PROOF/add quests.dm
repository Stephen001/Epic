quest_npc

	/*
	EXAMPLE:

	technician
		qname = "kill_master_orc"
	*/
	dont_reset = 1
	team=0
	movement()
		return
	New()
		..()
		icon = Icon(icon,icon_state,dir2angle(dir))
	emo
		name = "depressed man"
		qname = "kill_arcane_orc"
	king
		qname = "kill_chaos_elf"
		icon_state = "elven armor"
	escapee
		qname = "kill_guard_rat"
		icon_state = "elven gear"
	elven_chef
		qname = "kill_dark_elf_brute"
		icon_state = "dark elf chef"
	scared_elf
		qname = "kill_dark_elf_elite_miner"
		icon_state = "elven gear"

	military_elf
		qname = "kill_elf_traitor"
		icon_state = "elven tank suit"
	dwarven_blacksmith
		qname = "kill_dwarven_blacksmith_leader"
		icon_state = "dwarven blacksmith armor"
	dwarven_ruins_expert
		qname = "kill_dwarven_archaeologist"
		icon_state = "dwarven tank armor"
	dwarven_mage
		qname = "kill_sand_monster"
		icon_state = "storm cloth"
	stranger
		qname = "kill_swamp_beast"
		icon_state = "human"
	cloaked_figure
		qname = "kill_jones"
		icon_state = "human armor"
	aggravated_man
		qname = "find_ritual_dagger"
		icon_state = "scientist hood"
		dir = EAST
	wind_worshipper
		qname = "kill_wind_god"
		icon_state = "ventus"
		dir = EAST
	water_worshipper
		qname = "kill_water_god"
		icon_state = "aquos"
		dir = WEST
	fire_worshipper
		qname = "kill_fire_god"
		icon_state = "pyros"
		dir = WEST
	chaos_worshipper
		qname = "kill_chaos_god"
		icon_state = "chaos"
		dir = NORTH
	new_demon
		qname = "kill_trial_guard"
		icon_state = "demon2"
		dir = EAST
	demon_revolter
		qname = "kill_demon_lord"
		icon_state = "demon2"
		dir = NORTH
	keeper_of_the_above
		qname = "kill_fallen_angel"
		icon_state = "demon2"
		dir = EAST
	demon_lord
		qname = "kill_blazekid"
		icon_state = "demon lord armor"
		dir = WEST
	space_miner
		qname = "kill_ancient_alien"
		icon_state = "person"
		dir = WEST
	captn
		name = "captain"
		qname = "kill_Space_Robot"
		icon_state = "person"
		dir = WEST
	researcher
		qname = "kill_mummy_king"
		icon_state = "person"
		dir = WEST

	clockwerk

		icon_state = "cog armor"
		dir = SOUTH

		engine_worker
			qname = "kill_clock_reaper"
		record_keeper
			qname = "kill_necrospawn_gallbeast"
		upperpart_resident
			qname = "kill_necrospawn_headsman"
		sandshifter
			qname = "kill_clockturne"



quest

	/*
	FOLLOW-UP EXAMPLE:

	kill_master_orc

		name = "kill master orc"
		desc = "the orcs took my lab"
		reward = list("100","weapon/katana") // this list works the same way adding items to chests works

	*/
	kill_arcane_orc

		qname = "Slay the arcane orc"
		name = "kill arcane orc"
		desc = "the arcane orc leads the orc fortress ahead. please avenge my family..."
		reward = list("book/rush","100") // this list works the same way adding items to chests works
	kill_elf_traitor

		qname = "Stop the elf traitor"
		name = "kill elf traitor"
		desc = "the captain defected. he's now running the evil mine with the shadow elves."
		reward = list("50","apparel/armor/elven_tank_suit") // this list works the same way adding items to chests works
	kill_chaos_elf

		qname = "Ransack the camp"
		name = "kill chaos elf"
		desc = "the camp of dark elves has been peskering us for a long time."
		reward = list("30","weapon/bow/elven_bow","apparel/armor/elven_gear")

	kill_guard_rat
		qname = "Rescue the prisoners"
		name = "kill guard rat"
		desc = "save the prisoners... i escaped but my friends couldn't make it."
		reward = list("20","potion/health_potion","potion/health_potion","potion/health_potion")
	kill_dark_elf_brute
		qname = "Slay the brute"
		name = "kill dark elf brute"
		desc = "i used to be a dark elf, but then i escaped. now they are after me."
		reward = list("50","book/megaice","book/shadow_sickle")
	kill_dark_elf_elite_miner
		qname = "Save the elf wife"
		name = "kill dark elf elite miner"
		desc = "save my wife... she's being guarded by miners farther into the mine."
		reward = list("20","weapon/blade/elven_blade","apparel/shield/elven_shield")
	kill_dwarven_blacksmith_leader
		qname = "Take down the blacksmith leader"
		name = "kill dwarven blacksmith leader"
		desc = "that guy might be helping the orcs."
		reward = list("30","weapon/axe/dwarven_axe")
	kill_dwarven_archaeologist
		qname = "Save the library"
		name = "kill dwarven archaeologist"
		desc = "that place is an ancient library. the dwarven renegades went in here."
		reward = list("34","book/lightning_bolt")
	kill_sand_monster
		qname = "Slay the sand beast"
		name = "kill sand monster"
		desc = "i sent my soldiers into the desert"
		reward = list("36","book/heart")
	kill_swamp_beast
		qname = "Stop the spreading plague"
		name = "kill swamp beast"
		desc = "we need help curing the plague"
		reward = list("38","apparel/armor/swamp_tank_armor")
	kill_jones
		qname = "Kill the infected leader"
		name = "kill jones"
		desc = "this once was a great city. reclaim the town."
		reward = list("40","weapon/axe/soulkeeper")
	find_ritual_dagger
		qname = "Retrieve the ritual dagger"
		name = "find ritual dagger"
		desc = "they stole my experiment. i am ANGREH."
		reward = list("42","orb/orb_of_summoners","book/summon_nurse")
	kill_wind_god
		qname = "Calm the wind god"
		name = "kill wind god"
		desc = "calm the wind god. we can not stop him."
		reward = list("45")
	kill_water_god
		qname = "Calm the water god"
		name = "kill water god"
		desc = "save the temple from the angry water spirit inside."
		reward = list("200","book/water")
	kill_fire_god
		qname = "Calm the fire god"
		name = "kill fire god"
		desc = "Extinguish the fire god's hatred. He may destroy huzza"
		reward = list("200","book/blaze")
	kill_chaos_god
		qname = "Save the world"
		name = "kill chaos god"
		desc = "Save the world"
		reward = list("500")
	kill_trial_guard
		qname = "Pass the trials"
		name = "kill trial guard"
		desc = "Help me pass the trial"
		reward = list("apparel/armor/wanderers_robes")
	kill_fallen_angel
		qname = "Destroy the angel"
		name = "kill fallen angel"
		desc = "Save the upper realm"
		reward = list("apparel/armor/wanderers_armor")
	kill_demon_lord
		qname = "Revolt against the Demon Lord"
		name = "kill demon lord"
		desc = "Help us revollt"
		reward = list("apparel/armor/wanderers_leather")
	kill_blazekid
		qname = "Slay the king of demons"
		name = "kill blazekid"
		desc = "In order to leave this realm, you must kill the king."
		reward = list("1000")
	kill_mummy_king
		qname = "Kill the mummy king"
		name = "kill mummy king"
		desc = "He's come back from the grave... send him back"
		reward = list("1000")
	kill_Space_Robot
		qname = "Deactivate the Space Robot"
		name = "kill Space Robot"
		desc = "Crash their ship"
		reward = list("1000")
	kill_ancient_alien
		qname = "Clear the space mine"
		name = "kill ancient alien"
		desc = "save our miners"
		reward = list("1000")

	kill_clock_reaper
		qname = "Fix the time engine"
		name = "kill clock reaper"
		desc = "A monster got into the steamworks."
		reward = list("1000")
	kill_necrospawn_gallbeast
		name = "kill necrospawn gallbeast"
		qname = "Slay the gallbeast"
		desc = "The necrospawn broke into the Halls of History."
		reward = list("1000")
	kill_necrospawn_headsman
		name = "kill necrospawn headsman"
		qname = "Execute an executioner"
		desc = "These monsters are ravaging the upperparts."
		reward = list("1000")
	kill_clockturne
		name = "kill clockturne"
		qname = "Exorcise Clockturne"
		desc = "The great clock has been corrupted."
		reward = list("1000")
//NOTE: "kill (monster)" quests will automatically program themselves in. Other kinds however must be programmed by me.



