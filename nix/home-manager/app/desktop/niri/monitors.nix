{ ... }:
{
  programs.niri.settings.outputs = {
    # Laptop
    "eDP-1" = {
      scale = 1.2;
      variable-refresh-rate = true;
    };

    # PC
    "DP-3" = {
      mode = {
        height = 1440;
        width = 2560;
        refresh = 143.999;
      };
      position = {
        x = 0;
        y = 0;
      };
    };
    "DP-2" = {
      mode = {
        height = 1050;
        width = 1680;
        refresh = 59.883;
      };
      position = {
        x = 2560;
        y = 0;
      };
    };
  };
}
