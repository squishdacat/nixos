{ pkgs, ... }:
let
  nerd-font-symbols = pkgs.fetchurl {
    url = "https://starship.rs/presets/toml/nerd-font-symbols.toml";
    sha256 = "qkwT6sw0yAaCr2RUT2CeU3MwV18IUUTroOsAhdGZPUw=";
  };
in
{
  programs.starship = {
    enable = true;

    settings = pkgs.lib.importTOML nerd-font-symbols;
    #{
    #  username = {
    #    show_always = true;
    #  };
    #};
  };
}
