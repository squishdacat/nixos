{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    configDir = ./config;

    #extraPackages = with pkgs; [
    #  gtksourceview
    #  webkitgtk
    #  accountsservice
    #];
  };

  wayland.windowManager.hyprland.settings.exec-once = "${config.programs.ags.package}/bin/ags";
}
