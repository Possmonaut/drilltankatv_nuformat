

/*
draw_primitive_begin(pr_linestrip);
for(var i=0; i<=100; i++)
{
    draw_vertex_colour(x+i*4, y+sin(current_time/100+i)*8, c_red, 1.0);
}
draw_primitive_end();
*/

/*
var vertexPointX = 0;
var vertexPointY = 0;



//for(var i=0; i<=100; i++)
//{
    vertexPointX = x;
	vertexPointY = y+sin(current_time/100)*8;
	seismoGrid[# vertexPointX, vertexPointY] = 1;
	//draw_point(vertexPointX, vertexPointY);
//}

//you need to store x,y pairs into a growing list, then incirment the X value before drawing them
//then if a x value reaches the end, balete it 
//basically make two lists


//so basically do the above but for a single point on the seismoGrid.
//whatever it's x and y is, set that to 1
//then draw all