#version 150

#extension GL_ARB_explicit_attrib_location : enable

in float starData;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main() {
	float skycolor=float((starData-0.5)*10);
	vec3 color = vec3(skycolor,skycolor,skycolor);
	outColor0 = vec4(color, 1.0);
}