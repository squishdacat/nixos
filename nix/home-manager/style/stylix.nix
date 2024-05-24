{ config, pkgs, ... }:
{
  stylix = {
    image = ./wallpaper.jpg;
    #image = ./catpuccin_w.png;
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    cursor = {
      package = pkgs.breeze-gtk;
      name = "breeze_cursors";
    };

    opacity = {
      terminal = 0.8;
    };
  };
}
