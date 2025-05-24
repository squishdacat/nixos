{ pkgs, ... }:
{
  imports = [
    ./greetd-generic.nix
  ];

  services.greetd.settings = {
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-user-session --user-menu --cmd niri-session";
      #command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-user-session --user-menu --cmd zsh";
    };
  };
}
