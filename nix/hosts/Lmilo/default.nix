{ ... }:
{
  imports = [
    ./../defaults/desktop.nix
    #### Drivers ####
    ./../../os/drivers/school/wifi
    ./../../os/sys/power/auto-cpufreq.nix
  ];
}
