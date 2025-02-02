{
  pkgs ? import <nixpkgs> { },
  inputs, ...
}:
{
  plymouth-cenco-bounce-theme = pkgs.callPackage ./cenco-bounce { };
}
