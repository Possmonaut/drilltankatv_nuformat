//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 mapGridInside;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 sColor;

	sColor = texture2D(gm_BaseTexture, v_vTexcoord);
	float bungus;
	
	//bungus = mapGridInside[v_vTexcoord.x, v_vTexcoord.y];
	
	//something like
	if(bungus == 1.0) //mapGrid needs to be passed in to this shader
	{

		sColor.r = 1.0;
		sColor.b = 1.0;
		sColor.g = 1.0;
	}
	else
	{

		sColor.r = 0.0;
		sColor.b = 0.0;
		sColor.g = 0.0;
	}
	
    gl_FragColor = sColor;
}
