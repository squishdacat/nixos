{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../os/apps/modelling/desktop.nix
    ./../../os/apps/virtualisation.nix
  ];
}
