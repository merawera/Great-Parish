/datum/job/roguetown/bishop
	title = "Bishop"
	flag = BISHOP
	department_flag = BLOODCULT
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/roguetown/bishop
	display_order = JDO_BISHOP
	tutorial = "You have seen countless wounds over your time. Stitched the sores of blades, sealed honey over the bubous of plague. \
	A thousand deaths stolen from the carriagemen, yet these people will still call you a charlatan. Prove them wrong, or right."
	give_bank_account = 500
	selection_color = "#7e2828"
	min_pq = 1


	//Reason all races allowed is you are basically a very talented court physician; even 'lower races' would find this to be one of the only ways to obtain a sort of nobility.
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	allowed_sexes = list(MALE, FEMALE)

	cmode_music = 'sound/music/combat_physician.ogg'

/datum/job/roguetown/bishop/after_spawn(mob/living/B, mob/B, latejoin = TRUE)
	..()
	if(SSticker.rulertype == "Bishop")
		SSticker.select_ruler()
		if(B)
			to_chat(world, "<b><span class='notice'><span class='big'>[B.real_name] is the Bishop of Great Parish.</span></span></b>")
			to_chat(world, "<br>")

/datum/outfit/job/roguetown/bishop/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	shoes = /obj/item/clothing/shoes/roguetown/boots
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/feld
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/storage/backpack/rogue/satchel/surgbag
	pants = /obj/item/clothing/under/roguetown/tights/black
	gloves = /obj/item/clothing/gloves/roguetown/leather/feld
	head = /obj/item/clothing/head/roguetown/helmet/feld
	r_hand = /obj/item/clothing/head/roguetown/roguehood/feld
	mask = /obj/item/clothing/mask/rogue/feld
	neck = /obj/item/clothing/neck/roguetown/feld
	belt = /obj/item/storage/belt/rogue/leather
	wrists = /obj/item/keyring/ministry
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 4)
	H.change_stat("constitution", -1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	if(H.patron != /datum/patron/bloodcult)
		H.patron = GLOB.patronlist[/datum/patron/bloodcult]
		to_chat(H, "<span class='warning'>I am of [H.patron]. I serve to propagate The Blood within the Great Parish.")