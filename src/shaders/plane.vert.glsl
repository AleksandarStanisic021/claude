uniform float uTime;
varying vec2 vUv;

void main() {
  vUv = uv;

  // talasanje ravni po z osi
  vec3 pos = position;
  pos.z += 0.12 * sin(pos.x * 4.0 + uTime * 2.0) * cos(pos.y * 3.0 + uTime * 1.5);

  gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
}
