{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
in
{
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];

  programs.spicetify = {
    enable = true;

    # The theme is now covered by stylix
    #theme = spicePkgs.themes.comfy;
    #theme = spicePkgs.themes.text;
    #theme = spicePkgs.themes.DefaultDynamic;
    #theme = spicePkgs.themes.catppuccin;
    #colorScheme = "macchiato";

    enabledExtensions = with spicePkgs.extensions; [
      #keyboardShortcut # Vim-like navigation
      shuffle

      fullAppDisplay
      groupSession
      fullAlbumDate
      phraseToPlaylist
      wikify
      songStats
      copyToClipboard
      betterGenres
      copyLyrics
      playingSource
      sectionMarker
    ];
  };
}
