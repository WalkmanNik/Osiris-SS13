//Cargo
/datum/job/merchant
	title = "Guild Merchant"
	title_ru = "Торговец"
	flag = MERCHANT
	department = DEPARTMENT_GUILD
	head_position = 1
	department_flag = GUILD | COMMAND
	faction = "CEV Eris"
	total_positions = 1
	spawn_positions = 1
	supervisors = "собственной жадностью"
	selection_color = "#b3a68c"
	wage = WAGE_NONE	//Guild merchant draws a salary from the guild account
	also_known_languages = list(LANGUAGE_CYRILLIC = 80, LANGUAGE_SERBIAN = 100, LANGUAGE_JIVE = 80)
	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_merchant, access_mining,
		access_heads, access_mining_station, access_RC_announce, access_keycard_auth, access_sec_doors,
		access_eva, access_external_airlocks
	)
	ideal_character_age = 40
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_COG = 20,
		STAT_MEC = 15,
		STAT_VIG = 10
	)
	description = "Вы глава местного отделения Торговой Гильдии Астры и торговый представитель CEV Eris<br>\
Будучи убежденным предпринимателем, вы мотивируетесь прибылью, для гильдии и особенно для вас. Вы здесь, во-первых, чтобы заработать как можно больше денег, а во-вторых, чтобы обеспечить экипаж. Вы можете заказать вещи в cargo, используя средства местной гильдии, они не будут волшебным образом пополняться, поэтому у вас быстро закончатся деньги, если вы не будете взимать плату. Принимайте платежи картой или наличными и вносите их на счет гильдии, чтобы сделать больше покупок.<br>\
<br>\
Гильдия также управляет всеми торговцами на корабле, каждый кредит, выплаченный им, идет на счет вашей гильдии. Естественно, что торговля это дорога с двусторонним движением, и вы должны, когда это необходимо, пополнять запасы у поставщиков. Или послать Техника, чтобы он сделал это<br>\
<br>\
Вы не получаете зарплату, но местные гильдейские фонды принадлежат вам. Вы можете платить себе сколько угодно с этого счета, брать деньги и использовать их для любых целей. Взяточничество это хорошо, вы можете заставить людей делать много вещей, если вы блеснете наличными, и это хорошая идея, чтобы держать несколько тысяч кредитов на руках наличкой, чтобы подкупить вас в потенциально трудных ситуациях.<br>\
<br>\
Что вам нужно иметь в виду:<br>\
	-Никто не имеет права на бесплатный товар. Вы имеете полное право взимать плату за все, что вы распространяете, и вы не заработаете ни пенни, если этого не сделаете.<br>\
	-На борту CEV Eris  мало законов о контрабанде. Если кому-то что-то нужно и он может себе это позволить, вы добудете это для него. Не пытайтесь играть роль морального стража и не задавайте вопросов. Вы не несете ответственности за то, что они делают с вашими продуктами.<br>\
	-Верность это бесценный ресурс, но дешевый для поддержания. Не обманывайте Шахтеров и Техников, работающих под вашим началом. <br>\
	- Благотворительность это оружие. При правильном использовании оно может творить чудеса для Вашего общественного имиджа. Несколько подарков разбросанных вокруг сделают приятно возвращающимся клиентам"

	duties = "Держите экипаж снабженным всем, что им может понадобиться, с хорошей прибылью для вас, конечно же<br>\
Скупайте ценные вещи у Мусорщиков и получайте прибыль, перепродавая их<br>\
Используйте свой горнодобывающий Персонал для сбора материала и минералов<br>\
Советуйте Капитану куда направлять корабль, а главное к выгоде"

	loyalties = "Как Торговец, ваша первая верность это деньги. Вы должны быть беспринципным, готовым продать что угодно и кому угодно, если только этот кто-то может заплатить вам. Направляйте Корабль к прибыльным начинаниям и заставьте Капитана сделать выбор, который будет финансово выгоден<br>\
Ваша вторая верность это верность гильдии. Обеспечьте ей хорошие взаимоотношения с Капитаном \"CEV Eris\" и не ставьте его в неловкое положение. Это означает ограничение вашего ценового раздолбайства только до умеренных уровней. Если вы поссоритесь со всеми, это может оказаться дорогостоящей ошибкой"

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

	outfit_type = /decl/hierarchy/outfit/job/cargo/merchant

	perks = list(/datum/perk/timeismoney)

/obj/landmark/join/start/merchant
	name = "Guild Merchant"
	icon_state = "player-beige-officer"
	join_tag = /datum/job/merchant



