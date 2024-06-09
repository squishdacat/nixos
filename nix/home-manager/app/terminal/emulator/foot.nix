{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, RETURN, exec, foot"
  ];

  programs.rofi.extraConfig.terminal = "${config.programs.foot.package}/bin/foot";
}
