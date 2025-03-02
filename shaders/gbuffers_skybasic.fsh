#version 120

varying float starData;

#define sky_red 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define sky_green 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define sky_blue 0 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define star_red 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define star_green 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]
#define star_blue 1 // [0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]

void main() {
	vec4 color;
	color = vec4(sky_red, sky_green, sky_blue, 1);
	color = vec4(star_red*starData, star_green*starData, star_blue*starData, starData);

/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(color);
}