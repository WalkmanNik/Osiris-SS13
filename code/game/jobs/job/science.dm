/datum/job/rd
	title = "Moebius Expedition Overseer"
	title_ru = "Заведующий экспедицией"
	flag = MEO
	head_position = 1
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE | COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Корпорацией Moebius"
	selection_color = "#b39aaf"
	req_admin_notify = 1
	wage = WAGE_NONE
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	outfit_type = /decl/hierarchy/outfit/job/science/rd

	access = list(
		access_rd, access_heads, access_tox, access_genetics, access_morgue,
		access_tox_storage, access_teleporter, access_sec_doors,
		access_moebius, access_medical_equip, access_chemistry, access_virology, access_cmo, access_surgery, access_psychiatrist,
		access_robotics, access_xenobiology, access_ai_upload, access_tech_storage, access_eva, access_external_airlocks,
		access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_research_equipment
	)
	ideal_character_age = 50

	stat_modifiers = list(
		STAT_MEC = 25,
		STAT_COG = 40,
		STAT_BIO = 25,
	)

	// TODO: enable after baymed
	software_on_spawn = list(/datum/computer_file/program/comm,
							///datum/computer_file/program/aidiag,
							/datum/computer_file/program/signaller,
							/datum/computer_file/program/camera_monitor,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/reports)

	description = "Вы возглавляете исследовательский отдел Мебиуса, которому поручено направлять исследования на борту корабля к новым и прибыльным открытиям."

	duties = "Управляйте учеными под вашим началом, убедитесь, что они эффективно работают на благо всего человечества.<br>\
Используйте средства департамента для приобретения научных диковинок, артефактов и всего, что представляет интерес для исследований. А также любое оборудование и расходные материалы, которые были бы полезны для этих целей<br>\
Организовывайте выездные миссии для сбора артефактов и исследования интересных сред. Вы имеете право запрашивать поддержку у других фракций по мере необходимости"

	loyalties = "Как ученый, во первых вы верны своим знаниям, высшему благу во Вселенной. Изучение и развитие новых технологий это величайшая цель, которую может преследовать человечество, и никакие жертвы не могут быть слишком велики для достижения этой цели. Даже жизни других людей или вас самих.<br>\
<br>\
Во вторых вы верны компании \"Мебиус Корп\". Для того чтобы она могла продолжать свою исследовательскую миссию, она должна оставаться прибыльной. Позаботьтесь о том, чтобы их интересы были поставлены куда выше остальных, и позаботьтесь о своих коллегах как в научно-исследовательском, так и в медицинском отделе"

/obj/landmark/join/start/rd
	name = "Moebius Expedition Overseer"
	icon_state = "player-purple-officer"
	join_tag = /datum/job/rd



/datum/job/scientist
	title = "Moebius Scientist"
	title_ru = "Ученый"
	flag = SCIENTIST
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE
	faction = "CEV Eris"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Заведующим экспедицией"
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)

	//alt_titles = list("Moebius Xenobiologist")
	outfit_type = /decl/hierarchy/outfit/job/science/scientist

	software_on_spawn = list(/datum/computer_file/program/signaller, /datum/computer_file/program/chem_catalog)

	access = list(
		access_robotics, access_tox, access_tox_storage, access_moebius, access_xenobiology, access_xenoarch, access_research_equipment,
		access_genetics
	)

	stat_modifiers = list(
		STAT_MEC = 20,
		STAT_COG = 30,
		STAT_BIO = 20,
	)

	description = "Вы ученый, стоящий на пороге развития человечества. Здесь мы представляем компанию \"Мебиус Корп\", чтобы найти новые возможности для исследований в глубоком космосе. Научный отдел находится во второй секции, по правому борту, напротив медицинского, и ваши коллеги-медики должны быть вашими друзьями. Медицинский отдел также является частью Мебиуса, и поэтому вы полностью разделяете доступ друг к другу и можете свободно использовать припасы друг друга.<br>\
<br>\
Как ученый, ваша главная цель, это исследования, тестирование и продвижение знаний. Вы можете оправдать почти все, что угодно, если это сделано для науки, и у людей нет причин вас подозревать, если вы хоите вокруг, носите странные устройства и носите странное оружие. Вы должны создавать необычные вещи, изучать их, испытывать. Погрузитесь с головой в исследования настолько глубоко, насколько возможно.<br>\
<br>\
В исследовательском отделе есть несколько специализированных отраслей, в которые вы можете углубиться:<br>\
	<br>\
	R&D: Производство и испытания высокотехнологичного оружия и приборов. Эта ветвь делит лабораторию с робототехникой, и часто работает в близи друг друга, для того чтобы производить более обширные машины.<br>\
	Ксенофлора: Лаборатория, посвященная экспериментам и модификации ДНК растений, созданию интересных мутировавших растений, которые могут помочь экипажу<br>\
	Ксенобиология: Отдел, полный био. клеток, для изучения чужеродных форм жизни. В первую очередь слаймов<br>\
	Ксеноархеология: Объект для анализа артефактов и находок, привезенных из экспедиций.<br>\
	<br>\
	\"Василий Докучаев\" - это экспедиционный шаттл, предназначенный для путешествий по незнакомым местам и поиска ценных предметов. <br>\
	<br>\
	<br>\[Примечание: Исследовательский контент на CEV Eris все еще находится в зачаточном состоянии, и в настоящее время это в основном просто контент baystation. У нас есть серьезные планы по его перепроектированию в будущем\]"

	duties = "	Создавайте необычные вещи и экспериментируйте с ними<br>\
	Исследуйте, учитесь и совершайте походы, делайте все, чтобы продвигать дело познания"

	loyalties = "Как ученый, во первых вы верны своим знаниям, высшему благу во Вселенной. Изучение и развитие новых технологий это величайшая цель, которую может преследовать человечество, и никакие жертвы не могут быть слишком велики для достижения этой цели. Даже жизни других людей или вас самих.<br>\
<br>\
Во вторых вы верны компании \"Мебиус Корп\". Для того чтобы она могла продолжать свою исследовательскую миссию, она должна оставаться прибыльной. Позаботьтесь о том, чтобы их интересы были поставлены куда выше остальных, и позаботьтесь о своих коллегах как в научно-исследовательском, так и в медицинском отделе"


