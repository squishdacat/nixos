{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #./../../os/apps/game/monado.nix
    ./../../os/apps/game/vr.nix
    #### Drivers ####
    ./../../os/drivers/gpu/amd
    ./../../os/drivers/vr/bsb
    ./../../os/drivers/vr/cap_sys_nice_begone
  ];

  networking.firewall.allowedTCPPorts = [ 8123 ];

  system.autoUpgrade.persistent = true;
}
