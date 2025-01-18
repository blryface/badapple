#version 150

#extension GL_ARB_explicit_attrib_location : enable

#define entites_red 1 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define entites_green 1 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define entites_blue 1 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]

uniform sampler2D gtexture;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = vec3(entites_red, entites_green, entites_blue);
    float transparency = outputColorData.a;
    if (transparency < .1) {
        discard;
    }
    outColor0 = vec4(outputColor, 0);
}