{ inputs, config, pkgs, ... }:
let
  # TODO: Use a git repo, rather than fetchurl
  funtimesWallpaper = builtins.fetchurl {
    url = "https://github.com/Funtimes909/dotfiles/blob/main/hypr/wallpapers/funtimes909-distant-horizons.png?raw=true";
    sha256 = "sha256-woEtfH48yEjSpTEgwslVsL9mW1FwnWrnnwuVFtAppOs=";
  };
in
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    polarity = "dark";

    #image = ./wallpaper.png;
    image = funtimesWallpaper;
    
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

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
