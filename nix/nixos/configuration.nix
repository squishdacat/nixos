{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./nix

    ./drivers/default
    ./bootloader
    ./locale
    ./login

    ./shell
    ./app

    #./power
  ];

  # NOTE: Define the hostname in the hardware-configuration.nix
  #networking.hostName = "NixComputer"; 

  # Set the time zone
  time.timeZone = "Australia/Adelaide";


  #programs.hyprland.enable = true;
  # Android Debugger
  programs.adb.enable = true;
  # Authentication
  security.polkit.enable = true;
  # Configs
  programs.dconf.enable = true;
  programs.xfconf.enable = true;
  # For userspace file systems
  services.gvfs.enable = true;
  # Thumbnail managment
  services.tumbler.enable = true;


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

      "disk"
      "optical"
      "floppy"
      "storage"
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
