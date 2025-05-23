{ inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.framework-13-7040-amd
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../os/drivers/school/wifi
    ./../../os/sys/power/ppd.nix
  ];

  services.fwupd.enable = true;
  services.fprintd.enable = true;
}
