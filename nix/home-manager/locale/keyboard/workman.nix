{ ... }:
let
  layout = "us";
  variant = "qwerty";
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
  programs.niri.settings.input.keyboard.xkb = {
    layout = "${layout}";
    variant = "${variant}";
    options = "${options}";
  };
}
