{
  description = "coolGi's Nix Configs";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # ========== NIXOS ========== #
    #hardware.url = "github:nixos/nixos-hardware";

    simple-nixos-mailserver = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ========== HOME MANAGER ========== #
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #ags = {
    #  url = "github:Aylur/ags";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    spicetify = {
      url = "github:A1ca7raz/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    inherit (self) outputs;
    inherit (nixpkgs) lib;
    # TODO: Make it import everything in the clib location
    clib = import ./nix/clib { inherit lib; };

    specialArgs = { 
      inherit inputs outputs nixpkgs lib clib;
    };
  in
  {
    nixosConfigurations = import ./nix/hosts {
      inherit (self) nixosConfigurations;
      inherit (nixpkgs) lib;
      inherit clib;
      inherit specialArgs;
    };

    homeConfigurations = import ./nix/users/flake.nix {
      inherit (self) homeConfigurations;
      inherit (inputs) home-manager;
      inherit (nixpkgs) lib;
      inherit (inputs) nixpkgs;
      inherit inputs;
    };
  };
}
