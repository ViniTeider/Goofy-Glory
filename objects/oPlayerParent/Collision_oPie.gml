if (other.owner != self && other.state == ARMA.THROWN && other.owner_id != id){	
	hit(1);
	audio_play_sound(cartoon_splat_6086,0,false,1,0);
	other.state = ARMA.PIED
	other.owner = self;
	other.sprite_index = sPieHit;
	other.image_angle  = 0;
	
	with(instance_create_layer(x,y,"Instances",oDizzyEffect))
	{
		owner = other;
		other.dizzy = self;
	}
	
	if(weapon) {
		weapon.state = ARMA.GROUND;
		weapon.image_angle = 0
		weapon.image_index = weapon.defaultImageIndex
		weapon.owner = noone;
		weapon = noone;
	}
	pied = true
	pie = other;
	alarm[0] = 180
}
