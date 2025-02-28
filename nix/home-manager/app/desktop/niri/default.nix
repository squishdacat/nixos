{ inputs, config, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri-unstable;

  imports = [
    inputs.niri.homeModules.niri
    ./monitors.nix
  ];

  #niri-flake.cache.enable = true;
  /*
  nix.settings = {
    substituters = [
      "https://niri.cachix.org"
    ];
    trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];
  };
  */

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [
        "gnome"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.FileChooser" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
    };
  };

  # Uses KDE polkit by default, but I prefer a different one
  #systemd.user.services.niri-flake-polkit.enable = false;

  programs.niri.enable = true;
  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;

    input = {
      warp-mouse-to-focus = true;
      focus-follows-mouse.enable = true;
      tablet = {
        map-to-output = "DP-1";
      };
      touchpad = {
        natural-scroll = false;
      };
    };

    binds = with config.lib.niri.actions; {
      "Mod+Shift+Space".action = show-hotkey-overlay;
      "Mod+Shift+Delete".action = quit;

      "Mod+Q".action = close-window;
      "Print".action = screenshot;

      "Mod+F".action = fullscreen-window;
      "Mod+V".action = toggle-window-floating;

      "Mod+WheelScrollUp".action = focus-column-right;
      "Mod+WheelScrollDown".action = focus-column-left;

      "Mod+N".action = focus-column-left;
      "Mod+E".action = focus-window-down;
      "Mod+O".action = focus-window-up;
      "Mod+I".action = focus-column-right;

      "Mod+Shift+N".action = move-column-left;
      "Mod+Shift+E".action = move-window-down;
      "Mod+Shift+O".action = move-window-up;
      "Mod+Shift+I".action = move-column-right;

      # TODO: Change to a more nixy way of doing this
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      "Mod+Shift+1".action = move-column-to-workspace 1;
      "Mod+Shift+2".action = move-column-to-workspace 2;
      "Mod+Shift+3".action = move-column-to-workspace 3;
      "Mod+Shift+4".action = move-column-to-workspace 4;
      "Mod+Shift+5".action = move-column-to-workspace 5;
      "Mod+Shift+6".action = move-column-to-workspace 6;
      "Mod+Shift+7".action = move-column-to-workspace 7;
      "Mod+Shift+8".action = move-column-to-workspace 8;
      "Mod+Shift+9".action = move-column-to-workspace 9;

      "Mod+Space".action.spawn = [ "${pkgs.fcitx5}/bin/fcitx5-remote" "-t" ];
    };
  };
}
