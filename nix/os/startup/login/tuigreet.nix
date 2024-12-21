{ pkgs, ... }:
{
  imports = [
    ./greetd-generic.nix
  ];

  services.greetd.settings = {
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
    };
  };
}
