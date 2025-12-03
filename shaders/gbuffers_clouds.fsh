#version 120

#define clouds_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define clouds_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define clouds_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define hide_clouds 1 // [1 0]

varying vec4 glcolor;

void main(){
    #if hide_clouds == 1
    discard;
    #endif
    vec3 outputColor = vec3(clouds_red, clouds_green,clouds_blue);
    float transparency = glcolor.a;
/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, transparency);
}