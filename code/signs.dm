sign
	parent_type = /mob

	density=0

	dont_reset = 1

	New()
	//	pixel_y=-32
		..()


	var/msg = ""

	icon = 'turf.dmi'
	icon_state = "sign"
	books
		icon_state = "readable book"
		New()
			msg = "\"[msg]\""


	companion_sign1
		msg = "The companion crystal allows you to summon your companion."
	companion_sign2
		msg = "Drag equipment onto your companion to equip them."
	companion_sign3
		msg = "Drag your companion onto your player to remove all items."


	F_keys
		msg = "Press the keys F3 - F7 to do emoticons."

	magebooks
		msg = "Spellbooks can also be used like weapons."
	magebooks2
		msg = "Dragging spellbooks onto hotslots equips them."

	escape
		msg = "Press Escape to leave a dungeon you've already completed at any time."


	magecraft
		msg = "Drag spellbooks onto armor to enchant them with special abilities."
	shifting
		msg = "Hold shift and move to strafe"
	chat
		msg = "Press enter to chat with online players"
	idols
		msg = "Activate your idol by pressing G once you have less than half of your HP."
	idols2
		msg = "Idols consume half of your HP, all your MP, and grant extreme power to the user."
	become_a_fan
		msg = {"<A HREF = "http://www.byond.com/games/YutPut/Epic?command=view_fans">Become a fan of Epic for free benefits!</A>"}
	shieldbump
		msg = "Use your sword while shielding to shield bump."
	presstab
		msg = "Press tab to use your race's active ability"
	presst
		msg = "Press T to quick-loot all gold, wire, keys, and charges"
	greatsword
		msg = "Greatswords can shield if you press the button they are not equipped to."
	helpspin
		msg = "Hold down the attack button to spin attack."
	helpsneak
		msg = "Attacks from behind on enemies who haven't spotted you are instant criticals."
	helptriple
		msg = "Charge your bow down long enough to fire three arrows at once."
	running
		msg = "Hold spacebar to run."
	runrez
		msg = "While running, you won't regain HP or MP"
	how_to_sell
		msg = "Drag items onto the X in your inventory to sell them."
	fire_craft1
		msg = "water dagger + flame greatsword = steam armor"
	quests
		msg = "Completing quests will also level you up."
	dungeonexit
		msg = "This portal takes you out of the dungeon. Completing dungeons levels you up."
	powerpad
		msg = "Certain power pads only power up if you stand on them."
	pushbox
		msg = "Red chests must be powered up by power pads or wires before they can be opened."
	asdf
		msg = "Click to equip your wire and click again to place it where you're standing."
	dungeonlevel
		msg = "The level required to enter a dungeon is displayed on its portal."
	s1

		msg = "Click to attack OR use P and O"

	s2
		msg = "Hold Q to view your inventory or look in a chest."

	s3
		msg = "Left or right click to equip a weapon"

	s4
		msg = "Equip your weapon! Enemies ahead!"
	s5

		msg = "Hold R to heal. DONT FORGET THAT!"

	pushitdamnit
		msg = "Carry this power box through the level to open the doors!"
	s6

		msg = "Stay alert. The boss is strong!"

	s7
		msg = "IMPORTANT: Read the signs on the way!"

	s8
		msg = "Healing using R requires mana"

	s9
		msg = "Push the box to power up this door."

	s10
		msg = "Unlock this chest with wires"

	s11
		msg = "Power turrets with wires."

	s12
		msg = "Beware of dark elves"
	s13
		msg = "Press F to use health potions"
	s14
		msg = "WARNING: Extreme danger this way!"
	s15
		msg = "Drag items on top of eachother to combine them at the anvil!"
	s16
		msg = "Crafting recipes are hidden in dungeons!"
	s17
		msg = "Recipe: Dark Elf Mage Armor + Dwarven Fire Robes = Molten Armor"
	s18
		msg = "Recipe: Thunder Robes + Lightning Staff = Storm Cloth"
	s19
		msg = "Some armors have a secret skill. Press I to use them!"
	s20
		msg = "Recipe: Elven Bow + Shadow Bow = Paradox Bow"
	s21
		msg = "Recipe: Archer Gear + Snow Wolf Pelt = Demon Archer Gear"
	s22
		msg = "Recipe: Elven Tank Suit + Tank Armor = Shockwave Armor"
	s23
		msg = "Recipe: Shadow Hammer + Dwarven Sword = Malice Striker"
	s24
		msg = "Recipe: Elven Shield + Dark Shield = Pacifix"
	s25
		msg = "Recipe: Hard Robes + Dark Elf Mage Cloth = Shadowmancer Robes"
	s26
		msg = "Recipe: Mega Ice Staff + Elven Blade = Elven Scepter"
	s27
		msg = "Drag crystals onto items to enchant them here."
	s28
		msg = "Recipe: Ninja Sword + Dwarven Bow = Ninja Star"
	s29
		msg = "Recipe: Dark Bow + Heart Staff = Bow Of The Divine"
	s30
		msg = "Recipe: Dragon Armor + Bone Armor = Relic Armor"//RELIC IS FOR 4th DWARVEN
	s31
		msg = "Recipe: Dragon Slayer + Bone Sword = Relic Blade"//RELIC IS FOR 4th DWARVEN
	s33
		msg = "Recipe: Sun Crystal + Sand Crystal = Bone Armor"
	s34
		msg = "Recipe: Spear + Ninja Star = Bone Sword"
	s35
		msg = "Use this portal to travel with E!"
	s36
		msg = "Recipe: Dark Elf Ninja Suit + Speed Armor = Speed Gear"
	s37
		msg = "Recipe: Ninja Sword + Mega Magic Staff = Burning Cutlass"
	s38
		msg = "Recipe: Lightning Summon + Thunder Summon = Storm Summon"
	s39
		msg = "Recipe: Paradox Bow + Summon Nurse = Love Bow"
	s40
		msg = "Recipe: Sword + Twister = Wind Blade"
	s41
		msg = "Recipe: Relic Blade + Katana = Huge Katana"
	s42
		msg = "Recipe: Water Armor + Flame Greatsword = Steam Armor"
	s43
		msg = "Recipe: Relic Armor + Water Dagger = Dirty Dagger"
	s44
		msg = "When you can't continue forward take a break and read a book, it might help you more than you think"

	r1
		msg = "Dwarven supplies"
		icon_state = "note"

		pixel_y = 0
