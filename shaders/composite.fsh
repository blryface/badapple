#version 120

#define color_inversion_during_day_night 0 // [0 1 2]

uniform sampler2D colortex0;
uniform sampler2D colortex1;

uniform float sunAngle;

varying vec2 texCoord;

void main(){
    bool color_inverted = false;
    if(color_inversion_during_day_night == 1 && sunAngle <= 0.5){
        color_inverted = true;
    }
    else if(color_inversion_during_day_night == 2 && sunAngle >= 0.5){
        color_inverted = true;
    }
    vec4 outputColor = texture2D(colortex0, texCoord);
    outputColor = abs((vec4(1-texture2D(colortex1, texCoord)))-outputColor);
    if (color_inverted){
        outputColor = 1-outputColor;
    }
/* DRAWBUFFERS:0 */
    gl_FragData[0] = outputColor;
}