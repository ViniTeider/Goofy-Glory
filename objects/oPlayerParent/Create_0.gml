/// @desc Declaração de coisas

// Variaveis de sprites
idle_sprite = sPlayer1Idle;
moving_sprite = sPlayer1Running;

// Weapon que está sendo usada
weapon = noone;

// Variaveis de botões a serem apertados
left_key = noone;
right_key = noone;
up_key = noone;
down_key = noone;

pick_key = noone;
action_key = noone;

myColor = COLOR.BLUE;

pick_keyy = noone;
action_keyy = noone;

// Variaveis de velocidade / vida
vsp = 0; // Vertical speed
hsp = 0; // Horizontal speed
spd = 7; // Speed

// Variaveis de estado (n sei como chamar)
state = PLAYER.NORMAL;
knockback_cooldown = 30;

// Variaveis referentes ao controle
gp_index = noone;
controller_color = noone;
has_controller= noone;

// Função de knockback (é chamada quando o player colide)
function knockback(distancia, direcao) {
	// TODO: Arrumar para ir mais rapido e menos longe?

	// ScreenShake
	screenshake(05, 3.5, 0.2);

	// Alteração das variaveis
    hsp = lengthdir_x(distancia, direcao);
    vsp = lengthdir_y(distancia, direcao);
    state = PLAYER.STUNNED;
    knockback_cooldown = 60
}

function hit(dano) {
	oKing.laugh_time = 60;
	
	with instance_create_layer(oKing.x, oKing.y - oKing.sprite_yoffset, "Instances", oFloatingText) {
		text = "HaHa";
	}
	
	
	switch myColor {
		case COLOR.BLUE:
			global.risometro_laranja += 1;
			global.risometro_azul = max(0, global.risometro_azul - dano);
			break;
		case COLOR.ORANGE:
			global.risometro_azul += dano;
			global.risometro_laranja = max(0, global.risometro_laranja - dano);
			break;
	}
}