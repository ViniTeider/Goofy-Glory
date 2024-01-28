/// @desc Insert description here

moveDir = 1

with(instance_create_layer(oKing.x, oKing.y + 20, "Instances", oLaught)) {
	moveDir = other.moveDir
}

alarm[1] = max(1, 6 * (10 - global.risometro_azul))