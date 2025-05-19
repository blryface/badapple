#version 120 compatibility

#define Translusent_blocks_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Translusent_blocks_translusency_addition 0 // [-0.25 -0.125 0 2 4]
#define Translusent_blocks_invert_colors 0 // [0 1]
#define Do_DH_blocks_render 1 // [0 1]

uniform sampler2D depthtex0;

uniform float viewHeight;
uniform float viewWidth;

in vec4 glcolor;

void main(){
    
    if(Do_DH_blocks_render == 0){
        discard;
    }
    
    vec3 outputColor = vec3(Translusent_blocks_red, Translusent_blocks_green, Translusent_blocks_blue);
    float transparency = (glcolor.a+Translusent_blocks_translusency_addition)/(3*Translusent_blocks_invert_colors+1);

    vec2 fragcord = gl_FragCoord.xy / vec2(viewWidth,viewHeight);
    float depth = texture2D(depthtex0,fragcord).r;

    if(depth != 1){
        discard;
    }
        vec4 inverted_block_color = vec4(Translusent_blocks_invert_colors,Translusent_blocks_invert_colors,Translusent_blocks_invert_colors,1);
/* DRAWBUFFERS:01 */
    gl_FragData[0] = vec4(outputColor, transparency/4);
    gl_FragData[1] = vec4(inverted_block_color);
}