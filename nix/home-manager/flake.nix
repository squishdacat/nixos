{
  inputs = {
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

    #nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { nixpkgs, home-manager, stylix, nixvim, ... }:
  {
    homeConfigurations."coolgi" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
      ./home.nix


        stylix.homeManagerModules.stylix
        ./flakes/stylix/stylix.nix

        nixvim.homeManagerModules.nixvim
        ./flakes/nixvim/nixvim.nix
      ];
    };
  };
}
