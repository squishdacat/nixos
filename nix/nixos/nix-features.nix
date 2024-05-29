{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Required to get running random binaries to work
  #programs.nix-ld.enable = true;
  #programs.nix-ld.libaries = with pkgs; [
  #  # Add any missing dynamic libaries for unpackage
  #  # programs here, NOT in environment.systemPackages
  #];
}
