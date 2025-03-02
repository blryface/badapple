#version 120

varying vec4 glcolor;

void main(){
    vec3 outputColor = vec3(1,1,1); //set terrain color to black
    float transparency = glcolor.a;
/* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(outputColor, transparency);
}