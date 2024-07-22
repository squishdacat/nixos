{ pkgs, clib, ... }:
{
  imports = [
    ./../../locale/lang/en-au.nix # English Language
    ./../../pkgs # Custom pkgs
    ./../../apps/sys/utils.nix # Some apps I will always need
  ] ++ clib.aimport {
    path = ./../../sys/nix; # Defaults for nix stuff
    exclude = [ ./../../sys/nix/gc.nix ];
  };


  # Use the Zen Kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # Add our own custom stuff to the nix man page
  documentation.nixos.includeAllModules = true;
  



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
