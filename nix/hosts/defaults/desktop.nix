{ clib, ... }:
{
  imports = [
    ./../../os/boot/loader/systemd.nix
    
    ./../../os/locale

    ./../../os/login/greetd/tuigreet.nix
    ./../../os/apps/utils/desktop.nix
    ./../../os/apps/game/steam.nix
    ./../../os/apps/polkit/gnome.nix
    ./../../os/apps/tailscale.nix
  ] ++ clib.aimport {
    path = ./../../os/sys/hardware;
  };

  hardware.wooting.enable = true;
}
