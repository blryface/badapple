#version 150

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

in vec3 vaPosition;

void main() {
	gl_Position = projectionMatrix * (modelViewMatrix * vec4(vaPosition, 1.0));
}