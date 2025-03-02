#version 120

#define beacon_beams_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define beacon_beams_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define beacon_beams_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

void main() {
/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(beacon_beams_red, beacon_beams_green , beacon_beams_blue, 0);
}