{ lib, pkgs, ... }:
{
  imports = [
    ./default.nix
  ];

  boot.loader.grub = {
    enable = true;

    efiSupport = lib.mkDefault true;
    device = lib.mkDefault "nodev";
    #useOSProber = true;

    #splashImage = ./bg.png;
    #theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";

    memtest86.enable = true;
  };
}
