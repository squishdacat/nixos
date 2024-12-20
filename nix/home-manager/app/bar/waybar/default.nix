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
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "privacy"
          "battery"
          "wireplumber"
          "network"
        ];

        privacy = {
          icon-spacing = 4;
          icon-size = 16;
          transition-duration = 250;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 16;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 16;
            }
          ];
        };
      };
    };

    #style = ''
    #'';
  };
}
