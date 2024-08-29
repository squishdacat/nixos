{ ... }:
{
  imports = [
    ./../defaults/server.nix
    ./apps/networking.nix

    ./../../os/boot/loader/grub.nix

    ./apps/acme.nix
    ./apps/nginx.nix
    ./apps/mail.nix
    ./apps/vaultwarden.nix
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    efiSupport = false;
  };
}
