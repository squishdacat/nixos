{
  description = "coolGi's minimal iso for bootstraping NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    #disco.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    minimalSpecialArgs = { 
      inherit inputs outputs nixpkgs;
    };
  in
  {
    nixosConfiguration = {
      iso = nixpkgs.lib.nixosSystem {
        speicalArgs = minimalSpecialArgs;
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares.nix"
          #./configuration.nix
        ];
      };
    };
  };
}
