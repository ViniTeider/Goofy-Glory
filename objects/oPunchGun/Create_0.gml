/// @description 

// Inherit the parent event
event_inherited();

cooldown_max = 80;
cooldown = 0
uses = 3;

function action() {
	//gamepad_set_vibration(owner.gp_index, 1, 1);
	
	screenshake(05, 1.1, 0.2);
	audio_play_sound(bilisque_piu_ggjcwb,0,false,1,0);
	
	// essse trecho é só pra fazer a bala sair da ponta da vuvuzela ao invés de dentro do personagem
	var vuvux = x + lengthdir_x((sprite_width - sprite_xoffset), image_angle);
	var vuvuy = y + lengthdir_y((sprite_width - sprite_xoffset), image_angle);
	
	with instance_create_layer(vuvux, vuvuy, "Instances", oPunch) {
		image_angle = other.image_angle; // só pro sprite nao ficar o mesmo
		direction = other.image_angle; // direção vai ser pra onde a vuvu aponta
		speed = 20; // valor arbitrário mudar conforme necessidade
		owner_id = other.owner.id; // passamos o id de quem atira pra prevenir ela de dar dano em quem atirou
	}
	
	other.owner.image_angle += 20;
	sprite_index = sGunEmpty;
	alarm[0] = 5;
	
	if uses <= 1 {
		breakWeapon(); // ora ora retornar se não pode usar
		return;
	}
	
	uses--;
}
