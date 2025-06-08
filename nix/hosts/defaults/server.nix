{ ... }:
{
  imports = [
    #./../../os/apps/server/ssh.nix
    ./../../os/apps/utils/general.nix
    ./../../os/startup/loader/systemd.nix
  ];

  myNix.users = [
    "michaelw:0"
  ];

  services.sshguard.enable = true;

  # On a server, it makes sense to be able to ping
  networking.firewall.allowPing = true;
  # Reboot on update
  system.autoUpgrade = {
    persistent = true;
    allowReboot = true;
  };
  # Only allow root users to access nix packages
  nix.settings.allowed-users = [ "@wheel" ];

  services.tailscale = {
    # Only allow servers to be a server (ofc)
    useRoutingFeatures = "server";
    extraSetFlags = [
      # Set up tailscale as an exit node
      "--advertise-exit-node"
    ];
  };
}
