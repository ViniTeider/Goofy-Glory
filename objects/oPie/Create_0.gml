/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

uses = 1;
cooldown = 0

function action() {
	if uses <= 0 return; // ora ora retornar se não pode usar
		
	with instance_create_layer(x, y, "Instances", oPie) {
		image_angle = other.image_angle; // só pro sprite nao ficar o mesmo
		sprite_index = sPieFlying;
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

function pie() {
	x = owner.x + 5 * owner.image_xscale;
	y = owner.y -7;
	image_xscale = owner.image_xscale;
	depth = owner.depth - 1
}