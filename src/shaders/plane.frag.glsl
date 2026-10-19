uniform float uTime;
varying vec2 vUv;

void main() {
  vec3 color = 0.5 + 0.5 * sin(uTime + vUv.xyx + vec3(1.0, 2.0, 4.0));
  gl_FragColor = vec4(color, 1.0);
}
