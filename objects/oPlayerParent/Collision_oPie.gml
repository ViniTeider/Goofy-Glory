if (other.owner != self && other.state == ARMA.THROWN && other.owner_id != id){
	hit(1);
	audio_play_sound(cartoon_splat_6086,0,false,1,0);
	other.state = ARMA.PIED
	other.owner = self;
	other.sprite_index = sPieHit;
	other.image_angle  = 0;
}
