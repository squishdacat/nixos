{ config, pkgs, inputs, ... }:
{
  imports = [
    ./app/desktop/niri
    ./app/desktop/niri/wlsunset/default.nix

    ./app/desktop/notifications/swaync.nix
    ./app/desktop/wallpaper/hyprpaper.nix
    #./app/desktop/wallpaper/wpaperd.nix
    ./app/desktop/xwayland-satellite.nix

    ./app/bar/waybar
    ./app/launcher/wofi.nix
    ./app/browser/qutebrowser.nix
  ];

  home.packages = with pkgs; [
    alacritty
    jellyfin-media-player
    brave
    libreoffice-fresh
    prismlauncher
    obs-studio
    gnome-nibbles
    kdePackages.kdenlive
    exhibit
    feh
    vipsdisp
    wl-clipboard
    font-manager
    brightnessctl

    gimp
    wireshark
  ];
}
