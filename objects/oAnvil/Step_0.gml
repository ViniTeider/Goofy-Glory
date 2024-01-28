/// @desc Insert description here

x = owner.x

//if (y <= owner.bbox_top - sprite_height){
//	y += 10;
//}

if (!place_meeting(x,y + 10, owner)){
	y += 10;
}

depth = owner.depth - 1;