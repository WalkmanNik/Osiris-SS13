/datum/breakdown/positive
	start_message_span = "bold notice"
	icon_state = "positive"
	breakdown_sound = 'sound/sanity/sane.ogg'

/datum/breakdown/negative
	start_message_span = "danger"
	restore_sanity_pre = 25
	icon_state = "negative"
	breakdown_sound = 'sound/sanity/insane.ogg'


/datum/breakdown/common
	start_message_span = "danger"
	restore_sanity_pre = 25
	icon_state = "negative"
	breakdown_sound = 'sound/sanity/insane.ogg'




#define STALWART_THRESHOLD 30 // How damaged should owner be for Stalwart to be able to trigger

/datum/breakdown/positive/stalwart
	name = "Stalwart"
	duration = 0
	restore_sanity_post = 100

	start_messages = list(
		"Вы стойко перенесли боль и чувствуете блаженство.",
		"Вам кажется, что вы можете бросить вызов всему миру!",
		"Ваша боль больше вас не беспокоит.",
		"Вы чувствуете, как боль очищает ваш разум.",
		"Вы чувствуете боль, и в то же время чувствуете усиление!"
	)

/datum/breakdown/positive/stalwart/can_occur()
	return holder.owner.maxHealth - holder.owner.health > STALWART_THRESHOLD

/datum/breakdown/positive/stalwart/conclude()
	holder.owner.adjustBruteLoss(-25)
	holder.owner.adjustCloneLoss(-10)
	holder.owner.adjustFireLoss(-25)
	holder.owner.adjustOxyLoss(-45)
	holder.owner.adjustToxLoss(-25)
	holder.owner.reagents.add_reagent("tramadol", 5) // the way this works is silly as all fuck and should probably be fixed at some point
	..()



/datum/breakdown/positive/adaptation
	name = "Adaptation"
	duration = 0
	restore_sanity_post = 100

	start_messages = list(
		"Вы чувствуете, что трудности отточили ваш разум.",
		"Вам кажется, что вы начинаете привыкать.",
		"Вы чувствуете себя ментально подготовленным.",
		"Вы чувствуете себя на шаг впереди.",
		"Вы чувствуете, что у вас все под контролем."
	)

/datum/breakdown/positive/adaptation/conclude()
	holder.positive_prob = min(holder.positive_prob + 10, 100)
	holder.negative_prob = max(holder.negative_prob - 5, 0)
	holder.max_level = max(holder.max_level + 20, 0)
	..()



/datum/breakdown/positive/concentration
	name = "Absolute Concentration"
	duration = 20 MINUTES

	start_messages = list(
		"Вы фокусируетесь и чувствуете, как внутри вашего разума что-то меняется.",
		"Вы сделали первый шаг в просветлению.",
		"Вы оторваны от мира вокруг вас.",
		"Вы чувствуете железную волю.",
		"Вам больше ничего не мешает."
	)

/datum/breakdown/positive/concentration/New()
	..()
	restore_sanity_pre = holder.max_level

/datum/breakdown/positive/concentration/occur()
	++holder.sanity_invulnerability
	return ..()

/datum/breakdown/positive/concentration/conclude()
	--holder.sanity_invulnerability
	..()



/datum/breakdown/positive/determination
	name = "Determination"
	duration = 10 MINUTES
	restore_sanity_pre = 100

	start_messages = list(
		"Вы непобедимы!",
		"Вы неостановимы, вы неразрушимы!",
		"Вы - БОГ!",
		"Вы чувствуете поток адреналина, текущий в ваших венах. Ничто не может вам навредить!",
		"Вы научились устранять раны, которые убивают низших существ!"
	)
	end_messages = list(
		"Последняя капля адреналина покидает ваши вены. Вы чувствуете себя как нормальный человек."
	)

/datum/breakdown/positive/determination/occur()
	++holder.owner.shock_resist
	return ..()

/datum/breakdown/positive/determination/conclude()
	--holder.owner.shock_resist
	..()



/datum/breakdown/positive/lesson
	name = "A Lesson Learnt"
	duration = 0
	restore_sanity_post = 100

	start_messages = list(
		"Вы многому научились благодаря этому опыту.",
		"Вы вашем разуме что-то щелкнуло. Вы чувствуете себя более компетентным!",
		"Вам удалось извлечь урок из ошибкок прошлого.",
		"You take in the knowledge of your past experiences.",
		"Теперь все становится понятней!"
	)

/datum/breakdown/positive/lesson/conclude()
	for(var/stat in ALL_STATS)
		holder.owner.stats.changeStat(stat, rand(5,10))
	..()



