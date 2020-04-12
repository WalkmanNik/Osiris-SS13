/datum/job/chief_engineer
	title = "Technomancer Exultant"
	title_ru = "Экзультант"
	flag = EXULTANT
	head_position = 1
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING | COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Капитаном"
	selection_color = "#c7b97b"
	req_admin_notify = 1
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 25)
	wage = WAGE_NONE
	ideal_character_age = 50

	outfit_type = /decl/hierarchy/outfit/job/engineering/exultant

	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload
	)

	stat_modifiers = list(
		STAT_MEC = 40,
		STAT_COG = 20,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control,
							 /datum/computer_file/program/reports)

	description = "Вы Экзультант, глава клана техномантов, кочевых космических инженеров. Вы и ваш клан поселились на борту CEV Eris, теперь это ваша работа, ваш дом и ваша гордость.  <br>\
Вы должны поддерживать корабль в рабочем состоянии и постоянно улучшать его, насколько это возможно. Пусть никто не сомневается в эффективности вашего труда."

	loyalties = "Ваша первая верность это ваша гордость. Инженерный отдел это ваша территория, а техника по всей станции это ваша ответственность. Не допускайте, чтобы другие вмешивались в них, вторгались в ваше пространство или подвергали сомнению вашу компетентность. Вам не нужны проверки, надзор или микроменеджмент. Посторонние должны входить в ваши помещения только по приглашению или по необходимости. Даже Капитан и другие главы фракций не являются исключением.<br>\

Ваша вторая верность это верность своему клану. Убедитесь, что им платят, кормят и они в безопасности. Не рискуйте их жизнями без необходимости. Если район кишит монстрами, нет никаких причин рисковать их жизнями, пытаясь что-то там починить. Если кто-то из ваших людей находится в тюрьме, подвергается опасности или обвиняется, вы должны бороться за них. Относитесь к каждому техноманту как к члену собственной семьи."

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/chief_engineer
	name = "Technomancer Exultant"
	icon_state = "player-orange-officer"
	join_tag = /datum/job/chief_engineer


/datum/job/technomancer
	title = "Technomancer"
	title_ru = "Техномант"
	flag = TECHNOMANCER
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING
	faction = "CEV Eris"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Экзультантом"
	selection_color = "#d5c88f"
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 5)
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics
	)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 15,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control)

	description = "Вы Техномант, член кочевого клана космических инженеров. Вы и ваши люди зарабатывают на жизнь, предлагая свои услуги звездолетам, таким как Eris, и вы, таким образом, поселились здесь. Обслуживание корабля это ваша ответственность, убедитесь, что двигатель работает, огни включены, двигатели заправлены топливом, а воздух пригоден для дыхания<br>\
<br>\
Ваши обязанности на борту корабля многочисленны и разнообразны. Для начала, в начале смены, вы должны убедиться, что двигатель Суперматерии запущен. Это сложная задача, и вы должны учиться у других членов вашего клана, а не пытаться сделать это самостоятельно. Заправка двигателей это следующее, что позволит кораблю добраться куда угодно, и опять же вы должны учиться у других<br>\
<br>\
После того, как основные системы будут настроены, вы можете немного расслабиться, но вы также должны посвятить время обучению и настройке. Системы распределения электроэнергии могут быть сделаны более надежными. Техноманты, как правило, также отвечают за настройку генераторов щитов. Выключите его, чтобы сэкономить энергию, когда это не нужно, убедитесь, что он включен, прежде чем корабль отправится куда-нибудь.<br>\
<br>\
С силой конструирования, вы можете настроить корабль для своих собственных нужд. Стройте и удаляйте стены, чтобы сделать вещи более эффективными или более безопасными. Постройте новые машины, чтобы расширить возможности и сделать жизнь каждого человека проще. Вы даже можете поставить ловушки или построить башенки, чтобы держать любопытных посторонних подальше от чувствительных зон. Корабль ваш, чтобы улучшать иили строить на нем<br>\
<br>\
Убедитесь, что ваше снаряжение EVA подготовлено, и вы полностью оснащены инструментами. Для достижения оптимальной производительности настоятельно рекомендуется модифицировать и модернизировать ваши инструменты. Инструментальные модули можно найти во время уборки мусора или приобрести у Торговца. И всегда, всегда носите с собой клейкую ленту.<br>\
Вы тоже должны носить материалы для полевых ремонтных работ, но не крадите себе целые штабеля , другие техноманты ваши братья, и вы должны делиться поровну, брать только то, что вам нужно.<br>\
 <br>\
Самое главное, будьте готовы реагировать на экстренные вызовы в любое время. Части корабля могут быть повреждены или взорваны, и это ваша работа, чтобы исправлять это. Независимо от цены, независимо от опасности, у вас есть снаряжение и навыки, чтобы идти в места, которые были бы смертью для большинства смертных. Это ваша ответственность, чтобы сохранить корабль в целости и сохранности, так же и в состоянии летать.<br>\
<br>\
Eris ваш дом, ваша жизнь и ваш источник средств к существованию. Гордитесь этим и своими обязанностями. Вы должны колебаться, покидая корабль, и изо всех сил стараться не допустить этого, чтобы это стало необходимым. Инженерный отдел это ваша суверенная территория, и вы должны быть очень осторожны с посторонними, входящими без приглашения. Ваши коллеги-техноманты это ваша семья. Заботьтесь о них, относитесь к ним хорошо, делитесь с ними всем и решайте свои внутренние проблемы."

	duties = "	-Запустить Суперматерию<br>\
	-Заправить двигатели топливом<br>\
	-Управлять генератором щитов<br>\
	-Ремонтировать все и вся, что нуждается в ремонте<br>\
	-Реагировать на сигналы бедствия и исправлять пробоины в корпусе.<br>\
	-Держать каждую часть корабля заряженной, насыщенной кислородом и готовой к использованию"

	loyalties = "	Как Техномант, вы в первую очередь верны своим коллегам техномантам. Обеспечьте им безопасность и хорошее снабжение, защищайте их, помогайте им и делитесь с ними всем. Если между вами возникнут проблемы, попросите Экзультанта решить их. Не ябедничайте на коллег соклановцев Железному Молоту. Техномант Экзультант это глава вашего клана,и во многих отношениях он отец. Верьте в его мудрость и следуйте его указаниям в приоритете перед остальными.<br>\
	<br>\
	Ваша вторая верность это ваш корабль. В отличие от большинства членов вашей команды, которые просто отправились бы домой, Eris это ваш дом. Избегайте покидания корабля любой ценой. Здесь ваш дом, и ради этого стоит пожертвовать собой. Гордись своей работой и сделай так, чтобы Eris была чем то особенным."

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/technomancer
	name = "Technomancer"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer
