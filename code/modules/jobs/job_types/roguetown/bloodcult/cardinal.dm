/datum/job/roguetown/cardinal
	title = "Cardinal"
	flag = CARDINAL
	department_flag = BLOODCULT
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/roguetown/cardinal
	display_order = JDO_CARDINAL
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

/datum/outfit/job/roguetown/cardinal/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	head = /obj/item/clothing/head/roguetown/helmet/heavy/guard
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.change_stat("strength", 5)
	ADD_TRAIT(H, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)
	if(H.patron != /datum/patron/bloodcult)
		H.patron = GLOB.patronlist[/datum/patron/bloodcult]
		to_chat(H, "<span class='warning'>I am of [H.patron]. I serve to propagate The Blood within the Great Parish.")
