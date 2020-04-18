/obj/item/organ_module/neuroimplant
	name = "neuroimplant"
	desc = "A neuroimplant that attached to human brain, increasing intellect of a human."
	matter = list(MATERIAL_STEEL = 3, MATERIAL_SILVER = 5, MATERIAL_GOLD = 1, MATERIAL_PLASTEEL = 1)
	allowed_organs = list(BP_HEAD)
	icon_state = "neuroimplant"

/obj/item/organ_module/neuroimplant/onInstall(obj/item/organ/external/E)
	owner.stats.addTempStat(STAT_COG, 10, INFINITY, "neuroimplant")

/obj/item/organ_module/neuroimplant/onRemove(obj/item/organ/external/E)
	owner.stats.removeTempStat(STAT_COG, "neuroimplant")