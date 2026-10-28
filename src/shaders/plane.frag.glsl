varying vec2 vUv;

uniform sampler2D diffuse;
uniform sampler2D nature;
uniform float uTime;


void main() {
 vec2 waterUv = vUv;
 waterUv.x += sin(vUv.y * 24.0 + uTime * 1.8) * 0.008;
 waterUv.y += sin(vUv.x * 20.0 - uTime * 1.4) * 0.008;

 vec4 diffuseSample = texture2D(diffuse, waterUv);
 vec4 natureSample = texture2D(nature, waterUv);

 gl_FragColor = mix(natureSample, diffuseSample, diffuseSample.a);
}

