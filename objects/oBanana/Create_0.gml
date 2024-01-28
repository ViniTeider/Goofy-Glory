/// @description 


// Inherit the parent event
event_inherited();

uses = 1;
cooldown = 0;

setted = false;

function action() {
	audio_play_sound(hit1,0,false,1,0);
	if uses <= 0 return; // ora ora retornar se não pode usar!
	
	show_debug_message($"Atirou: {object_get_name(object_index)}")
	
		
	with instance_create_layer(x, y, "Instances", oBanana) {
		image_angle = other.image_angle; // só pro sprite nao ficar o mesmo
		owner_id = other.owner.id; // passamos o id de quem atira pra prevenir ela de dar dano em quem atirou
		
		hsp = lengthdir_x(12, other.image_angle);
		vsp = lengthdir_y(12, other.image_angle);
		
		other.owner.weapon = noone;
		owner = noone;
		state = ARMA.THROWN;
	}
	uses--;
	instance_destroy();
}

function thrown() {
	image_angle++;
	
	// Faz com que exista uma colisão com a parede
	if place_meeting(x + hsp, y, oSolid) { // Checa colisao com a velocidade
		while(!place_meeting(x + sign(hsp), y, oSolid)) { // Repete até estar pixel a pixel com a parede
			x += sign(hsp);
		}	
		hsp = -hsp; // inverte a direção 
	}

	if place_meeting(x, y + vsp, oSolid) { // Checa colisao com a velocidade
		while(!place_meeting(x, y + sign(vsp), oSolid)) { // Repete até estar pixel a pixel com a parede
			y += sign(vsp);
		}	
		vsp = -vsp; // inverte a direção 
	}
		
	if ((hsp >= -2 && hsp <= 2) && (vsp >= -2 && vsp <= 2) && setted = false){
		hsp = 0;
		vsp = 0;
		setted = true;
		sprite_index = sBananaGround;
		image_angle = 0;
		state = -1;
	}

	x += hsp; 
	y += vsp;

	hsp = lerp(hsp, 0, 0.01);
	vsp = lerp(vsp, 0, 0.01);
}

function spawn() {
	if ((hsp >= -2 && hsp <= 2) && (vsp >= -2 && vsp <= 2)){
		hsp = 0;
		vsp = 0;
		
		if(random(1) < 0.3) {
			setted = true;
			sprite_index = sBananaGround;
			image_angle = 0;
			state = -1;
		}
		else {
			state = ARMA.GROUND;
		}
	}

	x += hsp; 
	y += vsp;

	hsp = lerp(hsp, 0, 0.01);
	vsp = lerp(vsp, 0, 0.01);
}