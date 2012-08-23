
var/crafts = list(

	"elven bow + shadow bow" = "weapon/bow/paradox_bow",//shoots 2x faster, 3 damage
	"archer gear + snow wolf pelt" = "apparel/armor/demon_archer_gear",//does a pulse with a wider range and delay
	"elven tank suit + tank armor" = "apparel/armor/shockwave_armor",//tank armor that does pulse
	"shadow hammer + dwarven sword" = "weapon/axe/malice_striker",//2 handed, +7 damage
	"elven shield + dark shield" = "apparel/shield/pacifix",//high defense but low delay
	"hard robes + dark elf mage cloth" = "apparel/armor/shadowmancer_robes",//super high mage, 2 speed but only 10 hp
	"mega ice staff + elven blade" = "weapon/axe/elven_scepter", //absorbs 5 mana with each attack, top tier
	"dark elf mage armor + dwarven fire robes" = "apparel/armor/molten_armor",
	"thunder robes + lightning staff" = "apparel/armor/storm_cloth",
	"ninja sword + dwarven bow" = "weapon/bow/ninja_star",
	"dark bow + heart staff" = "weapon/bow/bow_of_the_divine",
	"dragon armor + bone armor" = "apparel/armor/relic_armor",
	"dragon slayer + bone sword" = "weapon/sword/relic_sword",
	"sun crystal + sand crystal" = "apparel/armor/bone_armor",
	"spear + ninja star" = "weapon/sword/bone_sword",
	"summon lightning + summon thunder" = "book/summon_storm",
	"dark elf ninja suit + speed armor" = "apparel/armor/speed_gear",
	"ninja sword + mega magic staff" = "weapon/blade/burning_cutlass",
	"summon nurse + paradox bow" = "weapon/bow/love_bow",

	"sword + twister" = "weapon/bow/wind_blade",
	"wind armor + blood stained robes" = "apparel/armor/calypso_robes",

	"relic armor + water dagger" = "weapon/dirty_dagger",
	"relic blade + katana" = "weapon/blade/huge_katana",

	"flame shield + vapor shield" = "weapon/steam_shield",
	"dirty dagger + flame greatsword" = "apparel/armor/steam_armor",

	"plated chaos + demon archer gear" = "apparel/armor/sealed_demon_archer_gear",


	"flame greatsword + blaze staff" = "weapon/axe/hells_scythe",
	"worn out robes + shockwave armor" = "armor/apparel/kings_cape",
	"dirty dagger + elven sceptre" = "weapon/sword/kings_sceptre",
	"steam armor + calypso robes" = "apparel/armor/nebula_robes",
	"brain staff + leaf trap" = "book/sleep_trap",
	"ninja sword + hells scythe" = "weapon/blade/samurai_sword",
	"blaze staff + mega magic staff" = "book/explode",
	"scythe + scythe" = "weapon/axe/twin_scythe",


	"paradox bow + bow of the divine" = "weapon/bow/apocalypse_bow",
	"ipod + molten armor" = "apparel/armor/neon_armor",
	"vapor shield + wind armor" = "apparel/armor/ice_armor",

	"storm cloth + searing axe" = "weapon/axe/storm_axe",
	"dagger + blowpipe" = "weapon/rouge_slayer",
	"bow of the divine + love bow " = "weapon/divine_staff",
	"vortex + darkness wave" = "weapon/dark_staff",
	"tidal wave + twister" = "book/rough_seas",
	"kings sceptre + relic blade" = "weapon/staff_of_the_ancients",
	"raven armor + hawk armor" = "apparel/armor/aviator_gear",
	"snow staff + mummy robes" = "apparel/armor/snow_robes",

	"snow robes + steam armor" = "apparel/armor/overlord_steam_armor",
	"steam bow + photon cannon" = "weapon/bow/steam_cannon",
	"steam armor + cog armor" = "apparel/armor/grand_cog",
	"burning cutlass + flame greatsword" = "weapon/flaming_dagger",
	"malice striker + headsman axe" = "weapon/axe/nocturne",
	"cog armor + orb of ultramancers" = "orb/orb_of_steam",
	"calypso robes + darkfate cloak" = "apparel/armor/robes_of_prophecy",
	"steam armor + aviator gear" = "apparel/armor/nimble_gearworks",

)

