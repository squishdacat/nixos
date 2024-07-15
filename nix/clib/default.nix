{ lib, ... }:
let
  rootPath = ../.;
  aimport = import ./aimport.nix { inherit lib; };
in
{
  inherit rootPath;
  inherit aimport;
}
