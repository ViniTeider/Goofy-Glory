/// @desc Insert description here

// Verifica se foi clicado alguma das teclas de movimentação
left_key = keyboard_check(left_keyy);
right_key = keyboard_check(right_keyy);
up_key = keyboard_check(up_keyy);
down_key = keyboard_check(down_keyy);


// Verifica se o botão das ações foi clicado
pick_key = keyboard_check_pressed(pick_keyy);
action_key = keyboard_check_pressed(action_keyy);


// muda o movimento caso o player esteja em estado estunado
switch state {
	
	// MOVIMENTAÇÃO NORMAL DO PLAYER
	case PLAYER.NORMAL:
		hsp = (right_key - left_key) * spd;
		vsp = (down_key - up_key) * spd;
		
		if (hsp == 0 && vsp == 0) {
			sprite_index = idle_sprite;
		}
		else {
			if (hsp != 0) image_xscale = sign(hsp);
			sprite_index = moving_sprite;
		}
		
		
		// Faz com que exista uma colisão com a parede
		if place_meeting(x + hsp, y, oSolid) { // Checa colisao com a velocidade
			while(!place_meeting(x + sign(hsp), y, oSolid)) { // Repete até estar pixel a pixel com a parede
				x += sign(hsp);
			}
			hsp = 0;
		}

		if place_meeting(x, y + vsp, oSolid) { // Checa colisao com a velocidade
			while(!place_meeting(x, y + sign(vsp), oSolid)) { // Repete até estar pixel a pixel com a parede
				y += sign(vsp);
			}
			vsp = 0;
		}

		if (hsp != 0 && vsp != 0){
			hsp = hsp / sqrt(2);
			vsp = vsp / sqrt(2);
		}
		x += hsp;
		y += vsp;
		
		break;
		
	// MOVIMENTAÇÃO CASO O PLAYER ESTEJA STUNNED (VOANDO)
	case PLAYER.STUNNED:
		if knockback_cooldown > 0 {
			knockback_cooldown--; // Reduz o valor em 1 a cada frame
			 
			 if hsp != 0 {
				 image_xscale = sign(hsp);
			 }
			 
			 image_angle += 20;
			 
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
		
			if ((hsp >= -0.3 && hsp <= 0.3) && (vsp >= -0.9 && vsp <= 0.9)){
				hsp = 0;
				vsp = 0;
				knockback_cooldown = 0;
			}

			x += hsp; 
			y += vsp;

			hsp = lerp(hsp, 0, 0.01);
			vsp = lerp(vsp, 0, 0.01);
		
			break;
			 
		} else {
			state = PLAYER.NORMAL
			image_angle = 0;
		    break; 
		}
}