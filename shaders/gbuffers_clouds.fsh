#version 150

#extension GL_ARB_explicit_attrib_location : enable

uniform sampler2D gtexture;

#define clouds_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define clouds_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define clouds_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define hide_clouds 1 // [1 0]

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = vec3(clouds_red, clouds_green,clouds_blue);
    float transparency = outputColorData.a-hide_clouds;

    if (transparency < .1) {
        discard;
    }
    outColor0 = vec4(outputColor, transparency);
}