/datum/breakdown/negative/selfharm
	name = "Self-harm"
	duration = 1 MINUTES
	restore_sanity_post = 70

	start_messages = list(
		"Вы больше не можете! Вы полностью потеряли контроль!",
		"Остановить, остановить! Вы сделаете что угодно, чтобы это остановить!",
		"Ваш разум ломается под весом того, что вы видели и прочувствовали!",
		"Ваш мозг молит о пощаде! Время закончить все это!",
		"Вы больше не можете выдержать давление! Вашу голову заполняют мысли о суициде!"
	)
	end_messages = list(
		"Вы чувствуете, как паника отступает. Может, жизнь не так уж плоха, в конце концов?"
	)

/datum/breakdown/negative/selfharm/update()
	. = ..()
	if(!.)
		return
	var/datum/gender/G = gender_datums[holder.owner.gender]
	if(prob(50))
		var/emote = pick(list(
			"бессвязно кричит!",
			"кусет свой язык и бормочет.",
			"приглушенно выкрикивает проклятья.",
			"ворчит.",
			"кричит в агонии!",
			"таращит глаза на пол."
		))
		holder.owner.custom_emote(message=emote)
	else if(!holder.owner.incapacitated())
		var/obj/item/W = holder.owner.get_active_hand()
		if(W)
			W.attack(holder.owner, holder.owner, ran_zone())
		else
			var/damage_eyes = prob(40)
			if(damage_eyes)
				for(var/obj/item/protection in list(holder.owner.head, holder.owner.wear_mask, holder.owner.glasses))
					if(protection && (protection.body_parts_covered & EYES))
						damage_eyes = FALSE
						break
			if(damage_eyes)
				holder.owner.visible_message(SPAN_DANGER("[holder.owner] scratches at [G.his] eyes!"))
				var/obj/item/organ/internal/eyes/eyes = holder.owner.internal_organs_by_name[BP_EYES]
				eyes.take_damage(rand(1,2), 1)
			else
				holder.owner.visible_message(SPAN_DANGER(pick(list(
					"[holder.owner] tries to end [G.his] misery!",
					"[holder.owner] tries to peel [G.his] own skin off!",
					"[holder.owner] bites [G.his] own limbs uncontrollably!"
				))))
				var/list/obj/item/organ/external/parts = holder.owner.get_damageable_organs()
				if(parts.len)
					holder.owner.damage_through_armor(rand(2,4), def_zone = pick(parts))

/datum/breakdown/negative/selfharm/occur()
	++holder.owner.suppress_communication
	return ..()

/datum/breakdown/negative/selfharm/conclude()
	--holder.owner.suppress_communication
	..()



/datum/breakdown/negative/hysteric
	name = "Hysteric"
	duration = 1.5 MINUTES
	restore_sanity_post = 50

	start_messages = list(
		"Вы взволнованы и начинаете паниковать!",
		"Вы безысходно напуганы!",
		"Вы не можете больше сдерживать слезы!",
		"Волосы на затылке встают дыбом! Страх заставляет вас паниковать!",
		"Это слишком! Вы переволновались и потеряли контроль!"
	)
	end_messages = list(
		"Ваши чувства утихают, вы успокаиваетесь. Вам ужасно стыдно!"
	)

/datum/breakdown/negative/hysteric/update()
	. = ..()
	if(!.)
		return
	holder.owner.Weaken(3)
	holder.owner.Stun(3)
	if(prob(50))
		holder.owner.emote("scream")
	else
		holder.owner.emote("cry")

/datum/breakdown/negative/hysteric/occur()
	holder.owner.SetWeakened(4)
	holder.owner.SetStunned(4)
	++holder.owner.suppress_communication
	return ..()

/datum/breakdown/negative/hysteric/conclude()
	holder.owner.SetWeakened(0)
	holder.owner.SetStunned(0)
	--holder.owner.suppress_communication
	..()




/datum/breakdown/negative/delusion
	//name = "Delusion"
	duration = 1 MINUTES
	restore_sanity_post = 50

	start_messages = list(
		"Вы чувствуете, как что-то говорит с вами изнутри!",
		"Вы слышите голос, кричащий у вас в голове!",
		"Вам кажется, что ваш мозг решил на вас накричать!",
		"Вы слышите, как разные голоса маршируют по вашему разуму!",
		"Вы чувствуете, как звуки превращаются в какофонию!"
	)
	end_messages = list(
		"Вы чувствуете тишину, снова."
	)

/datum/breakdown/negative/delusion/update()
	. = ..()
	if(!.)
		return
	if(prob(10))
		var/power = rand(9,27)
		holder.owner.playsound_local(holder.owner, 'sound/effects/explosionfar.ogg', 100, 1, round(power*2,1) )
		holder.owner.playsound_local(holder.owner, "explosion", 100, 1, round(power,1) )
		shake_camera(holder.owner, 2)
	if(prob(10))
		holder.owner.playsound_local(holder.owner, 'sound/effects/alert.ogg')



