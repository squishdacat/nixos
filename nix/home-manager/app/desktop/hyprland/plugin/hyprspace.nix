{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    #settings.bind = [
    #  "$mod, grave, hyprexpo:expo, toggle"
    #];
  };
}
