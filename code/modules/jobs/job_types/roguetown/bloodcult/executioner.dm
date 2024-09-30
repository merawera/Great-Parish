/datum/job/roguetown/executioner
	title = "Executioner"
	flag = EXECUTIONER
	department_flag = BLOODCULT
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	outfit = /datum/outfit/job/roguetown/executioner
	display_order = JDO_EXECUTIONER
	tutorial = "You have seen countless wounds over your time. Stitched the sores of blades, sealed honey over the bubous of plague. \
	A thousand deaths stolen from the carriagemen, yet these people will still call you a charlatan. Prove them wrong, or right."
	give_bank_account = 25
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

/datum/outfit/job/roguetown/executioner/pre_equip(mob/living/carbon/human/H)
    ..()
    head = /obj/item/clothing/head/roguetown/helmet/heavy/captain
    if(H.mind)
        H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
        H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
        H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
    if(H.age == AGE_OLD)
        H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
    H.change_stat("intelligence", 2)
    H.change_stat("speed", 1)
    ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
    ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
    if(H.patron != /datum/patron/bloodcult)
        H.patron = GLOB.patronlist[/datum/patron/bloodcult]
        to_chat(H, "<span class='warning'>I am of [H.patron]. I serve to propagate The Blood within this Great Parish.")
