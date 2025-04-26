#version 120

#define sun_and_moon_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define sun_and_moon_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define sun_and_moon_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

uniform sampler2D texture;
uniform sampler2D lightmap;
uniform sampler2D shadowtex0;

varying vec2 texCoord;
varying vec4 glcolor;

void main(){
    vec3 outputColor = vec3(sun_and_moon_red,sun_and_moon_green,sun_and_moon_blue);
	vec4 outputColorData = texture2D(texture, texCoord) * glcolor;

    if ((outputColorData.r+outputColorData.g+outputColorData.b) < 0.38 ) {
        discard;
    }
/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(outputColor, outputColorData.a); //gcolor
}