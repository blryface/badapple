#version 150

in vec4 vaColor;
in vec3 vaPosition; 
in vec2 vaUV0;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

out vec4 glcolor;
out vec2 texCoord;

void main(){
    texCoord = vaUV0;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition,1);
    glcolor = vaColor;
}