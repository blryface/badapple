#version 150

in vec3 vaPosition; 
in vec2 vaUV0;

uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

out vec2 texCoord;

void main(){
    texCoord = vaUV0;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition+chunkOffset,1); //makes terrain render in the correct place
}
