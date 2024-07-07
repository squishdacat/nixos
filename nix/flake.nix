{
  description = "coolGi's Nix Configs";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hardware.url = "github:nixos/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    inherit (self) outputs;
    inherit (nixpkgs) lib;
    aimport = import ./clib/aimport.nix { inherit lib; };

    specialArgs = { 
      inherit inputs outputs nixpkgs lib aimport;
    };
  in
  {

    nixosConfigurations = import ./hosts {
      inherit (self) nixosConfigurations;
      inherit (nixpkgs) lib;
      inherit aimport;
      inherit specialArgs;
    };

    #nixosConfigurations = {
    #  Dbasil = lib.nixosSystem {
    #    inherit specialArgs;
    #
    #    modules = [
    #      ./nixos/configuration.nix
    #      ./nixos/host/desktop/basil
    #    ];
    #  };
    #
    #  Ldaisy = lib.nixosSystem {
    #    inherit specialArgs;
    #
    #    modules = [
    #      ./nixos/configuration.nix
    #      ./nixos/host/laptop/daisy
    #    ];
    #  };
    #};
  };
}
