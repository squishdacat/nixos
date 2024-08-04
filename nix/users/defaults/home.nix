{ ... }:
{
  home = {
    stateVersion = "24.05";
    preferXdgDirectories = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
