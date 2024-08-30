{ ... }:
{
  imports = [
    ./../../os/apps/server/ssh.nix
  ];

  # Only allow root users to access nix packages
  nix.settings.allowed-users = [ "@wheel" ];
}
