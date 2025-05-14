{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Override system page versions
  #nixpkgs.config.packageOverrides = pkgs; {
}
