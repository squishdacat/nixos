{ lib, ... }:
{
  services.tailscale = {
    enable = true;
    openFirewall = true;

    useRoutingFeatures = lib.mkDefault "both";
  };

  # Disable tailscale from starting with system
  #systemd.services.tailscaled.wantedBy = lib.mkForce [];
  #systemd.services.tailscaled-autoconnect.wantedBy = lib.mkForce [];
  #systemd.services.tailscaled-set.wantedBy = lib.mkForce [];
}
