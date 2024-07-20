{ ... }:
{
  imports = [
    #### Drivers ####
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };

  services.openssh.enable = true;

  # TODO #
  #  cockpit : Desktop management
}
