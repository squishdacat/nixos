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
  environment.systemPackages = [
        pkgs.networkmanagerapplet
        #pkgs.rustdesk
        pkgs.vlc
        pkgs.inetutils
  ];
  #networking.firewall.allowedTCPPorts = [ 80 443 ];

  #services.httpd.enable = true;
  #services.httpd.adminAddr = "webmaster@example.org";

  #services.httpd.virtualHosts."example.org" = {
  #  documentRoot = "/var/www/";
    #dir = "/var/www/test";
    # want ssl + a let's encrypt certificate? add `forceSSL = true;` right here
  #};


  #virtualisation.docker = {
  #  enable = true;
  #  storageDriver = "btrfs";
  #};

}
