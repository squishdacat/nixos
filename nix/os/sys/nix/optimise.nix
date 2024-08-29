{ ... }:
{
  # Optimise the nix store
  nix.optimise = {
    automatic = true;
    dates = [
      "20:00" # 8:00 PM
    ];
  };
  # If instead I wanted to optimise at every build, use the thing below
  #nix.settings.auto-optimise-store = true;
}
