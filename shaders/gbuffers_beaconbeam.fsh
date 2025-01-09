#version 150

#extension GL_ARB_explicit_attrib_location : enable

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

void main() {
	outColor0 = vec4(1,1,1,0);
}