{ pkgs, ... }:
{
  gtk.iconTheme = {
    package = pkgs.epapirus-icon-theme;
    name = "ePapirus-Dark";
  };
}