/datum/breakdown/negative/fabric
	name = "The Fabric"
	duration = 3 MINUTES
	var/list/image/images = list()

	start_messages = list(
		"Вы чувствуете, что вы поняли то, чего не должны были понять!",
		"Вы чувствуете, как мысли ползают во вашему сознанию!",
		"Вы чувствуете, будто ваш разум пытается постичь тайны самой Вселенной!",
		"Вы чувствуете их. Секреты. Они повсюду",
		"Вы чувствуете, как ваша башня знаний вот-вот достигнет звезд, не хватает лишь одного кирпича!"
	)
	end_messages = list(
		"Вам стало легче. Но надолго ли?"
	)

/datum/breakdown/negative/fabric/occur()
	RegisterSignal(SSdcs, COMSIG_GLOB_FABRIC_NEW, .proc/add_image)
	RegisterSignal(holder.owner, COMSIG_MOB_LOGIN, .proc/update_client_images)
	for(var/datum/component/fabric/F in GLOB.fabric_list)
		if(F.parent == holder.owner)
			continue
		add_image(F.fabric_image)
	++holder.owner.language_blackout
	return ..()

/datum/breakdown/negative/fabric/conclude()
	--holder.owner.language_blackout
	holder.owner.client?.images -= images
	UnregisterSignal(SSdcs, COMSIG_GLOB_FABRIC_NEW)
	UnregisterSignal(holder.owner, COMSIG_MOB_LOGIN)
	images.Cut()
	..()

/datum/breakdown/negative/fabric/proc/add_image(image/I)
	images |= I
	holder.owner.client?.images |= I

/datum/breakdown/negative/fabric/proc/update_client_images()
	holder.owner.client?.images |= images



/datum/breakdown/negative/spiral
	name = "Downward-spiral"
	duration = 0
	restore_sanity_post = 50

	start_messages = list(
		"Вам кажется, что в этом всем нет никакого смысла!",
		"Ваш мозг отказывается все это осмысливать!",
		"Что бы вы ни делали, вам не хочется это продолжать!",
		"Вам кажется, что ваши лучшие дни далеко в прошлом!",
		"Вы это чувствуете. Вы это знаете. Назад пути нет!"
	)

/datum/breakdown/negative/spiral/conclude()
	holder.positive_prob = max(holder.positive_prob - 10, 0)
	holder.negative_prob = min(holder.negative_prob + 20, 100)
	holder.max_level = max(holder.max_level - 20, 0)
	..()



#define OBSESSION_COOLDOWN rand(30 SECONDS, 120 SECONDS)

/datum/breakdown/common/obsession
	name = "Obsession"
	var/obj/item/target
	var/objectname
	var/message_time = 0

	start_messages = list(
		"Вы слышите отвратительный, хриплый голос в своей голове. Он требует выполнить его просьбу...",
		"Ваш разум пронзает тошнотворная потребность держаться за что-то.",
		"Ваш разум шепчет вам один из своих секретов - но вам нужен знак, чтобы получить доступ к его истинным сокровищам...",
		"Вы чувствуете, что старая поговорка верна - ключ к истинной силе реален...",
		"Вы чувствуете постоянное давление, но есть способ облегчить боль..."
	)
	end_messages = list(
		"Вы внезапно почувствовали себя лучше."
	)

/datum/breakdown/common/obsession/New()
	..()
	if(prob(97))
		var/list/candidates = list() //subtypesof(/obj/item/weapon/oddity)
		while(candidates.len)
			target = pick(candidates)
			if(!locate(target))
				candidates -= target
				target = null
				continue
			objectname = initial(target.name)
			break
	if(!target)
		var/list/candidates = (GLOB.player_list & GLOB.living_mob_list & GLOB.human_mob_list) - holder.owner
		if(candidates.len)
			var/mob/living/carbon/human/H = pick(candidates)
			target = pick(H.organs - H.organs_by_name[BP_CHEST])
			objectname = "[H.real_name]'s [target.name]"

/datum/breakdown/common/obsession/can_occur()
	return !!target