/datum/job/cargo_tech
	title = "Guild Technician"
	title_ru = "Техник"
	flag = GUILDTECH
	department = DEPARTMENT_GUILD
	department_flag = GUILD
	faction = "CEV Eris"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Торговцем"
	selection_color = "#c3b9a6"
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5, LANGUAGE_JIVE = 80)
	wage = WAGE_LABOUR_DUMB
//	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/cargo/cargo_tech

	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining,
		access_mining_station
	)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/scanner,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)


	description = "Вы низший член Торговой Гильдии Астеров и ученик местного Торговца. Возможно, однажды ты займешь его место. Вы в равных долях с Мусорщиками, Грузчиками, Лавочниками и Продавцами. Вспомните о главной роли гильдии здесь. Чтобы каждый был обеспечен всем, чем ему необхордимо, и извлекая из этого выгоду<br>\
<br>\
Ваши главные обязанности, поддерживать работу и прибыльность местного отделения Гильдии. Для этого вам следует обратить внимание на все следующие задачи:"

	duties = "	-Доставка товаров физическим лицам или отделам, которые их заказали<br>\
	-Укомплектование персонала на стойке регистрации, прием платежей и заказов, скупка предметов у Мусорщиков, которые приходят продавать вещи.<br>\
	-Посещение отделов, чтобы лично принимать заказы, спрашивать есть ли то, что им сейчас нужно, и пытаться продать им необычные предметы, которые могут помочь их усилиям.<br>\
	-Оказание иных услуг. Гильдия может быть там, где нужна их помощь, за небольшую плату естественно.<br>\
	-В более спокойное время отправляйтесь в зоны тех тоннелей и ищите полезные товары для перепродажи"

	loyalties = "		Ваша первая верность это верность себе и собственное выживание. Этот корабль в основном просто способ заработка для вас<br>\
		Ваша вторая верность торговец, он гарантирует, что вам хорошо платят и уважают, во вселенной, где рабочие часто рассматриваются как взаимозаменяемые части."

/obj/landmark/join/start/cargo_tech
	name = "Guild Technician"
	icon_state = "player-beige"
	join_tag = /datum/job/cargo_tech

/datum/job/mining
	title = "Guild Miner"
	title_ru = "Шахтер"
	flag = MINER
	department = DEPARTMENT_GUILD
	department_flag = GUILD
	faction = "CEV Eris"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Торговцем"
	selection_color = "#c3b9a6"
	wage = WAGE_LABOUR_HAZARD //The miners union is stubborn
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_SERBIAN = 5, LANGUAGE_JIVE = 80)

	outfit_type = /decl/hierarchy/outfit/job/cargo/mining

	description = "You are an asteroid miner, working in resource Procurement for the local branch of Asters' Merchant Guild.<br>\
Your primary responsibility is to head out on the Mining Barge, and dig up as much ore as you can on an asteroid. The barge contains all the facilities to process that ore too, and allows you to deliver refined materials ready for use.<br>\
<br>\
All the stuff you dig up goes to the guild, and from then on it's the merchant's responsibility to sell it to other departments. <br>\
<br>\
Your second responsibility is to help out aboard ship, while waiting to reach an asteroid. Quite notably, the roaches infesting the ship make heavy use of burrows to get around. You have the tools and expertise to effectively deal with these burrows, and you should try to destroy them wherever you find them<br>\
<br>\
Your third responsibility is as an unofficial security guard. The guild is a popular target for thieves, and one of the unspoken reasons for keeping rough, sturdy people like you on the payroll is to deter those thieves, and punish them with a swift beating for attempting to steal from the merchant. Try to keep the beatings nonlethal though, murder generates too much bad publicity<br>\
<br>\
Character Expectations:<br>\
	Miners should be tough and physically strong. Unafraid to get their hands dirty.<br>\
	You should be competent in an EVA suit and in operating heavy machinery"


	duties = "Dig up ores and minerals, process them into useable material.<br>\
	Collapse burrows around the ship to help fight off the roach infestation<br>\
	Protect the Guild wing and the merchant, from thieves and intruders."

	loyalties = "	Your first loyalty is to yourself and survival. This ship is mostly just a paycheck to you<br>\
	Your second loyalty is to the merchant, he ensures you're well paid and respected, in a universe where workers are often treated as interchangeable parts.	"

	access = list(
		access_maint_tunnels, access_mailsorting, access_cargo, access_cargo_bot, access_mining,
		access_mining_station
	)


	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
		STAT_MEC = 15
	)

	software_on_spawn = list(///datum/computer_file/program/supply,
							 ///datum/computer_file/program/deck_management,
							 /datum/computer_file/program/wordprocessor,
							 /datum/computer_file/program/reports)

/obj/landmark/join/start/mining
	name = "Guild Miner"
	icon_state = "player-beige"
	join_tag = /datum/job/mining
