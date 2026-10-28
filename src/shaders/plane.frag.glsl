varying vec2 vUv;

uniform sampler2D diffuse;
uniform sampler2D nature;


void main() {
 vec4 diffuseSample=texture2D(diffuse,vUv);
 vec4 natureSample=texture2D(nature,vUv);

 gl_FragColor = mix(natureSample,diffuseSample,diffuseSample.a);
}


