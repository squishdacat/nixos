{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [ "${pkgs.swaynotificationcenter}/bin/swaync" ];

    bind = [
      "$mod, U, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client --toggle-panel"
    ];
  };

  programs.niri.settings = {
    spawn-at-startup = [
      {
        command = [ "${pkgs.swaynotificationcenter}/bin/swaync" ];
      }
    ];

    binds = {
      "Mod+U".action.spawn = [
        "${pkgs.swaynotificationcenter}/bin/swaync-client" "--toggle-panel"
      ];
    };
  };
}