/obj/landmark/join/start/scientist
	name = "Moebius Scientist"
	icon_state = "player-purple"
	join_tag = /datum/job/scientist


/datum/job/roboticist
	title = "Moebius Roboticist"
	title_ru = "Роботехник"
	flag = ROBOTICIST
	department = DEPARTMENT_SCIENCE
	department_flag = SCIENCE
	faction = "CEV Eris"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Заведующим экспедицией"
	selection_color = "#bdb1bb"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)

	outfit_type = /decl/hierarchy/outfit/job/science/roboticist

	access = list(
		access_robotics, access_tox, access_tox_storage, access_morgue, access_moebius, access_research_equipment
	) //As a job that handles so many corpses, it makes sense for them to have morgue access.

	software_on_spawn = list(/datum/computer_file/program/chem_catalog)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 20,
		STAT_BIO = 25,
	)



	description = "Как робототехник, вы самый занятой человек в исследовательском отделе. Ибо это единственная сфера деятельности отдела, которая сосредоточена на предоставлении услуг другим людям.<br>\
<br>\
В вашем распоряжении имеется широкий спектр инструментов и механизмов, а также столь же широкий список обязанностей. Кроме того, у вас будет постоянный поток посетителей, и вы сможете побыть наедине с собой крайне редко<br>\
<br>\
Обязанности робототехника многочисленны, и лаборатория часто выигрывает от наличия нескольких сотрудников этой профессии.<br>\
Вы должны поддерживать, заботиться и модернизировать склад синтетических материалов, которые помогают поддерживать корабль в рабочем состоянии. Кроме того, на вас также ложится обязанность создавать новых роботов. С помощью ваших фабрикаторов вы можете превратить груду листового металла и проводов в разумную жизнь. Роботы корабля управляются Мебиусом, и робототехники часто привязываются к своим детищам.<br>\
<br>\
Кроме того, ваш отдел располагает производственными мощностями для протезирования конечностей и их усовершенствования. Как правило, вам также приходится устанавливать их, и поэтому обычно инженеры-биомеханики работают в лаборатории робототехники. Это может быть или не быть в наборе навыков вашего персонажа. Если хирургия не является вашей специальностью, вы можете передать эту обязанность вашим коллегам в Мебиус Медикал, и просто поставить детали для установки.<br>\
<br>\
Наконец, хотя они обычно не используются, у вас есть средства для создания массивных и мощных механизированных транспортных средств. Они обладают мощными возможностями в области добычи полезных ископаемых и спасательных работ, а также очевидным военным применением"

	duties = "	Ремонтируйте, совершайте техническое обслуживание и модернизируйте роботов на борту CEV Eris<br>\
	Поддерживайте и внедряйте новую бионику членам экипажа<br>\
	Рекламируйте бионику для продажи, запускайте рекламу кибернетической клиники для продажи и выполнения заказов<br>\
	Стройте больших Мехов для специализированного использования в отделах"

/obj/landmark/join/start/roboticist
	name = "Moebius Roboticist"
	icon_state = "player-purple"
	join_tag = /datum/job/roboticist
