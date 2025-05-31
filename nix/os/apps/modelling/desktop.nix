{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    freecad
    openscad
    orca-slicer
    bambu-studio
  ];



}
