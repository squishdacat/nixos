{ ... }:
{
  imports = [
    ./../defaults/default.nix
    ./../defaults/server.nix
    ./../../services/jellyfin
    ./../../os/sys/hardware/smb_shares.nix
    ./../../services/nginx
    ./../../services/mosquitto.nix
    ./../../services/docker
  ];
}
