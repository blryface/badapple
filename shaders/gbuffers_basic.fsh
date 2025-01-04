#version 150

#extension GL_ARB_explicit_attrib_location : enable

uniform sampler2D gtexture;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec3 vaPosition;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = vec3(0,0,0); //set terrain color to black
    float transparency = outputColorData.a;

    if (transparency < .6) {
        discard;
    }
    outColor0 = vec4(outputColor, transparency);
}