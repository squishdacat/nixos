vec3 hsv2rgb(vec3 c){
  vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
  vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
  return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec3 mod289(vec3 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 mod289(vec4 x) {
  return x - floor(x * (1.0 / 289.0)) * 289.0;
}

vec4 permute(vec4 x) {
  return mod289(((x*34.0)+1.0)*x);
}

vec4 taylorInvSqrt(vec4 r)
{
  return 1.79284291400159 - 0.85373472095314 * r;
}

float snoise(vec3 v)
{ 
  const vec2  C = vec2(1.0/6.0, 1.0/3.0) ;
  const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);

  // First corner
  vec3 i  = floor(v + dot(v, C.yyy) );
  vec3 x0 =   v - i + dot(i, C.xxx) ;

  // Other corners
  vec3 g = step(x0.yzx, x0.xyz);
  vec3 l = 1.0 - g;
  vec3 i1 = min( g.xyz, l.zxy );
  vec3 i2 = max( g.xyz, l.zxy );

  //   x0 = x0 - 0.0 + 0.0 * C.xxx;
  //   x1 = x0 - i1  + 1.0 * C.xxx;
  //   x2 = x0 - i2  + 2.0 * C.xxx;
  //   x3 = x0 - 1.0 + 3.0 * C.xxx;
  vec3 x1 = x0 - i1 + C.xxx;
  vec3 x2 = x0 - i2 + C.yyy; // 2.0*C.x = 1/3 = C.y
  vec3 x3 = x0 - D.yyy;      // -1.0+3.0*C.x = -0.5 = -D.y

  // Permutations
  i = mod289(i); 
  vec4 p = permute( permute( permute( 
  i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
  + i.y + vec4(0.0, i1.y, i2.y, 1.0 )) 
  + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));

  // Gradients: 7x7 points over a square, mapped onto an octahedron.
  // The ring size 17*17 = 289 is close to a multiple of 49 (49*6 = 294)
  float n_ = 0.142857142857; // 1.0/7.0
  vec3  ns = n_ * D.wyz - D.xzx;

  vec4 j = p - 49.0 * floor(p * ns.z * ns.z);  //  mod(p,7*7)

  vec4 x_ = floor(j * ns.z);
  vec4 y_ = floor(j - 7.0 * x_ );    // mod(j,N)

  vec4 x = x_ *ns.x + ns.yyyy;
  vec4 y = y_ *ns.x + ns.yyyy;
  vec4 h = 1.0 - abs(x) - abs(y);

  vec4 b0 = vec4( x.xy, y.xy );
  vec4 b1 = vec4( x.zw, y.zw );

  //vec4 s0 = vec4(lessThan(b0,0.0))*2.0 - 1.0;
  //vec4 s1 = vec4(lessThan(b1,0.0))*2.0 - 1.0;
  vec4 s0 = floor(b0)*2.0 + 1.0;
  vec4 s1 = floor(b1)*2.0 + 1.0;
  vec4 sh = -step(h, vec4(0.0));

  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;

  vec3 p0 = vec3(a0.xy,h.x);
  vec3 p1 = vec3(a0.zw,h.y);
  vec3 p2 = vec3(a1.xy,h.z);
  vec3 p3 = vec3(a1.zw,h.w);

  //Normalise gradients
  vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
  p0 *= norm.x;
  p1 *= norm.y;
  p2 *= norm.z;
  p3 *= norm.w;

  // Mix final noise value
  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
  m = m * m;
  return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1), 
  dot(p2,x2), dot(p3,x3) ) );
}

float getNoise(vec2 uv, float t){

  //given a uv coord and time - return a noise val in range 0 - 1
  //using ashima noise

  //add time to y position to make noise field move upwards

  float TRAVEL_SPEED = 1.5;

  //octave 1
  float SCALE = 2.0;
  float noise = snoise( vec3(uv.x*SCALE ,uv.y*SCALE - t*TRAVEL_SPEED , 0));

  //octave 2 - more detail
  SCALE = 6.0;
  noise += snoise( vec3(uv.x*SCALE + t,uv.y*SCALE , 0))* 0.2 ;

  //move noise into 0 - 1 range    
  noise = (noise/2. + 0.5);

  return noise;

}

const float PI = 3.14159265;
const float STEPS = 4.;
float quantize(float n){
  return floor(n*STEPS)/STEPS;
}

float distribution(float x) {
  if (x <= 0. || x >= 1.) {
    return 0.;
  }
  // \sin(\pi(x-1)^{2})^{2}
  return pow(sin(PI*pow(x - 1., 2.)), 2.);
}
float distribution2(float x) {
  if (x <= 0.) {
    return 0.;
  }
  if (x >= 0.3) {
    return 1.;
  }
  return pow(sin(1.7*PI*x), 2.);
}

/*
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
  // ========== NIRI ========== //
  float speed = 5.;
  float niri_clamped_progress = mod(iTime, speed)/speed;
  vec2 coords_geo = fragCoord/iResolution.xy;
  vec3 size_geo = iResolution;
  // ========== NORMAL ========= //
  fragColor = vec4(0.);
}
*/
vec4 close_color(vec3 coords_geo, vec3 size_geo) {
  vec2 coords_geo2 = vec2(coords_geo.x, 1. - coords_geo.y);

  float progress = niri_clamped_progress * niri_clamped_progress;
  float progress2 = coords_geo2.y - (progress*2. -1.);

  vec2 coords = coords_geo2.xy * size_geo.xy;

  float noise = getNoise(coords / 300., niri_clamped_progress * 3.);
  float distb = pow(distribution(progress2), 0.2);
  noise = quantize(noise * distb);

  vec3 coords_tex = niri_geo_to_tex * coords_geo;
  vec4 color = texture2D(niri_tex, coords_tex.st);

  // Paint only the area inside the current geometry.
  if (
    0.0 <= coords_geo.x && coords_geo.x <= 1.0
    && 0.0 <= coords_geo.y && coords_geo.y <= 1.0
  ) {
    return mix(
      color*distribution2(progress2),
      vec4(vec3(1., 0.7, 0.3) * noise, 1.),
      pow(noise, 0.5)
    );
  } else {
    return vec4(0.);
  }
}
