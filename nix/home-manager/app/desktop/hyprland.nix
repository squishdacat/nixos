{ config, pkgs, ... }:
{
  imports = [
    ./hyprland/windowrules.nix
    ./hyprland/monitors.nix
    ./wallpaper/hyprpaper.nix
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

      # Change focus
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      # Move
      "$mod+SHIFT, left, movewindow, l"
      "$mod+SHIFT, right, movewindow, r"
      "$mod+SHIFT, up, movewindow, u"
      "$mod+SHIFT, down, movewindow, d"

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

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];


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
      enable_swallow = true;
      swallow_regex = "^(kitty)$";
      hide_cursor_on_touch = true; # for touchscreen
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
