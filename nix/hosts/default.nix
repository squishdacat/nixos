{
  lib,
  clib,
  nixosConfigurations,
  specialArgs,
  home-manager,
  inputs,
}:
let
  hosts = lib.lists.remove "defaults" (
    builtins.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.))
  );

  host =
    name:
    let
      inherit (nixosConfigurations.${name}) config;

      extraSpecialArgs = specialArgs // {
        host = config.host;
        module-functions = specialArgs.module-functions config;
        option-functions = specialArgs.option-functions config;
      };
      hostUsers = config.myNix.users;
      test = ./../users/uuserDefinitions.nix;

      userDirs = lib.lists.remove "defaults" (
        builtins.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./../users))
      );
      userModules = builtins.listToAttrs (
        map (name: {
          inherit name;
          value = import ./../users/${name}/home.nix;
        }) userDirs
      );
      
      userDefinitions = import test {inherit lib; inherit hostUsers;};



    in
    lib.nixosSystem {
      specialArgs = extraSpecialArgs;
      modules =
        [
          ./${name} # Main System Conf

          ./defaults # Shared Sys Conf

          { networking.hostName = name; } # System Name

          home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = false;
                home-manager.useUserPackages = true;
                home-manager.users = userModules;
		            home-manager.extraSpecialArgs = { inherit inputs; hostName = "${name}";}; 
                home-manager.backupFileExtension = "backup";
          }
        ]
        ++ (
          # If it's not an ISO
          if builtins.substring 0 1 name != "I" then
            [
              ./${name}/hardware.nix # Hardware Conf (partitions & stuff)
            ]
          else
            [ ]
        );
    };
in
builtins.listToAttrs (
  builtins.map (name: {
    inherit name;
    value = host name;
  }) hosts
)
