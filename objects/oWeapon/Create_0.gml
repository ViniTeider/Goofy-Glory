/// @desc Insert description here

enum ARMA {
	GROUND, // 0
	OWNED, // 1
	THROWN, // 2
	PIED,
	SPAWN
}

// Stats das armas
cooldown_max = 60 // o jogo roda a 60 fps o step roda 60vezes por segundo
			  // então se a gente fizer cooldown-- vai demorar 60frames(1sec) pra ele zerar
			 // se quiser colocar qlr valor faz 60 * valor_segundos
			 
cooldown = cooldown_max
uses = 0;
defaultImageIndex = image_index

state = ARMA.GROUND;
player_contact = noone;

//dono da arma
owner = noone;

// variaveis pra jogar a arma
angle = 0;
hsp = 0;
vsp = 0;
bounce = 1; // qtdes de bounces
			// qnd n tiver mais bounces a velocidade para da pra usar -1 como infinito.


// Executa quando os usos da arma acabam
function breakWeapon() {
	other.owner.image_angle = 0;
	state = ARMA.GROUND
	owner.weapon = noone;
	owner = noone;
	instance_destroy();
	return;
}



// Fucao paa a arma fazx popo
function action() {
	// Cara de quem foi a ideia de colocar self.na
	// coisa do chico certeza kkkkkkkkkk
	show_debug_message($"Action for object: {object_get_name(object_index)}")
};

// Weapon Create
function owned() {
	moving = abs(owner.hsp) + abs(owner.vsp)
		
	// Caso o usuário tenha controle
	if owner.has_controller {
		var joystick_h = gamepad_axis_value(owner.gp_index, gp_axisrh);
		var joystick_v = gamepad_axis_value(owner.gp_index, gp_axisrv);
		
		var distance = 35; // Distancia da arma do player
		
		// Rotaciona para a direção do joystick
		if ((point_direction(0, 0, joystick_h, joystick_v)) != 0) {
			angle = point_direction(0, 0, joystick_h, joystick_v);
		}

		image_angle = angle;
		if image_angle > 90 and image_angle < 270 image_yscale = -1
		else image_yscale = 1
		
		if image_angle < 180 depth = owner.depth + 1
		else depth = owner.depth - 1
					
		x = owner.x + lengthdir_x(distance, angle);
		y = owner.y + lengthdir_y(distance, angle);

	}
	// Caso não tenha controle (no teclado) e esteja se movendo
	else if(moving) {
		// Separa a arma do player
		x = owner.x + (sign(owner.hsp) * 13);
		y = owner.y + (sign(owner.vsp) * 20);
		// Rotaciona a arma
		image_angle = point_direction(0, 0, owner.hsp, owner.vsp);
			
		// Coloca a arma por baixo caso esteja indo para cima
		if (sign(owner.vsp) < 0) depth = owner.depth + 1;	
		else depth = owner.depth - 1;
	}
		
	
	// vamos tirando o cooldown a cada frame
	if cooldown > 0 {
		cooldown--;	
	}
		
	if owner.action_key && cooldown <= 0 {
		action();
		cooldown = cooldown_max;
		return;
	}
		
	if owner.pick_key {
		owner.weapon = noone;
		state = ARMA.GROUND;
		owner = noone;
	}
}


function ground() {
	//player_contact = instance_place(x, y, oPlayerParent);
	player_contact = collision_circle(x, y, 40, oPlayerParent, false, true)
	
	with player_contact {
		if pick_key && weapon == noone && !pied {
			other.state = ARMA.OWNED;
			other.owner = self;
			weapon = other;
		}
	}
}

function thrown() {
		// Faz com que exista uma colisão com a parede
		if place_meeting(x + hsp, y, oSolid) { // Checa colisao com a velocidade
			while(!place_meeting(x + sign(hsp), y, oSolid)) { // Repete até estar pixel a pixel com a parede
				x += sign(hsp);
			}	
			hsp = -hsp; // inverte a direção 
			bounce --;
		}

		if place_meeting(x, y + vsp, oSolid) { // Checa colisao com a velocidade
			while(!place_meeting(x, y + sign(vsp), oSolid)) { // Repete até estar pixel a pixel com a parede
				y += sign(vsp);
			}	
			vsp = -vsp; // inverte a direção 
			bounce --;
			
		}
		
		if ((hsp >= -2 && hsp <= 2) && (vsp >= -2 && vsp <= 2)){
			hsp = 0;
			vsp = 0;
			
			state = ARMA.GROUND;
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
			
		state = ARMA.GROUND;
	}

	x += hsp; 
	y += vsp;

	hsp = lerp(hsp, 0, 0.01);
	vsp = lerp(vsp, 0, 0.01);
}

function pie() {
	show_debug_message("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 😭😱🔥")
}