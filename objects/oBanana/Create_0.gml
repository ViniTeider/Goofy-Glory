/// @description 

// Inherit the parent event
event_inherited();

cooldown = 30;
uses = 1;


function action() {

	show_debug_message("Atirou")
	
	
	// essse trecho é só pra fazer a bala sair da ponta da banana ao invés de dentro do personagem
	var vuvux = x + lengthdir_x((sprite_width - sprite_xoffset), image_angle);
	var vuvuy = y + lengthdir_y((sprite_width - sprite_xoffset), image_angle);
	
	with instance_create_layer(vuvux, vuvuy, "Instances", oBananaGround) {
		image_angle = other.image_angle; // só pro sprite nao ficar o mesmo
		direction = other.image_angle; // direção vai ser pra onde a vuvu aponta
		speed = 14; // valor arbitrário mudar conforme necessidade
		owner_id = other.owner.id; // passamos o id de quem atira pra prevenir ela de dar dano em quem atirou
	}
	
	other.owner.image_angle += 20;
	alarm[0] = 5;
	
	if uses <= 1 {
		breakWeapon(); // ora ora retornar se não pode usar
		return;
	}
	
	uses--;
}
