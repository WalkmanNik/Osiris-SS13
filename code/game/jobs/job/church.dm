/datum/job/chaplain
	title = "NeoTheology Preacher"
	title_ru = "Проповедник"
	flag = CHAPLAIN
	head_position = 1
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH | COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "церковью НеоТеологии"
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	cruciform_access = list(
		access_morgue, access_chapel_office, access_crematorium, access_hydroponics, access_janitor, access_maint_tunnels
	)

	access = list(
		access_RC_announce, access_keycard_auth, access_heads, access_sec_doors
	)

	wage = WAGE_PROFESSIONAL //The church has deep pockets
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/chaplain

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_BIO = 15,
		STAT_VIG = 15,
		STAT_COG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_PRIEST,
		CRUCIFORM_REDLIGHT
	)

	description = "Вы глава местного отделения Церкви Неотеологии. Вы представляете интересы церкви на борту CEV Eris, а также интересы учеников ЦН среди экипажа, которых можно идентифицировать по крестообразному импланту на груди. Церковь является главным инвестором миссии Eris и требует уважения<br>\
	<br>\
	Ваши обязанности на борту корабля могут показаться не столь важными для его миссии, но они имеют большее значение в галактике в целом. А также более непосредственное значение для морального состояния экипажа, особенно последователей Неотеологии.<br>\
	<br>\
	Иногда Церковь посылает инквизиторов на отдаленные аванпосты вроде этого, чтобы они служили ее интересам. Когда один из них находится на CEV Eris, вы будете их контактером. Инквизиторы превосходят вас по рангу, и вы должны беспрекословно следовать их указаниям. Инквизиторы работают в тайне, и поэтому вы не должны обсуждать их присутствие с кем-либо, если они не позволят этого.<br>\
	<br>\
	Прежде всего, вы человек из плоти и крови, и как таковой вы должны заботиться о духовных нуждах экипажа. Те, кто хочет обратиться в ЦН, должны прийти к вам для совершения обрядов и установки крестоформа.<br>\
	Когда настроение мрачное, когда вся надежда потеряна, вы должны быть духовным лидером. Проповедуйте пастве, вселяйте веру и силу в их сердца. Ритуалы в вашей книге также могут предложить более ощутимую помощь в труде и борьбе.<br>\
	Даже когда наступают светлые времена, делайте все возможное, чтобы так оно и оставалось. Совершайте экскурсию по кораблю, предлагая поддержку тем, кто в ней нуждается. Молитва в правом ухе, рука помощи или плечо, на котором можно поплакать, могут творить чудеса. И люди наиболее уязвимы для обращения, когда они находятся в отчаянном состоянии.<br>\
	<br>\
	Когда за живыми ухаживают, ваш следующий долг перед мертвыми. <br>\
	Церковь обладает исключительными правом на технологию клонирования, используя Крестоформ, имплантированный каждому ученику в качестве кортикального стэка, хранящего резервную копию памяти и личности носителя, их души, если хотите. Когда кто-то из верующих страдает от безвременной кончины, ваш священный долг вырастить новый сосуд и пересадить в него душу, возвращая ее к жизни. Бессмертие это награда верующих.<br>\
	<br>\
	Для тех, кто не является частью этой паствы, следующая лучшая вещь, которую вы можете предложить, это достойные похороны. В районе часовни находятся гробы и механизмы для предания мертвых пустоте. Похороны в космосе. Любой игрок, получивший надлежащие похороны, сократит время своего возрождения, что позволит ему быстрее присоединиться к команде в качестве нового персонажа после смерти."


	duties = "Представлять интересы учеников ЦН на борту CEV Eris. Защитите их от преследований и говорите за них.<br>\
		Проводите мессы, читайте проповеди, проповедуйте верующим и проводите групповые ритуальные сеансы.<br>\
		Восстановите и клонируйте верных пастве мертвецов.<br>\
		Устраивайте похороны для мертвых язычников."

	setup_restricted = TRUE

/obj/landmark/join/start/chaplain
	name = "NeoTheology Preacher"
	icon_state = "player-black"
	join_tag = /datum/job/chaplain

/datum/job/acolyte
	title = "NeoTheology Acolyte"
	title_ru = "Послушник"
	flag = ACOLYTE
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = "CEV Eris"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Проповедником"
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)
	cruciform_access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/acolyte

	stat_modifiers = list(
	STAT_MEC = 25,
	STAT_BIO = 10,
	STAT_VIG = 10,
	STAT_TGH = 5,
	)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	description = "Вы служите Проповеднику Неотеологии как ученик Веры.<br>\
	<br>\
	Священные обязанности по эксплуатации биореактора и управлению биомассой для святого клонера церкви ложатся на вас.<br>\
	<br>\
	Хотя от вас может потребоваться и больше, если ваш проповедник так решит."

	duties = "Управляйте биореактором для создания энергии.<br>\
	Управляйте распределением биоматериала.<br>\
	Служите воле проповедника."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "NeoTheology Acolyte"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte

/datum/job/hydro
	title = "NeoTheology Agrolyte"
	title_ru = "Агролит"
	flag = BOTANIST
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = "CEV Eris"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Проповедником"
	selection_color = "#ecd37d"
	//alt_titles = list("Hydroponicist")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	cruciform_access = list(access_hydroponics, access_morgue, access_crematorium, access_maint_tunnels)
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/church/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	description = "Вы культиватор (ака Агролит) церковных растений и помогаете в производстве биоматериала. Все обязанности по выращиванию растений ложатся на вас, что делает вашу роль критически важной.<br>\
	<br>\
	Хотя Церковь это ваша главная забота, поскольку вы являетесь последователем ее веры, многие другие на борту корабля также полагаются на вашу работу. Экипажу требуется еда, и Менеджер Клуба стремится ее предоставить. Но управляющий не может готовить еду без свежих продуктов, выращенных в Священном саду церкви.<br>\
	<br>\
	Таким образом, по доброй воле Церковь предоставляет продукты управляющему, а также экипажу. И, возможно, со временем заслужит благосклонность новообращенных."

	duties = "Выращивайте растения для использования в качестве биоматериала.<br>\
	Обеспечьте всех свежими продуктами. <br>\
	Служите Вере."

	setup_restricted = TRUE

/obj/landmark/join/start/hydro
	name = "NeoTheology Agrolyte"
	icon_state = "player-black"
	join_tag = /datum/job/hydro