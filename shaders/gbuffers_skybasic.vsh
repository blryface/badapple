#version 120

varying float starData;

void main() {
	gl_Position = ftransform();
	starData = float(gl_Color.r == gl_Color.g && gl_Color.r > 0.0);
}