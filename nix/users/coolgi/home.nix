{ ... }:
{
  home = {
    username = "coolgi";
    homeDirectory = "/home/coolgi";
    stateVersion = "24.05";
    preferXdgDirectories = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./../../home-manager/home.nix

    ./../../home-manager/flakes/stylix
    ./../../home-manager/flakes/nixvim
    ./../../home-manager/flakes/ags
    ./../../home-manager/flakes/spicetify
  ];
}
