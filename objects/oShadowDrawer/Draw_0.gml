/// @description 


with( oPlayerParent ) {
	gpu_set_fog(true, c_black, 0, 0)
	
	
	draw_sprite_ext(sprite_index, image_index, x+sprite_xoffset*image_xscale, y+5, image_xscale, 1, image_angle-45, c_white, 0.40)
	
	
	gpu_set_fog(false, c_black, 0, 0)
	
	draw_self();
}

with( oKing ) {
	gpu_set_fog(true, c_black, 0, 0)
	
	
	draw_sprite_ext(sprite_index, image_index, x+25*image_xscale, y, image_xscale, 1, image_angle-45, c_white, 0.40)
	
	
	gpu_set_fog(false, c_black, 0, 0)
	
	draw_self();
}

//with( oWeapon ) {
//	gpu_set_fog(true, c_black, 0, 0)
	
	
//	draw_sprite_ext(sprite_index, image_index, x+sprite_xoffset*image_xscale, y+5, image_xscale, 1, image_angle-45, c_white, 0.40)
	
	
//	gpu_set_fog(false, c_black, 0, 0)
	
//	draw_self();
//}














