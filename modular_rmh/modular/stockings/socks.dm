/obj/item/legwears
	name = "stockings(under)"
	desc = "A legwear made just for the pure aesthetics. Popular in courts and brothels alike."
	icon = 'modular_hearthstone/icons/obj/items/clothes/stockings.dmi'
	icon_state = "stockings"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	var/gendered
	var/race
	var/datum/bodypart_feature/legwear/legwears_feature
	var/covers_breasts = FALSE
	sewrepair = TRUE

/obj/item/legwears/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.legwear_socks)
			if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN))
				return
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, needhand = 1, target = H))
				var/obj/item/bodypart/chest = H.get_bodypart(BODY_ZONE_CHEST)
				chest.add_bodypart_feature(legwears_feature)
				user.dropItemToGround(src)
				forceMove(H)
				H.legwear_socks = src

/obj/item/legwears/silk
	name = "silk stockings(under)"
	desc = "A legwear made just for the pure aesthetics. Made out of thin silk. Popular among nobles."
	icon_state = "silk"

/obj/item/legwears/fishnet
	name = "fishnet stockings(under)"
	desc = "A legwear popular among wenches."
	icon_state = "fishnet"
