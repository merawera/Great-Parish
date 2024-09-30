/datum/job/roguetown/minister
	title = "Minister"
	flag = MINISTER
	department_flag = BLOODCULT
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	outfit = /datum/outfit/job/roguetown/minister
	display_order = JDO_MINISTER
	tutorial = "You have seen countless wounds over your time. Stitched the sores of blades, sealed honey over the bubous of plague. \
	A thousand deaths stolen from the carriagemen, yet these people will still call you a charlatan. Prove them wrong, or right."
	give_bank_account = 50
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

/datum/outfit/job/roguetown/minister/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/phys
	head = /obj/item/clothing/head/roguetown/roguehood/phys
	shoes = /obj/item/clothing/shoes/roguetown/boots
	shirt = /obj/item/clothing/suit/roguetown/shirt/robe/phys
	backr = /obj/item/storage/backpack/rogue/satchel
	pants = /obj/item/clothing/under/roguetown/tights/black
	wrists = /obj/item/keyring/ministry
	gloves = /obj/item/clothing/gloves/roguetown/leather/phys
	neck = /obj/item/clothing/neck/roguetown/phys
	backl = /obj/item/storage/backpack/rogue/satchel/surgbag
	belt = /obj/item/storage/belt/rogue/leather
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
