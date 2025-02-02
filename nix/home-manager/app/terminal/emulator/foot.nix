{ config, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, RETURN, exec, ${config.programs.foot.package}/bin/footclient"
  ];

  programs.rofi.extraConfig.terminal = "${config.programs.foot.package}/bin/footclient";
  dconf.settings = {
    "org/cinnamon/desktop/default-applications/terminal" = {
      exec = "foot";
    };
  };
}
