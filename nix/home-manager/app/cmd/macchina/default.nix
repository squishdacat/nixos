{ config, pkgs, ... }:
{
  #programs.zsh.initExtra = "${pkgs.macchina}/bin/macchina";
  home.packages = with pkgs; [
    macchina
  ];

  xdg.configFile."macchina/macchina.toml".source = (pkgs.formats.toml { }).generate "something" {
    theme = "Coolium";
  };

  home.file."${config.xdg.configHome}/macchina/themes" = {
    source = ./themes;
    recursive = true;
  };
}
