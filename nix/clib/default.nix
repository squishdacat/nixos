# Import all libs
#  FIXME: Broken atm

{ ... }:
let
  aimport = import ./aimport.nix;
in
{
  imports = aimport {
    path = ./.;
  };
}
