#version 150

#extension GL_ARB_explicit_attrib_location : enable

uniform sampler2D gtexture;

#define blocks_red 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define blocks_green 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define blocks_blue 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define cutout_blocks_are_inverted 0 // [0 1]

in vec2 texCoord;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = vec3(blocks_red, blocks_green, blocks_blue);
    float transparency = outputColorData.a;
    if (transparency < 0.1){
        discard;
    }
    if(cutout_blocks_are_inverted == 1){
        outputColor = 1-outputColor;
    }
    outColor0 = vec4(outputColor, transparency);
}