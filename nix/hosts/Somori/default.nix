{ ... }:
{
  imports = [
    ./../defaults/server.nix
    ./networking.nix

    ./acme.nix
    ./nginx.nix
    ./mail.nix
    ./vaultwarden.nix
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };


  # TODO #
  #  cockpit : Desktop management
}
