#version 150

const float LINE_WIDTH  = 2.0;

uniform float viewHeight;
uniform float viewWidth;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

in vec3 vaPosition;
in vec3 vaNormal;

void main() {
	vec2 resolution   = vec2(viewWidth, viewHeight);
	vec4 linePosStart = projectionMatrix * modelViewMatrix * vec4(vaPosition, 1.0);
	vec4 linePosEnd   = projectionMatrix * modelViewMatrix * vec4(vaPosition + vaNormal, 1.0);

	vec3 ndc1 = linePosStart.xyz / linePosStart.w;
	vec3 ndc2 = linePosEnd.xyz   / linePosEnd.w;

	vec2 lineScreenDirection = normalize(ndc2.xy - ndc1.xy);
	vec2 lineOffset = vec2(-lineScreenDirection.y, lineScreenDirection.x) * LINE_WIDTH / resolution;

	if (lineOffset.x < 0.0) lineOffset = -lineOffset;
	if (gl_VertexID % 2 != 0) lineOffset = -lineOffset;
	gl_Position = vec4((ndc1 + vec3(lineOffset, 0.0)) * linePosStart.w, linePosStart.w);
}