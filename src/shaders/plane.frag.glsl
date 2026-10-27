varying vec2 vUv;

uniform sampler2D diffuse;


void main() {
  gl_FragColor = texture2D(diffuse,vUv);
}


