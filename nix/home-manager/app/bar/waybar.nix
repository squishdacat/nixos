{ configs, ... }:
{
  programs.waybar = {
    enable = true;

    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        # width = 30;

        modules-left = [
          "clock"
        ];
        #modules-center = [
        #  "clock"
        #];
        modules-right = [
          "tray"
          "clock"
        ];
      };
    };

    #style = {
    #};
  };
}
