{ ... }:
{
  home = {
    stateVersion = "24.05";
    preferXdgDirectories = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Who cares *really* about a package being unfree?, if you are installing it, just do it!
  nixpkgs.config.allowUnfree = true;
}
