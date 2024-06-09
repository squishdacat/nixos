{ ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  system.autoUpgrade = {
    enable = true;
    dates = "weekly";

    operation = "boot";
    allowReboot = false;
  };


  # The nix garbage collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    #options = "--delete-older-than 30d";
  };

  # Optimise the nix store
  nix.optimise = {
    automatic = true;
    dates = [
      "20:00" # 8:00 PM
    ];
  };
  # If instead I wanted to optimise at every build, use the thing below
  #nix.settings.auto-optimise-store = true;


  # Required to get running random binaries to work
  #programs.nix-ld.enable = true;
  #programs.nix-ld.libaries = with pkgs; [
  #  # Add any missing dynamic libaries for unpackage
  #  # programs here, NOT in environment.systemPackages
  #];
}
