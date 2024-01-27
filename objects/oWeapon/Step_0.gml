/// @desc Insert description here


// Checa se o player ta em contato, e também guarda a instancia do player q tá em cima;
player_contact = instance_place(x, y, oPlayerParent);


switch state {
	case ARMA.GROUND:
		with player_contact {
			if pick_key && weapon == noone {
				other.state = ARMA.OWNED;
				other.owner = self;
				weapon = other;
			}
		}
		break;
		
	case ARMA.OWNED:
		moving = abs(owner.hsp) + abs(owner.vsp)
		
		// Faz com que a arma não fique de ponta cabeça
		if (sign(owner.hsp != 0)){
			image_yscale = owner.image_xscale;
		}
		
		// Caso o usuário tenha controle
		if owner.has_controller {
				depth = owner.depth - 1; // Faz com que a arma não fique por baixo do player
				
				var joystick_h = gamepad_axis_value(owner.gp_index, gp_axisrh);
				var joystick_v = gamepad_axis_value(owner.gp_index, gp_axisrv);
		
				var distance = 35; // Distancia da arma do player
		
				// Rotaciona para a direção do joystick
				if ((point_direction(0, 0, joystick_h, joystick_v)) != 0) {
					angle = point_direction(0, 0, joystick_h, joystick_v);
				}
				
				image_angle = angle;
					
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
			break;
		}
		
		if owner.pick_key {
			owner.weapon = noone;
			state = ARMA.GROUND;
			owner = noone;
		}
	
		break;


	case ARMA.THROWN:
		
		image_angle = image_angle + 2;
	
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
		
		if ((hsp >= -2 && hsp <= 2) && (vsp >= -2 && vsp <= 2)){
			hsp = 0;
			vsp = 0;
			
			state = ARMA.GROUND;
		}

		x += hsp; 
		y += vsp;

		hsp = lerp(hsp, 0, 0.01);
		vsp = lerp(vsp, 0, 0.01);
	break;
}