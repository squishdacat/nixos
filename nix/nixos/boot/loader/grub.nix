{ pkgs, ... }:
{
  boot.loader.grub = {
    efiSupport = true;
    device = "nodev";
    #useOSProber = true;


    #splashImage = ./bg.png;
    theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";


    memtest86.enable = true;
  };
}
