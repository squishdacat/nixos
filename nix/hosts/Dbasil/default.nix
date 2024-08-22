{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../drivers/gpu/amd
    #./../../drivers/vr/bsb

    ./../../nixos/boot/loader
  ];

  networking.firewall.allowedTCPPorts = [ 8123 ];
}
