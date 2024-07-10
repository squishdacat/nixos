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
        ./default
        { networking.hostName = name; } # System Name

        ### Default for All Systems ###
        ./../nixos/configuration.nix
      ] ++ clib.aimport {
        recursive = false;
        exclude = [ ./default ];
      };
    };
in
  builtins.listToAttrs (builtins.map (name: {
      inherit name;
      value = host name;
    })
    hosts)
