#version 150

in vec3 vaPosition; 

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

void main(){
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition,1);
}
