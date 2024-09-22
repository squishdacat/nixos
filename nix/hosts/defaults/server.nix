{ ... }:
{
  imports = [
    ./../../os/apps/server/ssh.nix
  ];

  myNix.users = [
    "coolgi:0"
  ];


  # On a server, it makes sense to be able to ping
  networking.firewall.allowPing = true;
  # Reboot on update
  system.autoUpgrade.allowReboot = true;
  # Only allow root users to access nix packages
  nix.settings.allowed-users = [ "@wheel" ];
}
