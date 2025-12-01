#version 150

#extension GL_ARB_explicit_attrib_location : enable

#define other_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define other_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define other_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

uniform sampler2D gtexture;
uniform float alphaTestRef;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = vec3(other_red,other_green,other_blue);
    float transparency = outputColorData.a;

    if (transparency < alphaTestRef) {
        discard;
    }
    outColor0 = vec4(outputColor, transparency);
}