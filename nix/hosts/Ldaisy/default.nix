{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../drivers/school/wifi
    ./../../sys/power

    ./../../nixos/boot/loader
  ];
}
