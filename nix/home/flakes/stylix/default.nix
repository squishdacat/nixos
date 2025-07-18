{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    polarity = "dark";

    image = ./wallpaper.jpg;

    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-ocean.yaml";

    cursor = {
      package = pkgs.libsForQt5.breeze-gtk;
      name = "breeze_cursors";

      size = 32;
    };

    opacity = {
      terminal = 0.8;
    };

    targets = {
      kitty.variant256Colors = true;
      # TODO: Make this declarative
      vscode.profileNames = [ "default" ];

      # Disable some targets that I don't want to be themed
      alacritty.enable = true;
      librewolf = {
        enable = true;
        profileNames = ["michael"];
      };
    };
  };
}
