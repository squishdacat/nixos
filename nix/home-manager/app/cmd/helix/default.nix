{ lib, pkgs, ... }:
{
  imports = [
    ./workman.nix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages = {
      language-server = {

      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
      ];
    };
  };
}
