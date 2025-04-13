{ inputs, pkgs, ... }:
let
  moonlight-pkgs = import inputs.discord-moonlight {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
{
  # TODO: Fix up their flake to make this work
  /*imports = [
    inputs.discord-moonlight.homeModules.default
  ];

  programs.moonlight-mod = {
    enable = true;
    configs = {
      canary = true;
    };
  };*/

  home.packages = with moonlight-pkgs; [
    #inputs.discord-moonlight.packages.x86_64-linux.discord-canary

    (discord-canary.override (old: {
      moonlight=moonlight;
      withMoonlight=true;
      withOpenASAR=true;
    }))
  ];
}
