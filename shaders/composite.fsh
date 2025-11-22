#version 150

#define color_inversion_during_day_night 0 // [0 1 2]
#define Translucent_blocks_invert_colors 0 // [0 1]

uniform sampler2D colortex0;
uniform sampler2D colortex1;

uniform float sunAngle;

in vec2 texCoord;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main() {
    vec4 outputColor = texture(colortex0, texCoord);
    #if Translucent_blocks_invert_colors == 0
    outputColor = abs(vec4(1 - texture(colortex1, texCoord)) - outputColor);
    #endif

    #if color_inversion_during_day_night == 1
    if (sunAngle <= 0.5) outputColor = 1 - outputColor;
    #elif color_inversion_during_day_night == 2
    if (sunAngle >= 0.5) outputColor = 1 - outputColor;
    #endif

    outColor0 = outputColor;
}