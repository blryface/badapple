#version 150

#extension GL_ARB_explicit_attrib_location : enable

in float starData;

#define sky_red 0 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define sky_green 0 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define sky_blue 0 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define star_red 1 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define star_green 1 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define star_blue 1 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main() {
	vec4 color;
	color = vec4(sky_red, sky_green, sky_blue, 1);
	color = vec4(star_red*starData,star_green*starData,star_blue*starData, starData);
	outColor0 = vec4(color);
}