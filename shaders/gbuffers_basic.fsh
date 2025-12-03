#version 120

#define other_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define other_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define other_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

uniform float alphaTestRef;
varying vec4 glcolor;

void main(){
    vec3 outputColor = vec3(other_red,other_green,other_blue);
    float transparency = glcolor.a;

    if (transparency < alphaTestRef) {
        discard;
    }
/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(outputColor, transparency); //gcolor
}