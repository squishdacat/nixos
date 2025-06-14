vec4 fall_and_rotate(vec3 coords_geo, vec3 size_geo) {
  float progress = niri_clamped_progress * niri_clamped_progress;
  vec2 coords = (coords_geo.xy - vec2(0.5, 1.0)) * size_geo.xy;
  coords.y -= progress * 1440.0;
  float random = (niri_random_seed - 0.5) / 2.0;
  random = sign(random) - random;
  float max_angle = 0.5 * random;
  float angle = progress * max_angle;
  mat2 rotate = mat2(cos(angle), -sin(angle), sin(angle), cos(angle));
  coords = rotate * coords;
  coords_geo = vec3(coords / size_geo.xy + vec2(0.5, 1.0), 1.0);
  vec3 coords_tex = niri_geo_to_tex * coords_geo;
  vec4 color = texture2D(niri_tex, coords_tex.st);

  return color;
}

vec4 close_color(vec3 coords_geo, vec3 size_geo) {
  return fall_and_rotate(coords_geo, size_geo);
}

