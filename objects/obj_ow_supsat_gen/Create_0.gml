//dropped in spsat death
//wait x
//play respawn anim
//replace floortile with correct tile
//spawn new block
//new block also needs the code that if the player is inside of it when it is done
//it will break
//said unique "collision break" will have it place a new spawner 

timer = 0;
time = 240;

sizeGain = 1/240;

vibOFST = 0;
vibTimer = 0;

ind = irandom(sprite_get_number(sp_block_supsat));

size = 0;

var l = layer_get_id("Tiles_1");

myLayer = layer_tilemap_get_id(l);

