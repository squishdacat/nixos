{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    #exec-once = [
    #  "${pkgs.swaynotificationcenter}/bin/swaync"
    #];

    bind = [
      "$mod, U, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client --toggle-panel"
    ];
  };

  programs.hyprlock = {
    enable = true;
  };
}
