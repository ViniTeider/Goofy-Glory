/// @description Insert description here
// You can write your code in this editor

// Spawn entity
entity = choose(oBanana, oDuck, oPie, oPunchGun);



spawnPosition = spawns[randInt(1, 3)]
range = spawnPosition[2]
shootAngle = randInt(270 - range, 270 + range);

with instance_create_layer(spawnPosition[0], spawnPosition[1], "Instances", entity) {
	hsp = lengthdir_x(randInt(6, 10), other.shootAngle);
	vsp = lengthdir_y(randInt(6, 10), other.shootAngle);
		
	state = ARMA.SPAWN;
}

alarm[0] = 60 * spawnRate