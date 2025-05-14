{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hunspell

    # American English
    hunspellDicts.en-us-large
    # Australian English
    hunspellDicts.en-au-large
    # toki pona
    hunspellDicts.tok
  ];
}
