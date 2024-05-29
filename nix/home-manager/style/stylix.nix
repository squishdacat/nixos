{ config, pkgs, ... }:
{
  stylix = {
    image = ./wallpaper.jpg;
    #image = ./wallpaper.png;
    #image = ./sushi_dark.png;
    
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

    cursor = {
      package = pkgs.breeze-gtk;
      name = "breeze_cursors";
    };

    opacity = {
      terminal = 0.8;
    };
  };
}
