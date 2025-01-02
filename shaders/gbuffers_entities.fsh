#version 150

uniform sampler2D gtexture;
uniform sampler2D lightmap;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec3 foliageColor;
in vec2 lightMapCoords;
in vec3 vaPosition;

void main(){
    vec3 outputColor = vec3(1.0, 1.0, 1.0);
    float transparency = 1;
    outColor0 = vec4(outputColor, transparency);
}