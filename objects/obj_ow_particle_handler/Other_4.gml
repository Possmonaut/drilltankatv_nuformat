global.rockSpark = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.rockSpark, 2, 2, 0, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.rockSpark, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.rockSpark, 1, 1);
part_type_speed(global.rockSpark, 0, 5, -0.10, 0);
part_type_direction(global.rockSpark, 0, 359, 0, 0);
part_type_blend(global.rockSpark, false);
part_type_life(global.rockSpark, 10, 30);

global.rockDeath = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.rockDeath, 8, 12, 0, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.rockDeath, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.rockDeath, 1, 1);
part_type_speed(global.rockDeath, 0, 5, -0.20, 0);
part_type_direction(global.rockDeath, 0, 359, 0, 0);
part_type_blend(global.rockDeath, false);
part_type_life(global.rockDeath, 60, 180);

global.meatChunk = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_sprite(global.meatChunk,sp_meat_chunk,false,false,false);
part_type_size(global.meatChunk, 1, 1, 0, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.meatChunk, c_gray);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.meatChunk, 1, 1);
part_type_speed(global.meatChunk, 0, 5, -0.20, 0);
part_type_direction(global.meatChunk, 0, 359, 0, 0);
part_type_blend(global.meatChunk, false);
part_type_life(global.meatChunk, 60, 180);

global.dustPuff = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.dustPuff, 1, 2, 0.1, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.dustPuff, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.dustPuff, 1, 0);
part_type_direction(global.dustPuff, 90, 90, 0, 0);
part_type_speed(global.dustPuff, 0.1, 1, -0.20, 0);
part_type_blend(global.dustPuff, false);
part_type_life(global.dustPuff, 30, 60);

global.smokeParticle = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.smokeParticle, 4, 8, 0.1, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.smokeParticle, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.smokeParticle, 1, 0);
part_type_direction(global.smokeParticle, 80, 100, 0, 1);
part_type_speed(global.smokeParticle, 0.9, 0.1, -0.005, 0.1);
part_type_blend(global.smokeParticle, true);
part_type_life(global.smokeParticle, 120, 240);

global.trailParticle = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.trailParticle, 8, 8, -0.5, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.trailParticle, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.trailParticle, 1, 0);
part_type_direction(global.trailParticle, 0, 0, 0, 0);
part_type_speed(global.trailParticle, 0, 0, 0, 0);
part_type_blend(global.trailParticle, false);
part_type_life(global.trailParticle, 16, 16);

global.seismoParticle = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.seismoParticle, 1, 1, 0, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.seismoParticle, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.seismoParticle, 1, 1);
part_type_direction(global.seismoParticle, 90, 90, 0, 0);
part_type_speed(global.seismoParticle, 0.1, 0.1, 0, 0);
part_type_blend(global.seismoParticle, false);
part_type_life(global.seismoParticle, 3600, 3600);


global.sparkParticle = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.sparkParticle, 2, 2, -0.01, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.sparkParticle, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
//part_type_gravity(global.sparkParticle,0.5,270);
part_type_alpha2(global.sparkParticle, 1, 1);
part_type_direction(global.sparkParticle, 0, 359, 0, 0); //was 45 , 135
part_type_speed(global.sparkParticle, 3, 5, -0.01, 0);
part_type_blend(global.sparkParticle, true);
part_type_life(global.sparkParticle, 10, 30);

global.ventSteam = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_size(global.ventSteam, 8, 16, 0.1, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.ventSteam, c_white);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.ventSteam, 1, 0);
part_type_gravity(global.ventSteam, 0.025, 90);
part_type_direction(global.ventSteam, 0, 90, 5, 0);
part_type_speed(global.ventSteam, 1, 2.5, -0.05, 0);
part_type_blend(global.ventSteam, true);
part_type_life(global.ventSteam, 60, 120);

global.blood = part_type_create();
//part_type_shape(); //we don't do anything with this because the default shape is pixel
part_type_sprite(global.blood,sp_blood_fleck,false,false,false);
part_type_size(global.blood, 1, 1, 0, 0);
//part_type_color3(global.Particle1, c_aqua, c_lime, c_red);
part_type_colour1(global.blood, c_gray);
//part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_alpha2(global.blood, 1, 1);
part_type_speed(global.blood, 0, 5, -0.10, 0);
part_type_direction(global.blood, 0, 359, 0, 0);
part_type_blend(global.blood, false);
part_type_life(global.blood, 10, 30);

global.hairPart = part_type_create();
part_type_size(global.hairPart, 1, 1, 0, 0);
part_type_colour1(global.hairPart, c_white);
part_type_alpha2(global.hairPart, 1, 0.5);
part_type_speed(global.hairPart, 0, 0, 0, 0);
part_type_direction(global.hairPart, 0,0, 0, 0);
part_type_blend(global.hairPart, false);
part_type_life(global.hairPart, 60, 60);

global.footPart = part_type_create();
part_type_sprite(global.footPart,sp_mimic_foot,false,false,false);
part_type_size(global.footPart, 1, 1, 0, 0);
part_type_colour1(global.footPart, c_white);
part_type_alpha2(global.footPart, 1, 0.5);
part_type_speed(global.footPart, 0, 0, 0, 0);
part_type_direction(global.footPart, 0,0, 0, 0);
part_type_blend(global.footPart, false);
part_type_life(global.footPart, 30, 30);

global.crystalPart = part_type_create();
part_type_sprite(global.crystalPart,sp_crystal_part,false,false,false);
part_type_size(global.crystalPart, 0.25, 1, 0, 0);
part_type_colour1(global.crystalPart, c_white);
part_type_alpha2(global.crystalPart, 1, 1);
part_type_direction(global.crystalPart, 0, 359, 0, 0);
part_type_orientation(global.crystalPart,0,180,0,0,false);
part_type_speed(global.crystalPart, 0, 5, -0.20, 0);
part_type_blend(global.crystalPart, true);
part_type_life(global.crystalPart, 60, 180);

global.treadPart = part_type_create();
part_type_sprite(global.treadPart,sp_tread_part,false,false,false);
part_type_size(global.treadPart, 1, 1, 0, 0);
part_type_colour1(global.treadPart, c_white);
part_type_alpha2(global.treadPart, 1, 0.25);
part_type_speed(global.treadPart, 0, 0, 0, 0);
part_type_direction(global.treadPart, 0,0, 0, 0);
part_type_blend(global.treadPart, false);
part_type_life(global.treadPart, 240, 240);