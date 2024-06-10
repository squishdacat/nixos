{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify.packages.${pkgs.system}.default;
in
{
  imports = [
    inputs.spicetify.homeManagerModule
  ];

  programs.spicetify = {
    enable = true;

    theme = spicePkgs.themes.Comfy;
    #theme = spicePkgs.themes.text;
    #theme = spicePkgs.themes.DefaultDynamic;
    #theme = spicePkgs.themes.catppuccin;
    #colorScheme = "macchiato";

    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      groupSession
      fullAlbumDate
      songStats
    ];
  };
}
