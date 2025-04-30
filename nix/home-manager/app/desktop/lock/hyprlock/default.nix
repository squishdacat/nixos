{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
      "$mod, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
  ];
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+L".action.spawn = [ "${pkgs.hyprlock}/bin/hyprlock" ];
  };

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = false;
        #grace = 3;
        hide_cursor = true;
        no_fade_in = false;
      };


      #background = [
      #  {
      #    path = "screenshot";
      #    blur_passes = 4;
      #    blur_size = 8;
      #  }
      #];

      /*
      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          #font_color = "rgb(202, 211, 245)";
          #inner_color = "rgb(91, 96, 120)";
          #outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "<span foreground='##cad3f5'>Password...</span>";
          shadow_passes = 2;
        }
      ];
      */
    };
  };
}
