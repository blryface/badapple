#version 120

#define Translusent_blocks_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_translusency_addition 0 // [-1 -0.5 0 0.5 1]

uniform sampler2D texture;

varying vec2 texCoord;
varying vec4 glcolor;

void main(){
    vec4 outputColorData = texture2D(texture,texCoord) * glcolor;
    vec3 outputColor = vec3(Translusent_blocks_red, Translusent_blocks_green, Translusent_blocks_blue);
    float transparency = outputColorData.a;
/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, transparency+Translusent_blocks_translusency_addition);
}