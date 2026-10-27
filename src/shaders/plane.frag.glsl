varying vec2 vUv;

uniform sampler2D diffuse;


void main() {
 vec4 diffuseSample=texture2D(diffuse,vUv);
  gl_FragColor = diffuseSample;
}


