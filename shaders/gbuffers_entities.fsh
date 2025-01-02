#version 150

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main(){
    vec3 outputColor = vec3(1.0, 1.0, 1.0);
    float transparency = 0;
    outColor0 = vec4(outputColor, transparency);
}
