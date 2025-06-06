#version 120

varying vec2 texCoord;
varying vec4 glcolor;

void main(){
	gl_Position = ftransform();
	texCoord  = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	glcolor = gl_Color;
}