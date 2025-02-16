{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./locale/default.nix

    ./icons

    ./app/shell/starship
    ./app/shell/zsh

    #./app/desktop/hyprland
    ./app/desktop/niri
    #./app/desktop/cosmic

    ./app/desktop/notifications/swaync.nix
    ./app/desktop/wallpaper/hyprpaper.nix
    #./app/desktop/wallpaper/wpaperd.nix
    ./app/desktop/xwayland-satellite.nix
    
    ./app/bar/waybar
    ./app/launcher/wofi.nix
    #./app/launcher/rofi.nix

    #./app/terminal/emulator/kitty.nix
    ./app/terminal/emulator/foot.nix
    ./app/cmd/macchina
    #./app/cmd/ranger.nix
    ./app/cmd/yazi.nix
    ./app/cmd/eza.nix
    ./app/cmd/bat.nix
    ./app/cmd/lf.nix

    ./app/app/vscodium.nix
    ./app/app/anki.nix

    ./app/browser/firefox.nix
    #./app/browser/librewolf.nix
    ./app/browser/qutebrowser.nix
  ];

  #targets.genericLinux.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    #distrobox lilipod

    nemo-with-extensions
    pavucontrol

    thunderbird
    bitwarden-desktop
    tor-browser
    qbittorrent

    libreoffice-fresh
    #lyx
    speedcrunch

    #vesktop
    (discord-canary.override (old: {
      withMoonlight=true;
      withOpenASAR=true;
    }))
    element-desktop

    pw-viz
    qpwgraph

    prismlauncher
    osu-lazer-bin

    obs-studio
    mpv
    #memento
    miru
    audacity

    kdenlive
    blender
    krita
    inkscape
    gimp
    pinta

    exhibit
    feh

    jetbrains.idea-ultimate
    #jetbrains.rust-rover
    #obsidian

    unimatrix
    neo

    wl-clipboard
    font-manager
    #networkmanagerapplet
    brightnessctl

    ffmpeg
    jq
    unzip
    zip
    hexedit
    libsixel
    scrcpy
    btop
    wireshark
  ];


  programs.git = {
    enable = true;

    userEmail = "me@coolgi.dev";
    userName = "coolGi";
  };

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
}
