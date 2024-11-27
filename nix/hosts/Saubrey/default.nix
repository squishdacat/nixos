{ ... }:
{
  imports = [
    ./../defaults/server.nix
    #./apps/networking.nix

    ./../../os/boot/loader/systemd.nix
    
    ./apps/networking.nix
  ];


  #boot.loader.grub = {
  #  enable = true;
  #  device = "/dev/sda";
  #  efiSupport = false;
  #};

  services.sshguard.enable = true;
}
