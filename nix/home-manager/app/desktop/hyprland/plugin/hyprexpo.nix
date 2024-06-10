{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];

    settings.bind = [
      "$mod, grave, hyprexpo:expo, toggle"
    ];
  };
}
