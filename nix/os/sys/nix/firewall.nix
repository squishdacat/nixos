{ ... }:
{
  networking.firewall = {
    # True by default on nix
    enable = true;

    # Disallow ipv4 pinging to this computer
    allowPing = false;
    # If pinging is allowed, dont allow many pings
    #pingLimit = "--limit 4/minute --limit-burst 10"
  };
}
