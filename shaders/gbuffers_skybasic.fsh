#version 150

#extension GL_ARB_explicit_attrib_location : enable

in float starData;

#define star_red 0 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define star_green 0 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]
#define star_blue 0 // [1 0.875 0.75 0.625 0.5 0.375 0.25 0.125 0]

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main() {
	float skycolor=float((starData-0.5)*10);
	vec3 color = vec3(skycolor*star_red,skycolor*star_green,skycolor*star_blue);
	outColor0 = vec4(color, 1.0);
}