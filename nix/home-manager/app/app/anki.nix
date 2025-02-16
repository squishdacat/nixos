{ pkgs, ... }:
let
  anki = pkgs.anki-bin;
in
{
  home.packages = [
    anki
  ];

  xdg.desktopEntries.anki = {
    name = "Anki";
    comment = "An intelligent spaced-repetition memory training program";
    genericName = "Flashcards";
    icon = "anki";

    exec = "env ANKI_WAYLAND=1 ${anki}/bin/anki %f";

    terminal = false;
    type = "Application";
    categories = [ "Education" "Languages" "KDE" "Qt" ];
    mimeType = [
      "application/x-apkg"
      "application/x-anki"
      "application/x-ankiaddon"
    ];
  };
}
