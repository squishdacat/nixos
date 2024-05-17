# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  lang = "en_AU.UTF-8";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./school/wifi/cert.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Jeff-Laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Adelaide";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "${lang}";

    extraLocaleSettings = {
      LC_ADDRESS = "${lang}";
      LC_IDENTIFICATION = "${lang}";
      LC_MEASUREMENT = "${lang}";
      LC_MONETARY = "${lang}";
      LC_NAME = "${lang}";
      LC_NUMERIC = "${lang}";
      LC_PAPER = "${lang}";
      LC_TELEPHONE = "${lang}";
      LC_TIME = "${lang}";
    };

    #inputMethod = {
    #  enabled = "ibus";
    #  ibus.engines = with pkgs.ibus-engines; [
    #    anthy
    #  ];
    #};
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # Required to get running random binaries to work
  #programs.nix-ld.enable = true;
  #programs.nix-ld.libaries = with pkgs; [
  #  # Add any missing dynamic libaries for unpackage
  #  # programs here, NOT in environment.systemPackages
  #];


  # Configure keymap in X11
  #services.xserver = {
  #  layout = "us";
  #  xkbVariant = "";
  #};
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;


  #programs.hyprland.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    histSize = 10000;
    #histFile = "${config.xdg.dataHome}/zsh/history";
  };
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.coolgi = {
    isNormalUser = true;
    description = "coolGi";
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Override system page versions
  #nixpkgs.config.packageOverrides = pkgs; {

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    neovim
    curl
    wget
    git

    fzf
    bat

    #fishPlugins.done
    #fishPlugins.fzf-fish
    #fishPlugins.forgit
    #fishPlugins.hydro
    #fishPlugins.grc
    #grc

    anthy
  ];

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
