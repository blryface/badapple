#version 120

#define hand_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define hand_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define hand_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define hand_invisible 0 // [1 0]

uniform sampler2D texture;

varying vec2 texCoord;
varying vec4 glcolor;

void main(){
    #if hand_invisible == 1
    discard;
    #endif
    vec4 outputColorData = texture2D(texture,texCoord) * glcolor;
    vec3 outputColor = vec3(hand_red,hand_green, hand_blue);
    float transparency = outputColorData.a;
/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, transparency);
}