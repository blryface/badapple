#version 150

#define sun_and_moon_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define sun_and_moon_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define sun_and_moon_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

uniform sampler2D gtexture;

in vec2 texCoord;
in vec4 glcolor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main(){
    vec3 outputColor = vec3(sun_and_moon_red,sun_and_moon_green,sun_and_moon_blue);
    vec4 outputColorData = texture(gtexture,texCoord)*glcolor;

    if ((outputColorData.r+outputColorData.g+outputColorData.b) < 0.38 ) {
        discard;
    }
	outColor0 = vec4(outputColor, outputColorData.a);
}