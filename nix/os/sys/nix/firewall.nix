{ lib, ... }:
{
  networking.firewall = {
    # True by default on nix
    enable = false;

    # Disallow ipv4 pinging to this computer
    allowPing = lib.mkDefault false;
    # If pinging is allowed, dont allow many pings
    #pingLimit = "--limit 4/minute --limit-burst 10"
  };
}
