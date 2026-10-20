uniform float uTime;
varying vec2 vUv;

float sdSegment(vec2 p, vec2 a, vec2 b) {
  vec2 pa = p - a;
  vec2 ba = b - a;
  float h = clamp(dot(pa, ba) / dot(ba, ba), 0.0, 1.0);
  return length(pa - ba * h);
}

// kuka znaka pitanja: luk od -45° do 160° (preko vrha)
float sdHook(vec2 p, vec2 c, float r) {
  vec2 q = p - c;
  float a = atan(q.y, q.x);
  float a0 = radians(-45.0);
  float a1 = radians(160.0);
  if (a >= a0 && a <= a1) {
    return abs(length(q) - r);
  }
  vec2 e0 = c + r * vec2(cos(a0), sin(a0));
  vec2 e1 = c + r * vec2(cos(a1), sin(a1));
  return min(length(p - e0), length(p - e1));
}

float sdQuestionMark(vec2 p) {
  vec2 c = vec2(0.0, 0.35);
  float r = 0.3;
  vec2 hookEnd = c + r * vec2(cos(radians(-45.0)), sin(radians(-45.0)));

  float d = sdHook(p, c, r);
  d = min(d, sdSegment(p, hookEnd, vec2(0.0, -0.02)));
  d = min(d, sdSegment(p, vec2(0.0, -0.02), vec2(0.0, -0.22)));

  // tačka — blago "skakuće"
  float bounce = 0.02 * sin(uTime * 3.0);
  d = min(d, length(p - vec2(0.0, -0.5 + bounce)) - 0.07);
  return d;
}

void main() {
  vec2 p = (vUv - 0.5) * 2.0;

  // talasasto iskrivljenje samog znaka
  p.x += 0.06 * sin(p.y * 6.0 + uTime * 2.5);
  p.y += 0.04 * sin(p.x * 5.0 - uTime * 2.0);

  float d = sdQuestionMark(p) - 0.045; // debljina linije

  float pulse = 0.5 + 0.5 * sin(uTime * 2.0);
  vec3 hue = 0.5 + 0.5 * sin(uTime + vUv.xyx + vec3(1.0, 2.0, 4.0));

  vec3 bg = hue * 0.15;
  float fill = 1.0 - smoothstep(0.0, 0.015, d);
  float glow = exp(-6.0 * max(d, 0.0)) * (0.5 + 0.5 * pulse);

  vec3 color = bg + hue * glow * 0.8;
  color = mix(color, vec3(1.0), fill);

  gl_FragColor = vec4(color, 1.0);
}
