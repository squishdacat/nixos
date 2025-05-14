{ ... }:
{
  imports = [
    ./../../options/displays.nix
  ];

  # Add our own custom stuff to the nix man page
  documentation.nixos.includeAllModules = true;

  #custom.hardware.displays = [
  #  {
  #    enabled = false;
  #  }
  #];
}
