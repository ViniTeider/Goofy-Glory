/// @description 
randomise();


// Inherit the parent event
event_inherited();

cooldown = 0;
bounce = 5;
if (random(1) < 0.1) sprite_index = sDuckHat;

function action()  {
	
	show_debug_message($"Atirou: {object_get_name(object_index)}")
	
	audio_play_sound(hit1,0,false,1,0);
	
	owner_id = other.owner.id; // passamos o id de quem atira pra prevenir ela de dar dano em quem atirou
		
	hsp = lengthdir_x(25, other.image_angle);
	vsp = lengthdir_y(25, other.image_angle);
		
	owner.weapon = noone;
	owner = noone;
	state = ARMA.THROWN;
}

function thrown() {
	image_angle += 2;
	
	// Faz com que exista uma colisão com a parede
	if place_meeting(x + hsp, y, oSolid) { // Checa colisao com a velocidade
		while(!place_meeting(x + sign(hsp), y, oSolid)) { // Repete até estar pixel a pixel com a parede
			x += sign(hsp);
		}	
		audio_play_sound(RUBBER_DUCK,0,false,1,0);
		hsp = -hsp; // inverte a direção
		bounce--
	}

	if place_meeting(x, y + vsp, oSolid) { // Checa colisao com a velocidade
		while(!place_meeting(x, y + sign(vsp), oSolid)) { // Repete até estar pixel a pixel com a parede
			
			y += sign(vsp);
			
		}	
		audio_play_sound(RUBBER_DUCK,0,false,1,0);
		vsp = -vsp; // inverte a direção 
		bounce--
	}
	
	if(bounce <= 0) {
		instance_destroy(self);
	}
		
	if ((hsp >= -2 && hsp <= 2) && (vsp >= -2 && vsp <= 2)){
		hsp = 0;
		vsp = 0;
		
		owner_id = noone;
		state = ARMA.GROUND;
	}

	x += hsp; 
	y += vsp;

	hsp = lerp(hsp, 0, 0.01);
	vsp = lerp(vsp, 0, 0.01);
}