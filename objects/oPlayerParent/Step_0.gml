/// @desc Insert description here

//var gp_num = gamepad_get_device_count();
//for (var i = 0; i < gp_num; i++;)
//{
//    if gamepad_is_connected(i)
//    {
//        global.gp[i] = true;
//    }
//    else
//    {
//        global.gp[i] = false;
//    }
//}

//show_debug_message(gp_num);

if (gamepad_is_connected(gp_index)) {
	has_controller = true;
	gamepad_set_axis_deadzone(gp_index, 0.2); // seta o deadzone do analogico do controle
	gamepad_set_color(gp_index, controller_color); // seta a cor
}

// Verifica se foi clicado alguma das teclas de movimentação
left_key = keyboard_check(left_keyy) || gamepad_axis_value(gp_index, gp_axislh) < 0;
right_key = keyboard_check(right_keyy) || gamepad_axis_value(gp_index, gp_axislh) > 0;
up_key = keyboard_check(up_keyy) || gamepad_axis_value(gp_index, gp_axislv) < 0;
down_key = keyboard_check(down_keyy) || gamepad_axis_value(gp_index, gp_axislv) > 0;

// Verifica se o botão das ações foi clicado
pick_key = keyboard_check_pressed(pick_keyy) || gamepad_button_check_pressed(gp_index, gp_face1);
action_key = keyboard_check_pressed(action_keyy) || gamepad_button_check_pressed(gp_index, gp_shoulderrb);

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
			
			if(weapon) weapon.image_alpha = 0;
			 
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
				if(weapon) weapon.image_alpha = 1;
				state = PLAYER.NORMAL
				image_angle = 0;
				break; 
		}
		
		case PLAYER.LOST:
			break;
}


// Faz a verificação da bigorna caindo
if place_meeting(x,y - 55 ,oAnvil){
	show_debug_message(image_yscale);
	
	audio_stop_sound(anvilFalling);
	if (!audio_is_playing(anvilHit)){
		audio_play_sound(anvilHit,0,false,1,0);
	}
	
	if (image_yscale > 0.25){
		image_yscale = image_yscale  - 0.09;
	}
}










depth = -y