{ ... }:
let
  layout = "us";
  variant = "workman";
  options = "caps:backspace";
in
{
  home.keyboard = {
    layout = "${layout}";
    variant = "${variant}";
    options = "${options}";
  };

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "${layout}";
    kb_variant = "${variant}";
    kb_options = "${options}";
  };
}
