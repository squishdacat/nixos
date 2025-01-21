{ pkgs, ... }:
{
  # This file is a quick and easy way to add stuff
  #  in the nix configs.
  #
  # Things in this file should not stay here, they
  #  should be moved to their own location somewhere
  #  else where it fits better.

  #services.xserver.enable = true;
  #services.desktopManager.plasma6.enable = true;
  #services.xserver.displayManager.startx.enable = true;

  #virtualisation.docker = {
  #  enable = true;
  #  storageDriver = "btrfs";
  #};

  programs.localsend.enable = true;

  networking.firewall = {
    allowedUDPPorts = [ 5353 ]; # For device discovery
    allowedUDPPortRanges = [{ from = 32768; to = 61000; }];   # For Streaming
    allowedTCPPorts = [ 8010 ];  # For gnomecast server
  };
  environment.systemPackages = with pkgs; [
    vlc
    gnome-network-displays
  ];

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };
}
