{ lib,
  homeConfigurations,
  home-manager,
  nixpkgs,
  inputs,
  ...
}: let
  hosts = lib.lists.remove "defaults" (builtins.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.)));

  host = name: let
    inherit (homeConfigurations.${name}) config;
  in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      extraSpecialArgs = {
        inherit inputs;
      };

      modules = [
        ./${name}/home.nix # Users config

        ./defaults/home.nix # Default Config
        {
          home = {
            username = name;
            homeDirectory = "/home/${name}";
          };
        }
      ];
    };
in
  builtins.listToAttrs (builtins.map (name: {
      inherit name;
      value = host name;
    })
    hosts)
