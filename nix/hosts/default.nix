{
  lib,
  aimport,
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
      modules =
        [
          ./${name}
          ./${name}/hardware.nix
          ./../nixos/configuration.nix
          #nypkgs.nixosModules.nypkgs
          #{
          #  host.name = name;
          #}
        ]
        ++ aimport.aimport {
          #paths = [../modules ../options];
          recursive = true;
        };
        #++ builtins.map (host: import ./${host}/shared.nix {hostName = host;}) hosts;
    };
in
  builtins.listToAttrs (builtins.map (name: {
      inherit name;
      value = host name;
    })
    hosts)
