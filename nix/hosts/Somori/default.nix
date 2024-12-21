{ ... }:
{
  imports = [
    ./../defaults/server.nix
    ./apps/networking.nix

    ./../../os/startup/loader/grub.nix

    ./apps/acme.nix
    ./apps/nginx.nix
    ./apps/mail.nix
    ./apps/conduwuit.nix
    ./apps/coturn.nix
    ./apps/vaultwarden.nix
    ./apps/fail2ban.nix
    ./apps/mc-honeypot.nix
  ];


  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    efiSupport = false;
  };

  services.sshguard.enable = true;
}
