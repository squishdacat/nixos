{ config, pkgs, ... }:
{
  stylix = {
    image = ./wallpaper.png;
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    cursor = {
      package = pkgs.breeze-gtk;
      name = "breeze_cursors";
    };
  };
}
