/// @description 


// Inherit the parent event
event_inherited();

uses = 1;
cooldown = 0;

function action() {
	if uses <= 0 return; // ora ora retornar se não pode usar!
	
	show_debug_message($"Atirou: {object_get_name(object_index)}")
	
		
	with instance_create_layer(x, y, "Instances", oKickBall) {
		image_angle = other.image_angle; // só pro sprite nao ficar o mesmo
		owner_id = other.owner.id; // passamos o id de quem atira pra prevenir ela de dar dano em quem atirou
		
		hsp = lengthdir_x(12, other.image_angle);
		vsp = lengthdir_y(12, other.image_angle);
		
		other.weapon = noone;
		owner = noone;
		state = ARMA.THROWN;
	}
	uses--;
	instance_destroy();
}