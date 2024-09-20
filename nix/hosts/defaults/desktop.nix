{ clib, ... }:
{
  imports = [
    ./../../os/boot/loader/systemd.nix
    
    ./../../os/locale

    #./../../os/login/greetd/tuigreet.nix
    ./../../os/login/cosmic.nix
    ./../../os/apps/utils/desktop.nix
    ./../../os/apps/game/steam.nix
    #./../../os/apps/polkit/gnome.nix
    ./../../os/apps/tailscale.nix

    ./../../os/apps/cosmic.nix
  ] ++ clib.aimport {
    path = ./../../os/sys/hardware;
  };

  myNix.users = [
    "coolgi:10"
  ];

  # Allow Electron/Chromium apps to run under wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Customisation of my wooting keyboard
  hardware.wooting.enable = true;
}
