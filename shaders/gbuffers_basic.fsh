#version 150

uniform sampler2D gtexture;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec2 texCoord;
in vec3 vaPosition;

void main(){
    vec4 outputColorData = texture(gtexture,texCoord);
    vec3 outputColor = outputColorData.rgb - vec3(1,1,1);
    float transparency = outputColorData.a;

    if (transparency < .1) {
        discard;
    }
    outColor0 = vec4(outputColor, transparency);
}
