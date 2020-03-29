/mob/proc/equip_to_slot(obj/item/Item, slot, redraw_mob = TRUE)


/mob/proc/equip_to_slot_if_possible(obj/item/Item, slot, disable_warning = 1, redraw_mob = TRUE)
	if(!mob_can_equip(src, Item, slot, disable_warning))
		return FALSE

	var/world_time = world.timeofday

	//Pre-equip intercepts here to let the item know it's about to be equipped
	if(Item.pre_equip(src, slot))
		return FALSE

	//Pre-equip can take time
	if(world_time != world.timeofday)
		if(!mob_can_equip(src, Item, slot, disable_warning))
			return FALSE

	if(Item.is_equipped())
		var/mob/Wearer = Item.loc
		if(!Wearer.unEquip(Item))
			return FALSE
	else if(istype(Item.loc, /obj/item/weapon/storage))
		var/obj/item/weapon/storage/S = Item.loc
		S.remove_from_storage(Item, null)
	if(istype(Item, /obj/item/weapon/gun) && istype(usr, /mob/living) && slot != slot_l_hand && slot != slot_r_hand)
		var/obj/item/weapon/gun/G = Item
		if(G.safety == 0 && prob(40))
			var/mob/living/L = usr
			var/organ_holder = L.targeted_organ
			L.targeted_organ = pick(BP_L_LEG,BP_R_LEG)
			G.Fire(L, L, pointblank=1)
			L.targeted_organ = organ_holder
			L.remove_cursor()


	equip_to_slot(Item, slot, redraw_mob) //This proc should not ever fail.

	return TRUE

//	This function will attempt to replace item in slot
//	proc will return TRUE if we succeded to equip item and FALSE otherwise
//	put_in_storage - if TRUE will put replaced item into available storage or hands or drop if 'drop_if_unable_to_store' flag is TRUE, otherwise will delete it
//	drop_if_unable_to_store - if TRUE will drop item on turf if failed to store it, otherwise will delete it
//	skip_covering_check - if TRUE will ignore slot inaccessibleness for example helmet will prevent equip cause it covering slot
//	del_if_failed_to_equip - if TRUE will delete the item we attempting to replace with
/mob/proc/replace_in_slot(obj/item/Item, slot, put_in_storage = FALSE, drop_if_unable_to_store = FALSE, skip_covering_check = FALSE, del_if_failed_to_equip = FALSE)
	var/failed = FALSE
	if(can_equip(Item, slot, disable_warning = TRUE, skip_item_check = TRUE, skip_covering_check = skip_covering_check))	//checking if mob is able to equip it, but not checking if slot is occupied or covered
		var/obj/item/old_item = get_equipped_item(slot)
		if(old_item)
			unEquip(old_item)
			if(put_in_storage)	//trying to store item, if failed we delete it
				var/obj/item/weapon/storage/S = equip_to_storage(old_item)
				if(S)
					to_chat(src, SPAN_NOTICE("Storing your \the [old_item] into \the [S]!"))
				else if (equip_to_slot_if_possible(old_item, slot_l_hand, disable_warning = TRUE))
					to_chat(src, SPAN_NOTICE("Putting your \the [old_item] into your left hand!"))
				else if (equip_to_slot_if_possible(old_item, slot_r_hand, disable_warning = TRUE))
					to_chat(src, SPAN_NOTICE("Putting your \the [old_item] into your right hand!"))
				else if (drop_if_unable_to_store)
					var/turf/T = get_turf(src)
					Item.forceMove(T)
				else
					qdel(old_item)
			else
				qdel(old_item)
		if(!equip_to_slot_if_possible(Item, slot, disable_warning = TRUE))	//should not happen but just in case
			log_debug("Item could not be equipped despite the fact it passed checks.")
			failed = TRUE
	else
		failed = TRUE

	if(failed)
		if(del_if_failed_to_equip)
			qdel(Item)
		return FALSE

	return TRUE


/mob/proc/equip_to_slot_or_del(obj/item/Item, slot)
	. = equip_to_slot_if_possible(Item, slot, disable_warning = TRUE, redraw_mob = FALSE)
	if(!.)
		qdel(Item)



//TODO: get rid of that list.

//The list of slots by priority. equip_to_appropriate_slot() uses this list.
//Doesn't matter if a mob type doesn't have a slot.
var/list/slot_equipment_priority = list(
	slot_back,
	slot_wear_id,
	slot_w_uniform,
	slot_wear_suit,
	slot_wear_mask,
	slot_head,
	slot_shoes,
	slot_gloves,
	slot_l_ear,
	slot_r_ear,
	slot_glasses,
	slot_belt,
	slot_s_store,
	slot_accessory_buffer,
	slot_l_store,
	slot_r_store
)


/mob/proc/equip_to_appropriate_slot(obj/item/Item)
	if(!istype(Item))
		return FALSE
	for(var/slot in slot_equipment_priority)
		if(equip_to_slot_if_possible(Item, slot, disable_warning = TRUE))
			return slot
	return FALSE


/mob/proc/equip_to_storage(obj/item/Item)
	// Try to place it in any item that can store stuff, on the mob.
	for(var/obj/item/weapon/storage/S in get_equipped_items())
		if(S.can_be_inserted(Item, TRUE))
			Item.forceMove(S)
			return S


/mob/living/carbon/human/equip_to_storage(obj/item/Item)
	// Try put it in their backpack
	if(istype(src.back,/obj/item/weapon/storage))
		var/obj/item/weapon/storage/backpack = src.back
		if(backpack.can_be_inserted(Item, TRUE))
			Item.forceMove(src.back)
			return backpack
	return ..()
