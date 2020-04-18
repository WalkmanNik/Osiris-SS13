//Prosthesis ====================================

/datum/design/research/item/mechfab/prosthesis
	category = CAT_PROSTHESIS
	starts_unlocked = TRUE

/datum/design/research/item/mechfab/prosthesis/r_arm
	build_path = /obj/item/organ/external/robotic/r_arm

/datum/design/research/item/mechfab/prosthesis/l_arm
	build_path = /obj/item/organ/external/robotic/l_arm

/datum/design/research/item/mechfab/prosthesis/r_leg
	build_path = /obj/item/organ/external/robotic/r_leg

/datum/design/research/item/mechfab/prosthesis/l_leg
	build_path = /obj/item/organ/external/robotic/l_leg

/datum/design/research/item/mechfab/prosthesis/groin
	build_path = /obj/item/organ/external/robotic/groin

//Modules ====================================

/datum/design/research/item/mechfab/modules
	category = CAT_PROSTHESIS

/datum/design/research/item/mechfab/modules/armor
	name = "subdermal body armor"
	build_path = /obj/item/organ_module/armor

/datum/design/research/item/mechfab/modules/armblade
	name = "Embedded armblade"
	build_path = /obj/item/organ_module/active/simple/armblade

/datum/design/research/item/mechfab/modules/runner
	name = "Mechanical muscles"
	build_path = /obj/item/organ_module/muscle

/datum/design/research/item/mechfab/modules/power_muscle
	name = "Mechanical power muscle"
	build_path = /obj/item/organ_module/power_muscle

/datum/design/research/item/mechfab/modules/eyes_coordinators
	name = "Bionic eyes coordinators"
	build_path = /obj/item/organ_module/eyes_coordinators

/datum/design/research/item/mechfab/modules/neuroimplant
	name = "Neuroimplant"
	build_path = /obj/item/organ_module/neuroimplant



/datum/design/research/item/mechfab/modules/multitool/surgical
	build_path = /obj/item/organ_module/active/simple/surgical
	name = "Embedded surgical multitool"

/datum/design/research/item/mechfab/modules/multitool/engineer
	build_path = /obj/item/organ_module/active/simple/engineer
	name = "Embedded Technomancer multitool"

/datum/design/research/item/mechfab/modules/multitool/miner
	build_path = /obj/item/organ_module/active/multitool/miner
	name = "Embedded mining multitool"

/datum/design/research/item/mechfab/modules/hud/med
	build_path = /obj/item/organ_module/active/hud/med
	name = "Embedded Med Hud"

/datum/design/research/item/mechfab/modules/hud/sec
	build_path = /obj/item/organ_module/active/hud/sec
	name = "Embedded Security Hud"

/datum/design/research/item/mechfab/modules/hud/night
	build_path = /obj/item/organ_module/active/hud/night
	name = "Embedded Night Vision Goggles"

/datum/design/research/item/mechfab/modules/hud/thermal
	build_path = /obj/item/organ_module/active/hud/thermal
	name = "Embedded Thermal Goggles"

/datum/design/research/item/mechfab/modules/holster
	build_path = /obj/item/organ_module/active/simple/holster
	name = "Compact Embedded Holster"

//Implants
/datum/design/research/item/implant
	build_type = PROTOLATHE | MECHFAB
	name_category = "implantable biocircuit"
	category = CAT_PROSTHESIS

/datum/design/research/item/implant/chemical
	name = "chemical"
	build_path = /obj/item/weapon/implantcase/chem
	sort_string = "MFAAA"

/datum/design/research/item/implant/freedom
	name = "freedom"
	build_path = /obj/item/weapon/implantcase/freedom
	sort_string = "MFAAB"
