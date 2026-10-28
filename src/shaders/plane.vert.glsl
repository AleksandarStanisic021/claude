
varying vec2 vUv;

uniform float uTime;

void main() {
  vec3 displacedPosition = position;
  displacedPosition.z +=
    sin(position.x * 4.0 + uTime * 1.4) * 0.025 +
    sin(position.y * 5.0 - uTime * 1.1) * 0.02;

  gl_Position = projectionMatrix * modelViewMatrix * vec4(displacedPosition, 1.0);
  vUv = uv;
}

