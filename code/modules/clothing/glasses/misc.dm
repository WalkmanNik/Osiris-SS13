/obj/item/clothing/glasses/eyepatch
	name = "eyepatch"
	desc = "Йааар."
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = 0

/obj/item/clothing/glasses/monocle
	name = "monocle"
	desc = "Такой красивый окуляр!"
	icon_state = "monocle"
	item_state = "headset" // lol
	body_parts_covered = 0

/obj/item/clothing/glasses/regular
	name = "Prescription Glasses"
	desc = "Сделано Nerd. Co."
	icon_state = "glasses"
	item_state = "glasses"
	prescription = 1
	body_parts_covered = 0

/obj/item/clothing/glasses/regular/scanners
	name = "Scanning Goggles"
	desc = "Очень странной формы очки с торчащими по бокам кусочками проволоки. Из них доносится тихое жужжание."
	icon_state = "uzenwa_sissra_1"

/obj/item/clothing/glasses/regular/hipster
	name = "Prescription Glasses"
	desc = "Сделано Uncool. Co."
	icon_state = "hipster_glasses"
	item_state = "hipster_glasses"

/obj/item/clothing/glasses/threedglasses
	desc = "Давным-давно люди использовали эти очки для получения трехмерных изображений с экранов."
	name = "3D glasses"
	icon_state = "3d"
	item_state = "3d"
	body_parts_covered = 0

/obj/item/clothing/glasses/gglasses
	name = "Green Glasses"
	desc = "Лесные зеленые очки, вроде тех, что надевают, когда вынашивают отвратительный план."
	icon_state = "gglasses"
	item_state = "gglasses"
	body_parts_covered = 0

/obj/item/clothing/glasses/sunglasses
	desc = "Странная древняя технология, используемая для обеспечения рудиментарного прикрытия глаз. Усиленное экранирование блокирует множество вспышек."
	name = "sunglasses"
	icon_state = "sun"
	item_state = "sunglasses"
	darkness_view = -1
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/glasses/sunglasses/blindfold
	name = "blindfold"
	desc = "Закрывает глаза, видно ровно нифига."
	icon_state = "blindfold"
	item_state = "blindfold"
	tint = TINT_BLIND

/obj/item/clothing/glasses/sunglasses/blindfold/tape
	name = "length of tape"
	desc = "Это прочная самодельная повязка на глаза!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "tape_cross"
	item_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/glasses/sunglasses/prescription
	name = "prescription sunglasses"
	prescription = TRUE

/obj/item/clothing/glasses/sunglasses/big
	desc = "Странная древняя технология, используемая для обеспечения рудиментарного прикрытия глаз. Более крупное, чем в среднем, усиленное экранирование блокирует множество вспышек."
	icon_state = "bigsunglasses"
	item_state = "bigsunglasses"
