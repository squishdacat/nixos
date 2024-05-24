{ config, pkgs, ... }:
{
  programs.wpaperd = {
    enable = true;
    settings = {
      any = {
        path = "${config.stylix.image}";
      };
    };
  };
}
