{
  pkgs ? import <nixpkgs> { },
  inputs, ...
}:
{
  plymouth-cenco-bounce-theme = pkgs.callPackage ./cenco-bounce { };
  dakanji = pkgs.callPackage ./dakanji { };

  piper-en_US-libritts_r-medium = pkgs.callPackage ./piper/en_US-libritts_r-medium.nix { };
}
