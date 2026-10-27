varying vec2 vUv;

uniform vec4 color1;
uniform vec4 color2;

void main() {
  gl_FragColor = mix(
   color1,
   color2,
   vUv.x
  );
}


