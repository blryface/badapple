#version 120

#define blocks_red 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define blocks_green 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define blocks_blue 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define cutout_blocks_are_inverted 0 // [0 1]

uniform sampler2D texture;

varying vec2 texCoord;
varying vec4 glcolor;

void main(){
    vec4 outputColorData = texture2D(texture,texCoord) * glcolor;
    vec3 outputColor = vec3(blocks_red, blocks_green, blocks_blue);
    float transparency = outputColorData.a;
    if(cutout_blocks_are_inverted == 1){
        outputColor = 1-outputColor;
    }
/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, transparency);
}