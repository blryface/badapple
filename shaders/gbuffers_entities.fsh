#version 150

#extension GL_ARB_explicit_attrib_location : enable

#define entites_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define entites_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define entites_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

uniform sampler2D gtexture;
uniform float alphaTestRef;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec4 glcolor;
in vec2 texCoord;

void main() {
    vec4 outputColorData = texture(gtexture, texCoord)*glcolor;
    vec3 outputColor = vec3(entites_red, entites_green, entites_blue);
    float transparency = outputColorData.a;

    if (transparency < alphaTestRef) {
        discard;
    }

    outColor0 = vec4(outputColor, transparency);
}