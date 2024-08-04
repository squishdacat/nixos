{ lib,
  homeConfigurations,
  home-manager,
  nixpkgs,
  inputs,
}: let
  hosts = builtins.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.));

  host = name: let
    inherit (homeConfigurations.${name}) config;

    #extraSpecialArgs =
      #specialArgs
      #// {
        #host = config.host;
        #module-functions = specialArgs.module-functions config;
        #option-functions = specialArgs.option-functions config;
      #};
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
