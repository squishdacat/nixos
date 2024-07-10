{ ... }:
{
  imports = [
    ./../../options/displays.nix
  ];

  documentation.nixos.includeAllModules = true;
  
  #custom.hardware.displays = [
  #  {
  #    enabled = false;
  #  }
  #];
}
