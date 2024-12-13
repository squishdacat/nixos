{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    inputs.nixpkgs-xr.overlays.default
  ];

  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-rtsp-bin
  ];

  environment.systemPackages = with pkgs; [
    wlx-overlay-s
  ];
}
