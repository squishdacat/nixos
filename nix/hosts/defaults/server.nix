{ ... }:
{
  imports = [
    ./../../os/apps/server/ssh.nix
  ];

  myNix.users = [
    "coolgi:0"
  ];


  # Only allow root users to access nix packages
  nix.settings.allowed-users = [ "@wheel" ];
}
