{ config, pkgs, ... }:
{
  imports = [
    ./../lock/hyprlock

    ./windowrules.nix
    ./monitors.nix
    #./../wallpaper/hyprpaper.nix
    #./wallpaper/wpaperd.nix
  ];

  home.packages = [ pkgs.hyprland ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd.enableXdgAutostart = true;
  };

  #home.packages = with pkgs; [
  #  #xdg-desktop-portal
  #  xdg-desktop-portal-hyprland
  #];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "hyprland";
  };

  

  wayland.windowManager.hyprland.settings = {
    #monitor = ",preferred,auto,1";


    "$mod" = "SUPER";
    bind = [
      "$mod, Q, killactive"
      "$mod, K, exec, hyprctl kill" # Kill something

      "$mod, F, fullscreen"
      "$mod, V, togglefloating"

      # Change workspaces with mouse
      "$mod, mouse_down, workspace, e+1"
	    "$mod, mouse_up, workspace, e-1"

	    # Screenshot a region
      ", PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
      "SHIFT, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o $HOME/Pictures/screenshots/"
	    # Screenshot a window
      "$mod, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m window --clipboard-only"
      "$mod SHIFT, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m window -o $HOME/Pictures/screenshots/"

      # Change focus
      "$mod, n, movefocus, l"
      "$mod, e, movefocus, d"
      "$mod, o, movefocus, u"
      "$mod, i, movefocus, r"
      # Change workspaces
      "$mod SHIFT, n, workspace, e-1"
      "$mod SHIFT, e, workspace, e+1"
      "$mod SHIFT, o, workspace, e-1"
      "$mod SHIFT, i, workspace, e+1"
      # Move
      "$mod CTRL SHIFT, n, movewindow, l"
      "$mod CTRL SHIFT, e, movewindow, d"
      "$mod CTRL SHIFT, o, movewindow, u"
      "$mod CTRL SHIFT, i, movewindow, r"

      "$mod, P, togglesplit," # dwindle swap windows


      # IBus (Japanese)
      #"$mod, SPACE, exec, sh -c 'if [ \"$(${pkgs.ibus}/bin/ibus engine)\" = \"anthy\" ]; then ibus engine xkb:de:nodeadkeys:deu; else ibus engine anthy; fi'"
      #"$mod, PERIOD, exec, sh -c '${pkgs.ibus}/bin/ibus emoji'"

      # Fcitx5 (Japanese)
      "$mod, SPACE, exec, ${pkgs.fcitx5}/bin/fcitx5-remote -t"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
          builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]
      )10)
    );

    bindle = [
      # Brightness
      "     , XF86MonBrightnessUp,   exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%+"
      "     , XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      "SHIFT, XF86MonBrightnessUp,   exec, ${pkgs.brightnessctl}/bin/brightnessctl set 1%+"
      "SHIFT, XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 1%-"
      #", XF86KbdBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%+"
      #", XF86KbdBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
      # Volume
      #binde=, XF86AudioRaiseVolume, exec, pamixer -ui 2 && pamixer --get-volume > $WOBSOCK
      #binde=, XF86AudioLowerVolume, exec, pamixer -ud 2 && pamixer --get-volume > $WOBSOCK
      #binde=, XF86AudioMute, exec, pamixer --toggle-mute && ( [ "$(pamixer --get-mute)" = "true" ] && echo 0 > $WOBSOCK ) || pamixer --get-volume > $WOBSOCK
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];


    debug.disable_logs = false;
    input = {
      follow_mouse = true;
      float_switch_override_focus = true;

      touchpad = {
        natural_scroll = false;
        disable_while_typing = false;
      };
    };

    gestures = {
      workspace_swipe = true;
    };

    misc = {
      #enable_swallow = true;
      #swallow_regex = "^(kitty)$";

      #hide_cursor_on_touch = true; # for touchscreen
    };

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      
      layout = "dwindle";
    };

    dwindle = {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true;
      no_gaps_when_only = true;
    };


    decoration = {
      rounding = 10;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;

      blur = {
        enabled = true;
        size = 4;
        passes = 2;
        new_optimizations = true;
      };
    };
  };
}
