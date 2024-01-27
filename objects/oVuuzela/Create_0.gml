/// @description 

// Inherit the parent event
event_inherited();

cooldown = 30;
uses = 3;

function action() {
	if uses <= 0 return; // ora ora retornar se não pode usar!
	
	show_debug_message("Atirou")
	
	// essse trecho é só pra fazer a bala sair da ponta da vuvuzela ao invés
	// de dentro do personagem
	var vuvux = x + lengthdir_x((sprite_width - sprite_xoffset), image_angle);
	var vuvuy = y + lengthdir_y((sprite_width - sprite_xoffset), image_angle);
	
	with instance_create_layer(vuvux, vuvuy, "Instances", oProjectile) {
		image_angle = other.image_angle; // só pro sprite nao ficar o mesmo
		direction = other.image_angle; // direção vai ser pra onde a vuvu aponta
		speed = 5; // valor arbitrário mudar conforme necessidade
		owner_id = other.owner.id; // passamos o id de quem atira pra prevenir ela de dar dano
		// em quem atirou
	}
	uses--;
}
