{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  #programs.zsh.initContent = lib.mkOrder 1001 (
  #  builtins.readFile (
  #    pkgs.runCommand "niri-zsh" {}
  #    "${config.programs.niri.package}/bin/niri completions zsh > $out"
  #  )
  #);

  imports = [
    inputs.niri.homeModules.niri
    ./monitors.nix
    ./../lock/hyprlock
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
    hotkey-overlay.skip-at-startup = false;
    debug.render-drm-device = "/dev/dri/renderD128";
    layout = {
        gaps = 5;
        preset-column-widths = [
                {proportion = 1. / 3.;}
                {proportion = 1. / 2.;}
                {proportion = 2. / 3.;}
        ];
    };

    input = {
      # TODO: Add lock
      # See https://github.com/YaLTeR/niri/wiki/Configuration:-Switch-Events
      power-key-handling.enable = true;

      warp-mouse-to-focus = true;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "70%";
      };
      tablet = {
        map-to-output = "DP-1";
      };
      touchpad = {
        natural-scroll = false;
      };
      trackpoint = {
        accel-speed = 0.1;
      };
    };

    # TODO: This is not implemented in niri nix flake
    #gestures = {
    #  hot-corners = false;
    #};

    binds = with config.lib.niri.actions; {
      "Mod+Shift+Backspace".action = quit;
      #"Mod+Shift+Delete".action = quit;
      "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit;

      "Mod+Shift+Ctrl+O".action = show-hotkey-overlay;
      "Mod+Shift+F".action = maximize-column;

      "Mod+Q".action = close-window;
      "Print".action = screenshot;
      "Mod+Print".action = screenshot-window;
      "Mod+W".action = toggle-overview;

      "Mod+F".action = fullscreen-window;
      "Mod+V".action = toggle-window-floating;


      "Mod+H".action = focus-column-left;
      "Mod+L".action = focus-column-right;
      "Mod+J".action = focus-workspace-down;
      "Mod+K".action = focus-workspace-up;
      "Mod+WheelScrollUp".action = focus-column-right;
      "Mod+WheelScrollDown".action = focus-column-left;
      "Mod+Ctrl+WheelScrollUp" = {
        action = focus-workspace-up;
        cooldown-ms = 150;
      };
      "Mod+Ctrl+WheelScrollDown" = {
        action = focus-workspace-down;
        cooldown-ms = 150;
      };

      "Mod+Ctrl+H".action = move-workspace-to-monitor-left;
      "Mod+Ctrl+L".action = move-workspace-to-monitor-right;
      "Mod+Ctrl+Shift+H".action = move-window-to-monitor-left;
      "Mod+Ctrl+Shift+L".action = move-window-to-monitor-right;


      "Mod+Ctrl+W".action = switch-preset-column-width;


      "Mod+TouchpadScrollRight".action = focus-column-right;
      "Mod+TouchpadScrollLeft".action = focus-column-left;
      "Mod+TouchpadScrollUp" = {
        action = focus-workspace-up;
        cooldown-ms = 150;
      };
      "Mod+TouchpadScrollDown" = {
        action = focus-workspace-down;
        cooldown-ms = 150;
      };


      #Terminal launch
      "Mod+T".action.spawn = "alacritty";

      # Audio Keys
      "xf86audioraisevolume".action.spawn = [
        "${pkgs.pulseaudio}/bin/pactl"
        "set-sink-volume"
        "@DEFAULT_SINK@"
        "+5%"
      ];
      "xf86audiolowervolume".action.spawn = [
        "${pkgs.pulseaudio}/bin/pactl"
        "set-sink-volume"
        "@DEFAULT_SINK@"
        "-5%"
      ];
      "XF86AudioMute".action.spawn = [
        "${pkgs.pulseaudio}/bin/pactl"
        "set-sink-mute"
        "@DEFAULT_SINK@"
        "toggle"
      ];

      # Brightness Keys
      "XF86MonBrightnessUp".action.spawn = [
        "${pkgs.brightnessctl}/bin/brightnessctl"
        "set"
        "5%+"
      ];
      "XF86MonBrightnessDown".action.spawn = [
        "${pkgs.brightnessctl}/bin/brightnessctl"
        "set"
        "5%-"
      ];
      "Shift+XF86MonBrightnessUp".action.spawn = [
        "${pkgs.brightnessctl}/bin/brightnessctl"
        "set"
        "1%+"
      ];
      "Shift+XF86MonBrightnessDown".action.spawn = [
        "${pkgs.brightnessctl}/bin/brightnessctl"
        "set"
        "1%-"
      ];

      # Media Keys
      "XF86AudioPlay".action.spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "play-pause"
      ];
      "XF86AudioPause".action.spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "play-pause"
      ];
      "XF86AudioNext".action.spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "next"
      ];
      "XF86AudioPrev".action.spawn = [
        "${pkgs.playerctl}/bin/playerctl"
        "previous"
      ];


      "Mod+Shift+H".action = move-column-left;
      "Mod+Shift+J".action = move-window-down;
      "Mod+Shift+K".action = move-window-up;
      "Mod+Shift+L".action = move-column-right;

      "Mod+Ctrl+E".action = focus-workspace-down;
      "Mod+Ctrl+O".action = focus-workspace-up;
      "Mod+Shift+Ctrl+J".action = move-window-to-workspace-down;
      "Mod+Shift+Ctrl+K".action = move-window-to-workspace-up;

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

      "Mod+Shift+P".action = power-off-monitors;
    };

    window-rules = [
      {
        geometry-corner-radius =
          let
            r = 2.0;
          in
          {
            top-left = r;
            top-right = r;
            bottom-left = r;
            bottom-right = r;
          };
        # This will cut out any client-side window shadows
        clip-to-geometry = true;
      }
      # Remove certain things from showing on streams
      {
        matches = [
          { app-id = "^thunderbird$"; }
        ];
        block-out-from = "screen-capture";
      }
    ];

    layer-rules = [
      {
        matches = [
          { namespace = "notification"; }
        ];
        block-out-from = "screen-capture";
      }
    ];

    animations = {
      window-close.easing = {
        duration-ms = 500;
        #duration-ms = 1000;
        curve = "linear";
      };
      shaders = {
        #window-close = builtins.readFile ./shaders/close/fall_and_rotate.glsl;
        window-close = builtins.readFile ./shaders/close/fire.glsl;
      };
    };
  };
}
