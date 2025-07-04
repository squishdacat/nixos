{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../os/apps/modelling/desktop.nix
    ./../../os/apps/virtualisation.nix
    ./../../os/apps/game/steam.nix
    ./../../os/drivers/gpu/nvidia
  ];
}
