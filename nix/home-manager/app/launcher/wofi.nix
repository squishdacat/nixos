{ ... }:
{
  programs.wofi = {
    enable = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    "bind = $mod, d, exec, wofi -Ime -a -w 3 --show drun" 
  ];
}
