#version 120

#define blocks_red 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define blocks_green 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define blocks_blue 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define Do_DH_blocks_render 1 // [0 1]

uniform sampler2D depthtex0;

uniform float viewHeight;
uniform float viewWidth;

void main(){

    if(Do_DH_blocks_render == 0){
        discard;
    }
    
    vec3 outputColor = vec3(blocks_red, blocks_green, blocks_blue);

    vec2 fragcord = gl_FragCoord.xy / vec2(viewWidth,viewHeight);
    float depth = texture2D(depthtex0,fragcord).r;

    if(depth != 1){
        discard;
    }

/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, 1);
}