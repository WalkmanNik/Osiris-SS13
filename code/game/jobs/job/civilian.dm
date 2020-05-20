#define LOYALTY_CIVILIAN "As a civilian, your only loyalty is to yourself and your livelihood.<br>\
		You just want to survive, make a living, and get through the day. You shouldn't try to be a hero, or throw your life away for a cause. Nor should you hold any loyalties. Civilians should be easily corruptible, willing to take bribes to do anything someone wants and stay quiet about it."


/datum/job/clubmanager
	title = "Club Manager"
	title_ru = "Менеджер клуба"
	flag = CLUBMANAGER
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Старшим Помощником"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 15, LANGUAGE_JIVE = 80)
	access = list(access_bar, access_kitchen)
	initial_balance = 3000
	wage = WAGE_NONE // Makes his own money
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "Как Менеджер Клуба, вы управляете клубом на борту CEV Eris. Обеспечьте членов экипажа напитками, едой и развлечениями.<br>\
	<br>\
	Формально вы никому не подчиняетесь, но Капитан и Стар. Пом. это те, кто наняли вас, и вы должны стараться угодить им. Работники вашего клуба помогают вам управлять этим местом и зарабатывать деньги. Платите им хорошо!"

	duties = "		Заведуйте клубом, обеспечьте безопасное хранение еды, напитков, а так же развлекайте экипаж.<br>\
		Зарабатывайте деньги, проводите сделки через свое заведение, предоставляйте развлечения, коммерческие секреты.<br>\
		Держите бар безопасным, чистым и свободным от насилия."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/clubmanager
	name = "Club Manager"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Club Worker"
	title_ru = "Работник клуба"
	flag = CLUBWORKER
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Менеджером клуба"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10, LANGUAGE_JIVE = 60)
	access = list(access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_NONE //They should get paid by the club owner, otherwise you know what to do.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 5,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "Как Работник Клуба, вы работаете на Менеджера Клуба. Ваша задача, выполнять свои обязанности по управлению клубом и следить за тем, чтобы все клиенты были довольны.<br>\
	<br>\
	Вы можете готовить, убираться, обслуживать, ухаживать за баром, развлекать посетителей или даже быть вышибалой. У вас нет никаких ограничений на то, что вы можете делать внутри клуба, если конечно Менеджер попросит вас не делать что-либо.<br>\
	<br>\
	Вам платит непосредственно Менеджер Клуба, он дает вам ваше пособие. Менеджер Клуба зарабатывает деньги только в том случае, если клуб хорошо управляется, так что работайте усердно!"

	duties = "		Помогайте Менеджеру Клуба в управлении клубом.<br>\
		Обслуживайте клиентов. Кормите клиентов. Развлекайте клиентов.<br>\
		Защитите клуб. Защитите клиентов.<br>\
		Заработать достаточно денег, и остаться в живых на борту CEV Eris."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/clubworker
	name = "Club Worker"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/actor
	title = "Actor"
	title_ru = "Актер"
	flag = ACTOR
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Старшим Помощником"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5, LANGUAGE_JIVE = 80)
	access = list(access_maint_tunnels, access_theatre)

	outfit_type = /decl/hierarchy/outfit/job/service/actor/clown
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	stat_modifiers = list(
		STAT_TGH = 30, //basically a punching bag, he can't robust anyone or shoot guns anyway
	)

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/actor
	name = "Actor"
	icon_state = "player-grey"
	join_tag = /datum/job/actor

/datum/job/janitor
	title = "Janitor"
	title_ru = "Уборщик"
	flag = JANITOR
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Старшим Помощником"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 60)
	access = list(access_janitor, access_maint_tunnels)
	wage = WAGE_LABOUR_DUMB
	outfit_type = /decl/hierarchy/outfit/job/service/janitor

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_BIO = 10,
		STAT_VIG = 10
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)

	description = "Вы уборщик. Берите в руки швабру и убирайте любой мусор, что видите на своих глазах. Не забудьте обругать каждого, кто смеет ходить с грязными ботинками."

	duties = "Следите, чтобы корабль был чист от мусора, грязи и крови. Старайтесь не сойти с ума, пока пытаетесь сделать это ."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/janitor
	name = "Janitor"
	icon_state = "player-grey"
	join_tag = /datum/job/janitor

