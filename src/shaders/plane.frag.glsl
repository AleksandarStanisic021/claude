varying vec2 vUv;

uniform vec4 color1;
uniform vec4 color2;
uniform float uTime;


void main() {
  gl_FragColor = mix(
   color1,
   color2,
   vUv.x*uTime
  );
}


