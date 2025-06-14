{ lib, ... }:

let
  userDirs = lib.lists.remove "defaults" (
    builtins.attrNames (lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ./.))
  );
  userModules = builtins.listToAttrs (
    map (name: {
      inherit name;
      value = import ./${name}/home.nix;
    }) userDirs
  );
in
{
  users = userModules;
}
