#version 150

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

in vec3 vaPosition;
in vec4 vaColor;

out vec4 starData; //a = flag for weather or not this pixel is a star.

void main() {
	gl_Position = projectionMatrix * (modelViewMatrix * vec4(vaPosition, 1.0));
	starData = vec4(vec3(1,1,1), float(vaColor.r == vaColor.g && vaColor.g == vaColor.b && vaColor.r > 0.0));
}