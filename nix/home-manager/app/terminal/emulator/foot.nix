{ config, pkgs, ... }:
{
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      key-bindings = {
        spawn-terminal = "none";

        # Copy the command output to the terminal
        pipe-command-output = "[${pkgs.wl-clipboard}/bin/wl-copy --type text/plain] Control+Alt+c";
      };
    };
  };

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, RETURN, exec, ${config.programs.foot.package}/bin/footclient"
  ];
  programs.niri.settings.binds = {
    "Mod+Return".action.spawn = [ "${config.programs.foot.package}/bin/footclient" ];
  };

  programs.rofi.extraConfig.terminal = "${config.programs.foot.package}/bin/footclient";
  dconf.settings = {
    "org/cinnamon/desktop/default-applications/terminal" = {
      exec = "foot";
    };
  };
}
