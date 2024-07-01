{ pkgs, ... }:
{
  nixpkgs.config.packageOverrides = super: {
    macchina = pkgs.callPackage ./macchina {};
  };
}
