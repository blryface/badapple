#version 120

#define Translusent_blocks_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_translusency_addition 0 // [-0.25 -0.125 0 2 4]
#define Translusent_blocks_invert_colors 1 // [0 1]

uniform sampler2D texture;

varying vec2 texCoord;
varying vec4 glcolor;

void main(){
    vec4 outputColorData = texture2D(texture,texCoord) * glcolor;
    vec3 outputColor = vec3(Translusent_blocks_red, Translusent_blocks_green, Translusent_blocks_blue);
    float transparency = (outputColorData.a+Translusent_blocks_translusency_addition)/(3*Translusent_blocks_invert_colors+1);

    if(transparency <= 0.15){
        transparency = 0;
    }
    vec4 inverted_block_color = vec4(1,1,1,1);
    if(Translusent_blocks_invert_colors==1){
        inverted_block_color = vec4(0,0,0,1);
    }
/* DRAWBUFFERS:01 */
    gl_FragData[0] = vec4(outputColor, transparency/4);
    gl_FragData[1] = vec4(inverted_block_color);
}