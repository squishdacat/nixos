{ config, pkgs, ... }:
{
  imports = [
    ./bootloader/systemd.nix
    ./hardware-configuration.nix
    ./nix-features.nix
    ./drivers/hardware/audio.nix
    ./drivers/hardware/graphics.nix
    ./drivers/hardware/bluetooth.nix
    ./login/greetd.nix
    ./shell.nix
    ./locale/keyboard/workman.nix
    ./locale/lang/en-us.nix
    ./school/wifi/cert.nix
  ];

  # Bootloader
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

  # Configure keymap in X11
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;


  programs.hyprland.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.coolgi = {
    isNormalUser = true;
    description = "coolGi";

    initialPassword = "password";

    extraGroups = [ "networkmanager" "wheel" "video" "input" "kvm" "adbusers" ];
  };

  programs.adb.enable = true;


  # Override system page versions
  #nixpkgs.config.packageOverrides = pkgs; {

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #vim
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
