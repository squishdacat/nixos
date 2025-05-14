{ lib, ... }:
with lib;
{
  options.myNix.users = mkOption {
    description = "List of users on the system defined within `<root>/nix/users/`";
    default = [ ];
    type = types.listOf types.str;
  };
}
