{ ... }:
{
  imports = [
    ./tuigreet.nix
  ];


  services.greetd = {
    enable = true;
    restart = true;

    vt = 7;
  };
}
