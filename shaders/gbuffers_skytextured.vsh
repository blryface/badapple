#version 150

in vec3 vaPosition;
in vec2 vaUV0;
in vec4 vaColor;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

out vec2 texCoord;
out vec4 glcolor;

void main() {
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition, 1);
    texCoord = vaUV0;
    glcolor = vaColor;
}