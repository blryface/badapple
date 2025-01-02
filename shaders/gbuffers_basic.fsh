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
    vec3 lightColor = pow(texture(lightmap, lightMapCoords).rgb,vec3(2.2));

    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = outputColorData.rgb * foliageColor - lightColor;
    float transparency = outputColorData.a;

    if (transparency < .1) {
        discard;
    }
    outColor0 = vec4(outputColor, transparency);
}