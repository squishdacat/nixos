{
  description = "coolGi's Nix Configs";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    inherit (self) outputs;
    inherit (nixpkgs) lib;
    # TODO: Make it import everything in the clib location
    clib = import ./clib/aimport.nix { inherit lib; };

    specialArgs = { 
      inherit inputs outputs nixpkgs lib clib;
    };
  in
  {
    nixosConfigurations = import ./hosts {
      inherit (self) nixosConfigurations;
      inherit (nixpkgs) lib;
      inherit clib;
      inherit specialArgs;
    };
  };
}
