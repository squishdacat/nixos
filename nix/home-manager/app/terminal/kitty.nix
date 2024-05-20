{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      update_check_interval = 0;
    };
  };
}