sign
	clockwerk_signs

		steam_cannon
			msg = "steam bow + photon cannon = steam cannon"
		grand_cog
			msg = "steam armor + cog armor = grand cog"
		flaming_dagger
			msg = "burning cutlass + flame greatsword = flaming dagger"
		nocturne
			msg = "malice striker + headsman axe = nocturne"
		orb_of_steam
			msg = "cog armor + orb of ultramancers = orb of steam"
		robes_of_prophecy
			msg = "calypso robes + darkfate cloak = robes of prophecy"
		nimble_gearworks
			msg = "steam armor + aviator gear = nimble gearworks"

	buy_a_companion
		msg = "MERCENARIES FOR HIRE, JUST 1,000 GOLD! BUY TODAY!"
	ASDASDAFADASFADF
		msg = "Snow Robes + Steam Armor = Overlord Steam Armor"
	saviator
		msg = "Raven Armor + Hawk Armor = Aviator Gear"
	ssnowrobes
		msg = "Snow Staff + Mummy Robes = Snow Robes"
	saxe
		msg = "Storm Cloth + Searing Axe = Storm Axe"
	sslayer
		msg = "Dagger + Blowpipe = Rouge Slayer"
	sstaff
		msg = "Bow of the Divine + Love Bow = Divine Sttaff"
	sdstaff
		msg = "Vortex + Darkness Wave = Dark Staff"
	ssastaff
		msg = "Tidal Wave + Twister = Rough Seas"
	sroughseas
		msg = "Kings Sceptre + Relic Blade = Staff Of The Ancients"
	neon
		msg = "Ipod + Molten Armor = Neon Armor"
	ice
		msg = "Vapor Shield + Wind Armor = Ice Armor"
	wind2
		msg = "Wind armor + Blood stained robes = Calypso robes"
	water2
		msg = "Relic Blade + Katana = Huge Katana"
	fire2
		msg = "Flame Shield + Vapor Shield = Steam Shield"
	chaos
		msg = "Plated Chaos + Demon Archer Gear = Sealed Demon Archer Gear"
	chaos2
		msg = "Paradox bow + Bow of the Divine = Apocalypse Bow"
	priest
		msg = "Learn passive blessings from the priest using your hero points"
	craft1
		msg = "Flame Greatsword + Blaze Staff = Hells Scythe"
	craft2
		msg = "Worn Out Robes + Shockwave Armor = Kings Cape"
	craft3
		msg = "Dirty Dagger + Elven Sceptre = Kings Sceptre"
	craft4
		msg = "Steam Armor + Calypso Robes = Nebula Robes"
	craft5
		msg = "Brain Staff + Leaf Trap = Sleep Trap"
	craft6
		msg = "Ninja sword + Hells Scythe = Samurai Sword"
	craft7
		msg = "blaze staff + Mega Magic Staff = Explode"
	craft8
		msg = "Scythe + Scythe = Twin Scythe"//this wont work
mob


	proc/can_craft(item/I,item/I2)

		if(I == I2) return 0
		for(var/c in global.crafts)
		//	world << cq
			if(findtext(c,I.name))
				if(findtext(c,I2.name))
					return 1
		return 0

	proc/craft(item/I,item/I2)

		var/craft = null
		for(var/c in global.crafts)
		//	world << c
			if(findtext(c,I.name) && findtext(c,I2.name))
				craft = global.crafts[c]

		if(craft && I <> I2)
			var/X = text2path("/item/[craft]")
			items += new X
		else
			return

		src << "you successfully combine [I] and [I2]"
		src.damage_number("Successful craft!")
		src.hmenu.update(inview,src)
