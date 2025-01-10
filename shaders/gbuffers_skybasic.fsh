#version 150

#extension GL_ARB_explicit_attrib_location : enable

in vec4 starData; //a = flag for weather or not this pixel is a star.

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main() {
	vec3 color;
	color = vec3(0,0,0);
	if (starData.a > 0.5) {
		color = vec3(1,1,1);
	}
	outColor0 = vec4(color, 1.0);
}