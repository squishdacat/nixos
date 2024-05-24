{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;

      # Opacity is handled by stylix
      #dynamic_background_opacity = true;
      #background_opacity = lib.mkForce "0.8";
    };
  };
}
