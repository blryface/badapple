#version 120

#define entites_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define entites_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define entites_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define entites_shadows 1 //[1 0]

uniform sampler2D texture;
uniform sampler2D lightmap;

varying vec2 lmcoord;
varying vec2 texCoord;
varying vec4 glcolor;

void main(){
	vec4 outputColorData = texture2D(texture, texCoord) * glcolor;
    vec3 outputColor = vec3(entites_red, entites_green, entites_blue);
    outputColorData *= texture2D(lightmap, lmcoord);
    
/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, outputColorData.a);
}