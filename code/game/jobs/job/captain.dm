var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Captain"
	title_ru = "Капитан"
	flag = CAPTAIN
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "вашей собственной совестью"
	selection_color = "#ccccff"
	req_admin_notify = 1
	wage = WAGE_NONE //The captain doesn't get paid, he's the one who does the paying
	//The ship account is his, and he's free to draw as much salary as he likes

	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 20)

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/job/captain

	description = "Вы Капитан. <br>\
Владелец огромного ржавеющего судна, которым является CEV Eris. По крайней мере, до тех пор, пока вы продолжаете выплачивать за него деньги.<br>\
Этот корабль - дело всей вашей жизни, в котором работает альянс корпораций и фракций, с которыми вы заключили непростые договоры.<br>\

Вы верховный лидер этого мира, и ваше слово - закон. Но только до тех пор, пока вы можете обеспечить соблюдение этого закона.<br>\
Главы фракций, которые составляют ваш командный состав, имеют свои собственные цели. Их интересы тоже должны быть соблюдены. Если вы сделаете их несчастными, верность их фракции уйдет вместе с ними, и вы непреднамеренно поднимите мятеж. <br>\
Относитесь к своим офицерам с уважением и слушайте их советы. Старайтесь не вмешиваться в их дела и не вмешиваться в микроуправление их отделами, и будут верно служить вам<br>\

Вы свободный агент, который способен идти куда угодно, и не имеющий преданности никакому конкретному правительству или нации. Однако у вас много долгов. Поэтому, куда бы вы ни пошли, вы должны быть уверены, что вас ждет выгодное предприятие."

	loyalties = "Ваша первая верность это Eris, ваш корабль. Это цель вашей жизни, и без него вы ничто. Если он будет разрушен, вы и ваши потомки будут разорены на долгие века. <br>\

Ваша вторая верность это ваши офицеры. Главы каждой из фракций. Прислушивайтесь к их советам, следите за тем, чтобы их интересы были соблюдены, и делайте их счастливыми."

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
		return 1

	get_access()
		return get_all_station_access()

/obj/landmark/join/start/captain
	name = "Captain"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/captain



/datum/job/hop
	title = "First Officer"
	title_ru = "Старший Помощник"
	flag = FIRSTOFFICER
	department = DEPARTMENT_COMMAND
	department_flag = COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Капитаном"
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 15)
	ideal_character_age = 50

	description = "You are the captain's right hand. His second in command. Where he goes, you follow. Where he leads, you drag everyone else along. You make sure his will is done, his orders obeyed, and his laws enforced.<br>\
If he makes mistakes, discreetly inform him. Help to cover up his indiscretions and smooth relations with the crew, especially other command staff. Keep the captain safe, by endangering yourself in his stead if necessary.<br>\
<br>\
Do not embarass him or harm relations with faction leaders.<br>\
<br>\
But who are you?<br>\
Perhaps you are the captain's lifelong friend, or a trusted associate to whom he gave a position of power.<br>\
Perhaps you're a consummate professional who comes highly recommended.<br>\
A retired general or naval officer?<br>\
Perhaps you're the captain's brother, firstborn son, or spouse. Nobody can prevent nepotism if he chooses<br>\
Perhaps you're a foreign diplomat, your position a ceremonial one to ensure a treaty.<br>\

Whatever your origin, you are fiercely loyal to the captain"

	duties = "Oversee everyone else, especially the other command staff, to ensure the captain's orders are being carried out.<br>\
Handle job reassignments and promotion requests, if an appropriate faction leader isn't available<br>\
Act as the captain's surrogate in risky situations where a command presence is required<br>\
Replace the captain if they become incapacitated, need to take a break, or suffer a premature death<br>\
Act as the captain's sidekick, bodyguard, and last line of defense in a crisis or mutiny situation"

	loyalties = "Your first and only loyalty is to the captain. Unless you're an antagonist and have a good reason for betrayal, you should remain loyal to the death. You are the only one he can trust"

	outfit_type = /decl/hierarchy/outfit/job/hop


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_VIG = 20,
		STAT_COG = 10
	)

/obj/landmark/join/start/hop
	name = "First Officer"
	icon_state = "player-gold"
	join_tag = /datum/job/hop

/datum/job/commissioner
	title = "Commissioner"
	title_ru = "Комиссар"
	flag = COMMISSIONER
	department = DEPARTMENT_COMMAND
	department_flag = COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Капитаном"
	selection_color = "#ddddff"
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 20)
	ideal_character_age = 40

	description = "Незаметный человек в черном костюме, который выглядит самую малость неуместно посреди старого дизайна корабля.<br>\
Впрочем, не вам судить. Данный индивид является оком Капитана, которое обладает полномочиями посетить любой отсек на корабле и запросить любую информацию.<br>\
<br>\
Кто вы есть на самом деле?<br>\
Вы - ожившая функция, бюрократический механизм, который занимается беспристрастным фиксированием всего происходящего, для дальнейшего протоколирования и занесения это в электронный журнал, дабы по окончании миссии Капитан и инвесторы могли разобраться с тем, что происходило с командой."

	duties = "Задачи просты - вы обязаны посещать все отсеки корабля, имеете доступ к любому помещению или информации, а также наделены властью запрашивать любые отчеты у персонала, и более того - их получить.<br>\
На основании собранных данных, вы обязаны составить отчет о происходящем, особенно вас интересует компетентность персонала, в том числе и подверженность к заболеваниям ПТС и неадекватного буйства.<br>\
Если сотрудник не может выполнять свои обязанности - по психологическим или умственным отклонениям, вы имеете право составить об этом исчерпывающий отчет согласно имеющейся формы и запросить отзыв лицензии данного сотрудника для данной должности, на определенный срок."

	loyalties = "Вы преданы Кораблю, поскольку именно для этого вас наняли. Капитан может сойти с ума, нанятый наемник устроить революцию - но вы остаетесь вне этого, и продолжаете беспристрастно следить."

	outfit_type = /decl/hierarchy/outfit/job/commissioner

	access = list(
		access_co, access_heads, access_security, access_moebius, access_medspec, access_engine,
		access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_mailsorting
	)


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/reports)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_VIG = 20,
		STAT_COG = 20
	)

/obj/landmark/join/start/commissioner
	name = "Commissioner"
	icon_state = "player-gold"
	join_tag = /datum/job/commissioner
