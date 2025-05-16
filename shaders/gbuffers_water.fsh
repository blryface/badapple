#version 150

#extension GL_ARB_explicit_attrib_location : enable

uniform sampler2D gtexture;

#define Translusent_blocks_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_translusency_addition 0 // [-0.25 -0.125 0 2 4]
#define Translusent_blocks_invert_colors 0 // [0 1]

/* DRAWBUFFERS:01 */
layout(location = 0) out vec4 outColor0;
layout(location = 1) out vec4 inverted_block_color;

in vec2 texCoord;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = vec3(Translusent_blocks_red, Translusent_blocks_green, Translusent_blocks_blue);
    float transparency = (outputColorData.a+Translusent_blocks_translusency_addition)/(3*Translusent_blocks_invert_colors+1);

    if(transparency <= 0.15){
        transparency = 0;
    }
    inverted_block_color = vec4(Translusent_blocks_invert_colors,Translusent_blocks_invert_colors,Translusent_blocks_invert_colors,1);
    outColor0 = vec4(outputColor, transparency/4);
}