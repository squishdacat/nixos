{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../os/drivers/gpu/amd
    ./../../os/drivers/vr/bsb
  ];

  networking.firewall.allowedTCPPorts = [ 8123 ];
}
