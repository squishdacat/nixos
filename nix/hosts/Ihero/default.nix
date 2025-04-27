{ lib, pkgs, modulesPath, ... }:
{
  imports = [
    ./../defaults/desktop.nix

    (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares.nix")
    #(modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  # Force the default kernel as the default NixOS ISO wants ZFS
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages;
}
