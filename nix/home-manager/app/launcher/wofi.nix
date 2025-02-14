{ config, ... }:
{
  programs.wofi = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    "bind = $mod, d, exec, wofi -Ime -a -w 3 --show drun" 
  ];
  programs.niri.settings.binds = {
    "Mod+D".action.spawn = [
      "${config.programs.wofi.package}/bin/wofi"
      "-Ime" "-a" "-w" "3" "--show" "drun"
    ];
  };
}
