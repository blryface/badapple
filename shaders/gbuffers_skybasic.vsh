#version 150

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

in vec3 vaPosition;
in vec4 vaColor;

out float starData;

void main() {
	gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition, 1.0);
	starData = float(vaColor.r == vaColor.g && vaColor.r > 0.0);
}