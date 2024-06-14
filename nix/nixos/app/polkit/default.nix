{ ... }:
{
  imports = [
    ./gnome.nix
  ];

  security.polkit.enable = true;
}
