{ config, ... }:
{
  programs.kitty = {
    enable = true;

    settings = {
      enable_audio_bell = false;
      update_check_interval = 0;
      confirm_os_window_close = 0;
    };
  };

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, RETURN, exec, kitty"
  ];

  programs.rofi.extraConfig.terminal = "${config.programs.kitty.package}/bin/kitty";
}
