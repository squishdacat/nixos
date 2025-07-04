{ inputs, hostName, ... }:

let
  hostType = builtins.substring 0 1 hostName;
  configurationMapper = {
        "D" = ./desktop.nix;
        "S" = ./server.nix;
        "I" = ./iso.nix;
  };
  desktopfile = import ./desktop.nix;
in
{
  imports = [
        configurationMapper."${hostType}"
  ];
}

