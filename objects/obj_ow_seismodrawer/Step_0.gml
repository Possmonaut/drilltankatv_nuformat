timer ++;

if(timerRand <= timer)
{
	timerRand = timer + irandom(300);
	magGain = irandom(80);
}

if(magGain <= 8)
{
magGain = 0;
}


var XX = x+sin(current_time/100)*magGain;
var YY = y;
magGain --;

part_particles_create(global.P_System,XX,YY,global.seismoParticle,1);

part_particles_create(global.P_System,x,y,global.seismoParticle,1);
