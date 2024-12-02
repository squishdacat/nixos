{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      # Generic
      ",preferred,auto,1"

      # Laptop
      "eDP-1,preferred,auto,1.5"

      # PC
      "DP-1,2560x1440@144,0x0,1"
      "HDMI-A-1,1920x1080@60,-1920x0,1"
      "HDMI-A-2,1920x1080@60,2560x0,1,transform,1"
    ];
    workspace = [
      "9, monitor:HDMI-A-1, default:true"
      "10, monitor:HDMI-A-2, default:true"
    ];
  };
}
