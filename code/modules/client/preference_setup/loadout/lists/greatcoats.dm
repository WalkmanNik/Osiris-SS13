/datum/gear/greatcoats
	display_name = "black greatcoat"
	path = /obj/item/clothing/suit/greatcoat/black
	slot = slot_wear_suit
	sort_category = "Greatcoats"
	cost = 2

/datum/gear/greatcoats/New()
	..()
	var/gc_list = list(
		"Black (orange)"		= /obj/item/clothing/suit/greatcoat/black,
		"Black (blue)"			= /obj/item/clothing/suit/greatcoat/black/blue,
		"Black, cloaked"		= /obj/item/clothing/suit/greatcoat/black/cloaked
	)
	gear_tweaks += new /datum/gear_tweak/path(gc_list)


/datum/gear/greatcoat_gray
	display_name = "grey greatcoat"
	path = /obj/item/clothing/suit/greatcoat/gray
	slot = slot_wear_suit
	sort_category = "Greatcoats"
	cost = 2

/datum/gear/greatcoat_brown
	display_name = "brown greatcoat"
	path = /obj/item/clothing/suit/greatcoat/brown
	slot = slot_wear_suit
	sort_category = "Greatcoats"
	cost = 2

/datum/gear/greatcoat_brown/New()
	..()
	var/bgc_list = list(
		"Brown"			= /obj/item/clothing/suit/greatcoat/brown,
		"Brown (blue)"
	)
	gear_tweaks += new /datum/gear_tweak/path(bgc_list)

/datum/gear/greatcoat_ihs
	display_name = "ironhammer greatcoat"
	path = /obj/item/clothing/suit/greatcoat/ihs
	slot = slot_wear_suit
	sort_category = "Greatcoats"
	allowed_roles = list(JOBS_SECURITY)

/datum/gear/greatcoat_ihs/New()
	..()
	var/ihs_gc_list = list(
		"IHS"			= /obj/item/clothing/suit/greatcoat/ihs,
		"IHS (red)"		= /obj/item/clothing/suit/greatcoat/ihs/red,
		"IHS, cloaked"	= /obj/item/clothing/suit/greatcoat/ihs/ihs_coat_cloak
	)
	gear_tweaks += new /datum/gear_tweak/path(ihs_gc_list)

/datum/gear/greatcoat_command
	display_name = "command greatcoat"
	path = /obj/item/clothing/suit/greatcoat/command
	slot = slot_wear_suit
	sort_category = "Greatcoats"
	allowed_roles = list(JOBS_COMMAND)

/datum/gear/greatcoat_command/New()
	..()
	var/com_gc_list = list(
		"Command"			= /obj/item/clothing/suit/greatcoat/command,
		"Command, cloaked"	= /obj/item/clothing/suit/greatcoat/command/command_coat_cloak
	)
	gear_tweaks += new /datum/gear_tweak/path(com_gc_list)

/datum/gear/greatcoat_captain
	display_name = "captain greatcoat"
	path = /obj/item/clothing/suit/greatcoat/captain
	slot = slot_wear_suit
	sort_category = "Greatcoats"
	allowed_roles = list("Captain")

/datum/gear/greatcoat_captain/New()
	..()
	var/cap_gc_list = list(
		"Captain"			= /obj/item/clothing/suit/greatcoat/captain,
		"Captain, cloaked"	= /obj/item/clothing/suit/greatcoat/captain/captain_coat_cloak
	)
	gear_tweaks += new /datum/gear_tweak/path(cap_gc_list)
