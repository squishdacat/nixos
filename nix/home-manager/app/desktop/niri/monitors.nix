{ ... }:
{
  programs.niri.settings.outputs = {
    # Laptop
    "eDP-1" = {
      scale = 1.5;
    };

    # PC
    "DP-1" = {
      mode = {
        height = 2560;
        width = 1440;
        refresh = 144.0;
      };
      position = {
        x = 0;
        y = 0;
      };
    };
    "HDMI-A-1" = {
      mode = {
        height = 1920;
        width = 1080;
        refresh = 60.0;
      };
      position = {
        x = -1920;
        y = 0;
      };
    };
    "HDMI-A-2" = {
      mode = {
        height = 1920;
        width = 1080;
        refresh = 60.0;
      };
      position = {
        x = 2560;
        y = 0;
      };
      transform.rotation = 90;
    };
  };
}
