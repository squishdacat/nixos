{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #./../../os/apps/game/monado.nix
    ./../../os/apps/game/vr.nix
    #### Drivers ####
    ./../../os/drivers/gpu/amd
    ./../../os/drivers/vr/bsb
  ];

  networking.firewall.allowedTCPPorts = [ 8123 ];
}
