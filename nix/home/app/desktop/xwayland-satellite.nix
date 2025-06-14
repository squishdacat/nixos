{ pkgs, ... }:
{
  home.packages = [pkgs.xwayland-satellite];
  programs.niri.settings = {
    spawn-at-startup = [
      {
        command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" "nm-applet"];
      }
    ];

    environment = {
      # Assume X is on display 0
      # TODO: Find a more robust way of doing this
      "DISPLAY" = ":0";
    };
  };
}