/datum/breakdown/common/obsession/update()
	. = ..()
	if(!.)
		return
	var/obj/item/found = FALSE
	if(ispath(target))
		found = locate(target) in holder.owner
	else
		if(QDELETED(target))
			conclude()
			return FALSE
		found = target.loc == holder.owner
	if(found)
		var/message = pick(list(
			"Ваш разум дрожит в экстазе. Наконец-то [objectname] ваш!",
			"Вы чувствуете тепло [objectname] в своей голове.",
			"Вы много страдали на пути к величию! Наконец-то [objectname] ваш. Только ваш."
		))
		to_chat(holder.owner, SPAN_NOTICE(message))
		holder.restoreLevel(70)
		conclude()
		return FALSE
	if(world.time >= message_time)
		message_time = world.time + OBSESSION_COOLDOWN
		var/message = pick(list(
			"Вы поняли. [capitalize(objectname)] облегчит ваше путешествие к звездам.",
			"Вы смотрите по сторонам, но единственная вещь, которую вы видете - [objectname].",
			"Все ваши мысли лишь о [objectname].",
			"Вы представляете, как [objectname] будет согревать ваши руки.",
			"Яркий образ [objectname] заполняет ваш разум.",
			"Вы поняли. Это ключ к вашему спасению. [capitalize(objectname)]. [capitalize(objectname)]. [capitalize(objectname)]!",
			"Голос внутри вас требует лишь одного: [objectname].",
			"Вам больно продолжать притворяться, что жизнь без [objectname] имеет смысл.",
			"Ваш разум тихо шепчет вам: [objectname].",
			"Вы знаете, что единственная возможность искупить грези это [objectname]."
		))
		to_chat(holder.owner, SPAN_NOTICE(message))

/datum/breakdown/common/obsession/occur()
	for(var/stat in ALL_STATS)
		holder.owner.stats.addTempStat(stat, -5, INFINITY, "Obsession")
	return ..()

/datum/breakdown/common/obsession/conclude()
	for(var/stat in ALL_STATS)
		holder.owner.stats.removeTempStat(stat, "Obsession")
	..()

#define KLEPTOMANIA_COOLDOWN rand(30 SECONDS, 60 SECONDS)

/datum/breakdown/common/kleptomania
	name = "Kleptomania"
	duration = 5 MINUTES
	restore_sanity_post = 50
	var/pickup_time = 0

	start_messages = list(
		"Вы чувствуете необходимость держать что-то, что вы, возможно, не должны...",
		"Вы чувствуете, что другие не ценят то, что имеют, но вы - наоборот,...",
		"Вы чувствуете, что все должно быть в вашем владении...",
		"Вы чувствуете, что все может быть вашим, нужно лишь приложить немного усилий...",
		"Вы чувствуете, что некоторые вещи имеют сильную ауру вокруг них. Ничего не будет, если взять их себе..."
	)
	end_messages = list(
		"You feel easier about not stealing things now."
	)

/datum/breakdown/common/kleptomania/update()
	. = ..()
	if(!. || holder.owner.incapacitated())
		return
	if(world.time >= pickup_time)
		pickup_time = world.time + KLEPTOMANIA_COOLDOWN
		var/list/obj/item/candidates = oview(1, holder.owner)
		while(candidates.len)
			var/obj/item/I = pick(candidates)
			if(!istype(I) || I.anchored || !I.Adjacent(holder.owner) || !I.pre_pickup(holder.owner))
				candidates -= I
				continue
			if(!holder.owner.put_in_hands(I) && prob(50))
				holder.owner.unEquip(holder.owner.get_inactive_hand())
				holder.owner.put_in_hands(I)
			break



/datum/breakdown/common/signs
	//name = "Signs"
	restore_sanity_post = 70
	var/message

	start_messages = list(
		"Вы чувствуете, что ткань реальности видна вам...",
		"Вы чувствуете, что истина спрятана где-то в вашем уме...",
		"Вы чувствуете, что ваш разум говорил с вами после многих веков молчания...",
		"Вы чувствуете, что были слепы, но теперь вы прозрели...",
		"Вы чувствуете, что сама Вселенная говорит с вами..."
	)
	end_messages = list(
		"Правда рассказана. Вы снова это чувствуете. Мелодия звука возвращается к вам."
	)

/datum/breakdown/common/signs/New()
	..()
	message = "Etiam tempor orci eu lobortis elementum nibh tellus molestie"

/datum/breakdown/common/signs/update()
	. = ..()
	if(!.)
		return
	if(!prob(40))
		return
	var/list/words = splittext(message, " ")
	var/phrase_len = rand(1,2)
	var/phrase_pos = rand(1, words.len - phrase_len)
	to_chat(holder.owner,"...[jointext(words, " ", phrase_pos, phrase_pos + phrase_len + 1)]...")

/datum/breakdown/common/signs/occur()
	RegisterSignal(holder.owner, COMSIG_HUMAN_SAY, .proc/check_message)
	return ..()

/datum/breakdown/common/signs/conclude()
	UnregisterSignal(holder.owner, COMSIG_HUMAN_SAY)
	..()

/datum/breakdown/common/signs/proc/check_message(msg)
	if(msg == message)
		finished = TRUE
