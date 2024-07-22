{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../drivers/gpu/amd

    ./../../nixos/boot/loader
  ];
}
