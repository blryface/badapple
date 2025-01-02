#version 150
#extension GL_ARB_explicit_attrib_location : enable

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 outColor0;

in vec3 vaPosition;

void main() {

	outColor0 = vec4(vaPosition,1);
}