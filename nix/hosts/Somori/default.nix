{ ... }:
{
  imports = [
    ./../defaults/server.nix
    #### Drivers ####
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };


  # TODO #
  #  cockpit : Desktop management
}
