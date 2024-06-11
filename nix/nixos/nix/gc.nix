{ ... }:
{
  # The nix garbage collector
  # NOTE: For the garbage collection, we are using nh
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 20d";
  };
}
