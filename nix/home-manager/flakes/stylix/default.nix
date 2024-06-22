{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;

    #image = ./systemdeeznuts_2.png;
    #image = ./all_the_mascots.jpeg;
    image = ./head_dark.png;
    
    polarity = "dark";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";

    cursor = {
      package = pkgs.breeze-gtk;
      name = "breeze_cursors";
    };

    opacity = {
      terminal = 0.8;
    };


    targets = {
      kitty.variant256Colors = true;
    };
  };
}
