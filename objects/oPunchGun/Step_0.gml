event_inherited();


if (image_angle > 240 and image_angle < 300 or image_angle > 60 and image_angle < 120) {
	if cooldown > 0 sprite_index = sGunUpEmpty
	else sprite_index = sGunUp;
} else {
	if cooldown > 0 sprite_index = sGunEmpty
	else sprite_index = sGun;
}