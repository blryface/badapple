#version 150

#define color_inversion_during_day_night 0 // [0 1 2]

uniform sampler2D colortex0;

uniform float sunAngle;

in vec2 texCoord;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main(){
    bool color_inverted = false;
    if(color_inversion_during_day_night == 1 && sunAngle <= 0.5){
        color_inverted = true;
    }
    else if(color_inversion_during_day_night == 2 && sunAngle >= 0.5){
        color_inverted = true;
    }
    vec4 outputColor = texture(colortex0, texCoord);
    if (color_inverted){
        outputColor = 1-outputColor;
    }
    outColor0 = outputColor;
}