{ config, pkgs, ... }:
{
  home = {
    username = "coolgi";
    homeDirectory = "/home/coolgi";
    stateVersion = "24.05";
    preferXdgDirectories = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  imports = [
    ./features.nix
    ./locale/default.nix

    ./icons

    ./app/shell/starship
    ./app/shell/zsh

    ./app/desktop/hyprland
    #./app/bar/waybar.nix
    ./app/terminal/emulator/kitty.nix
    #./app/terminal/emulator/foot.nix
    ./app/launcher/wofi.nix
    #./app/launcher/rofi.nix
    ./app/cmd/macchina
    ./app/cmd/ranger.nix
    ./app/cmd/eza.nix
    ./app/cmd/bat.nix
    ./app/cmd/lf.nix

    ./app/browser/firefox.nix
    #./app/browser/librewolf.nix
    ./app/browser/qutebrowser.nix
  ];

  #targets.genericLinux.enable = true;
  nixpkgs.config.allowUnfree = true;

  #nixpkgs.config.permittedInsecurePackages = [
  #  "electron-25.9.0"
  #];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #distrobox lilipod

    thunderbird
    bitwarden-desktop

    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.thunar-volman

    bun
    wl-clipboard
    
    libreoffice-fresh
    speedcrunch

    vesktop
    element-desktop

    prismlauncher

    memento
    obs-studio
    mpv
    obsidian
    #blender
    krita
    inkscape
    feh

    unimatrix

    cmatrix

    font-manager
    networkmanagerapplet
    brightnessctl
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/coolgi/etc/profile.d/hm-session-vars.sh
  #

  #home.pointerCursor = {
  #  gtk.enable = true;
  #  # x11.enable = true;
  #  package = pkgs.libsForQt5.breeze-gtk;
  #  name = "Breeze-gtk";
  #  size = 16;
  #};



  home.sessionVariables = {
    FLAKE = "/home/coolgi/.dotfiles/nix/home-manager/";
  };

}
