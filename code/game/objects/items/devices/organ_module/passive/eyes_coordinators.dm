/obj/item/organ_module/eyes_coordinators
	name = "bionic eyes coordinators"
	desc = "A bionic coordinators that attached to human eyes, increasing aiming of human eyes."
	matter = list(MATERIAL_STEEL = 3, MATERIAL_SILVER = 5, MATERIAL_GOLD = 1)
	allowed_organs = list(BP_HEAD)
	icon_state = "eyes_coordinators"

/obj/item/organ_module/eyes_coordinators/onInstall(obj/item/organ/external/E)
	owner.stats.addTempStat(STAT_VIG, 10, INFINITY, "bionic eyes coordinators")

/obj/item/organ_module/eyes_coordinators/onRemove(obj/item/organ/external/E)
	owner.stats.removeTempStat(STAT_VIG, "bionic eyes coordinators")