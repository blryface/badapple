#version 150

in vec3 vaPosition; 
in ivec2 vaUV2;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

out vec2 lightMapCoords;

void main(){

    lightMapCoords = vec2(vaUV2 * (1.0 /256.0) + (1.0 /32.0));

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition,1);
}
