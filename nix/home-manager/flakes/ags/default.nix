{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    configDir = ./config;
    systemd.enable = true;

    extraPackages = with pkgs; [
      bun
    #  gtksourceview
    #  webkitgtk
    #  accountsservice
    ];
  };

  #wayland.windowManager.hyprland.settings.exec-once = "${config.programs.ags.package}/bin/ags";
}
