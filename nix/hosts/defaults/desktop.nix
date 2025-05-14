{ clib, ... }:
{
  imports =
    [
      ./../../os/startup/loader/systemd.nix
      ./../../os/drivers/school/numworks.nix

      ./../../os/locale

      ./../../os/startup/login/tuigreet.nix
      ./../../os/startup/splash/plymouth.nix
      ./../../os/apps/utils/desktop.nix
      ./../../os/apps/game/steam.nix
      ./../../os/apps/polkit/gnome.nix
      ./../../os/apps/keyring/gnome.nix

      #./../../os/apps/cosmic.nix
    ]
    ++ clib.aimport {
      path = ./../../os/sys/hardware;
    };

  myNix.users = [
    "coolgi:10"
  ];

  # Allow Electron/Chromium apps to run under wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Customisation of my wooting keyboard
  hardware.wooting.enable = true;

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
}
