{ configs, ... }:
{
  programs.waybar = {
    enable = true;

    systemd.enable = true;

    settings = {
    };

    style = {
    };
  };
}
