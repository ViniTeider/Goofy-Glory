/// @desc Insert description here

event_inherited();


if (image_angle == 270 || image_angle == 90) {
	if cooldown > 0 sprite_index = sGunUpEmpty
	else sprite_index = sGunUp;
} else {
	if cooldown > 0 sprite_index = sGunEmpty
	else sprite_index = sGun;	
	
}
