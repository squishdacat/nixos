{ pkgs, clib, ... }:
{
  imports = [
    ./../../default.nix
    ./../../options
    ./../../users/os.nix

    ./../../os/locale/lang

    ./../../os/apps/utils/general.nix
    ./../../os/apps/speech.nix
    ./../../os/apps/tailscale.nix

    ./../../os/shell/zsh.nix
  ] ++ clib.aimport {
    path = ./../../os/sys/nix; # Defaults for nix stuff
    exclude = [ ./../../os/sys/nix/gc.nix ];
  };


  # Use the Zen Kernel
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen; 
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  # Set the time zone
  time.timeZone = "Australia/Adelaide";


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
