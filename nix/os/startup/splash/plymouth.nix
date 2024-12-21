{ pkgs, ... }:
{
  boot.plymouth = let
    #theme = "circle";
    #theme = "hexagon";
    #theme = "green_loader";
    #theme = "red_loader";
  in {
    enable = true;

    #theme = theme;
    #themePackages = [
    #  (pkgs.adi1090x-plymouth-themes.override {
    #    selected_themes = [ theme ];
    #  })
    #];
  };
}
