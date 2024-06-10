{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./features.nix

    ./drivers/hardware/default.nix
    ./bootloader/default.nix
    ./locale/default.nix
    ./login/default.nix

    ./power/default.nix

    ./shell/zsh.nix
  ];

  networking.hostName = "Jeff-Laptop"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Australia/Adelaide";

  # Configure keymap in X11
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;


  programs.hyprland.enable = true;


  users.users.coolgi = {
    isNormalUser = true;
    description = "coolGi";

    # NOTE: Remember to change the password on first login
    initialPassword = "password";

    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "kvm"
      "adbusers"
      "uucp"
      "dialout"
    ];
  };

  programs.adb.enable = true;


  # Override system page versions
  #nixpkgs.config.packageOverrides = pkgs; {

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    git

    fzf
    bat

    # Many useful system utils
    psmisc
  ];


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
