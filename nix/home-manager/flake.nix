{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nixgl.url = "github:nix-community/nixGL";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, nixgl, stylix, ... }: {
    homeConfigurations."coolgi" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ stylix.homeManagerModules.stylix ./home.nix ];
    };
  };
}
