varying vec2 vUv;

void main() {
  gl_FragColor = mix(
   vec4(1.0, 0.0, 0.0, 1.0),
   vec4(0.0, 0.0, 1.0, 1.0),
   vUv.x
  );
}


