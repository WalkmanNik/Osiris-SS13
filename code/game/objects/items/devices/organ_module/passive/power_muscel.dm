/obj/item/organ_module/power_muscle
	name = "mechanical power muscle"
	desc = "A set of mechanical muscles designed to be implanted into arms, increasing strength beyond what human muscles are capable of."
	matter = list(MATERIAL_STEEL = 6, MATERIAL_SILVER = 5, MATERIAL_GOLD = 2, MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 1)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	icon_state = "power_muscle"

/obj/item/organ_module/power_muscle/onInstall(obj/item/organ/external/E)
	owner.stats.addTempStat(STAT_ROB, 10, INFINITY, "mechanical power muscle [E.name]")

/obj/item/organ_module/power_muscle/onRemove(obj/item/organ/external/E)
	owner.stats.removeTempStat(STAT_ROB, "mechanical power muscle [E.name]")