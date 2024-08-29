{ ... }:
{
  imports = [
    ./../../os/apps/server/ssh.nix
    ./../../os/apps/server/fail2ban.nix
  ];

  # Only allow root users to access nix packages
  nix.settings.allowed-users = [ "@wheel" ];
}
