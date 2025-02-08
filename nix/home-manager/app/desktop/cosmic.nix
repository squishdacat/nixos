{ inputs, pkgs, ... }:
{
  imports = [
    ./notifications/swaync.nix
    ./lock/hyprlock
    ./wallpaper/hyprpaper.nix
  ];
  home.packages = with inputs.cosmic.packages.${pkgs.system}; [
    cosmic-comp
    cosmic-protocols
    cosmic-osd
    cosmic-launcher
    cosmic-workspaces-epoch

    #xdg-desktop-portal-cosmic

    # Screenshot
    cosmic-screenshot

    # Settings
    cosmic-settings
    cosmic-settings-daemon

  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with inputs.cosmic.packages.${pkgs.system}; [
      xdg-desktop-portal-cosmic
    ];
    config.common.default = "cosmic";
  };
}
