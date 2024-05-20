{ config, pkgs, ... }:
#let
#  stylix = pkgs.fetchFromGitHub {
#    owner = "danth";
#    repo = "stylix";
#    #rev = "...";
#    #sha256 = "...";
#  };
#in
{
  #imports = [ (import stylix).homeManagerModules.stylix ];
  imports = [ (import pkgs.fetchFromGithub {
    owner = "danth";
    repo = "stylix";
  }).homeManagerModules.stylix ];

  stylix.image = ./wallpaper.jpg;
}
