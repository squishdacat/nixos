{
  description = "coolGi's Nix Configs";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # ========== NIXOS ========== #
    hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";

    # ========== SERVER ========== #
    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver";
    tuwunel.url = "github:matrix-construct/tuwunel";
    mc-honeypot.url = "github:Duckulus/mc-honeypot";

    # ========== HOME ========== #
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    #nixvim.url = "github:nix-community/nixvim";
    #nvf.url = "github:notashelf/nvf";
    niri.url = "github:sodiboo/niri-flake/dc5e21a5189a919a95e9650930d1f67aebed7533";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      inherit (nixpkgs) lib;
      # TODO: Make it import everything in the clib location
      clib = import ./nix/clib { inherit lib; };

      specialArgs = {
        inherit
          inputs
          outputs
          nixpkgs
          lib
          clib
          ;
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      pkgsFor = lib.genAttrs systems (system: import nixpkgs { inherit system; });
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    in
    {
      formatter = forEachSystem (pkgs: pkgs.nixfmt-tree);
      packages = forEachSystem (pkgs: import ./nix/pkgs { inherit pkgs inputs; });
      devShells = forEachSystem (pkgs: {
        default = import ./nix/shell.nix { inherit pkgs; };
      });

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
