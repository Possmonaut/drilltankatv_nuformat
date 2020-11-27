//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord; //coordinates of current pixel
varying vec4 v_vColour; // this is the default stored color of the sprite
uniform float distMult;
//uniform float pixelH;
//uniform float pixelW;

//we'll have to change this to alpha as well later on



void main()
{

vec4 sColor;

sColor = texture2D(gm_BaseTexture, v_vTexcoord);

if(sColor.r > 0.0)
	{
		sColor.r = sColor.r * distMult;
		sColor.b = sColor.b * distMult;
		sColor.g = sColor.g * distMult;
		//sColor.a = 1.0;
	}
	else
	{
		sColor.r = 0.0;
		sColor.b = 0.0;
		sColor.g = 0.0;
	}
	
	//sColor = vec4(255, 255, 255, 1);
	
    gl_FragColor = sColor;
	
}

//just mult it via modifier
//base will always be 1
// 255 * 0.5 = 127
// 255 * 0.25 = 63
// 0 * whatever = 0
// 255 * 1 = 255

//so get coordinates, set variable according to distmult, then apply to the coordinates
