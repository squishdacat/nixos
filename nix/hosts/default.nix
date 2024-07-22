{ lib,
  clib,
  nixosConfigurations,
  specialArgs,
}: let
  hosts = builtins.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.));

  host = name: let
    inherit (nixosConfigurations.${name}) config;

    extraSpecialArgs =
      specialArgs
      // {
        host = config.host;
        module-functions = specialArgs.module-functions config;
        option-functions = specialArgs.option-functions config;
      };
  in
    lib.nixosSystem {
      specialArgs = extraSpecialArgs;
      modules = [
        ./${name} # Main System Conf
        ./${name}/hardware.nix # Hardware Conf (partitions & stuff)

        ./defaults # Shared Sys Conf

        ### Default for all systems ###
        ./../nixos/configuration.nix
        { networking.hostName = name; } # System Name
      ];
    };
in
  builtins.listToAttrs (builtins.map (name: {
      inherit name;
      value = host name;
    })
    hosts)
