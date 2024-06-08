{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;


    extraConfig = {
      modi = "drun,run";

      hide-scrollbar = true;
      disable-history = false;
      
      display-app = " ";
      display-run = " ";
      display-Network = "󰤨 ";
      drun-display-format = "{icon} {name}";
      
      show-icons = true;
      window-thumbnail = true;
      markup = true;
    };


    theme = {
      listview = {
        lines = 6;
        columns = 2;
      };

      entry = {
        border = "0px 0px 0px";
        padding = "6px 0px 0px";
        margin = "10px 0px 0px 20px";
      };
    };
  };

  wayland.windowManager.hyprland.settings.bind = [
    "bind = $mod, d, exec, rofi -show combi -combi-modi \"drun,run\"" 
  ];
}
