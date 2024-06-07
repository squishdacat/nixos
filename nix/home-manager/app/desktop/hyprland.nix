{ config, pkgs, ... }:
{
  imports = [
    ./hyprland/windowrules.nix
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
    config.common.default = "*";
  };

  

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      # Move window with mainMod + shift + arrow keys
      "$mod+SHIFT, left, movewindow, l"
      "$mod+SHIFT, right, movewindow, r"
      "$mod+SHIFT, up, movewindow, u"
      "$mod+SHIFT, down, movewindow, d"

      "$mod, Q, killactive"
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

    monitor = ",preferred,auto,1";

    input = {
      touchpad = {
        #natural_scroll = false;
        disable_while_typing = false;
      };
    };

    gestures = {
      workspace_swipe = true;
    };

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      #col.active_border = "#1affffee";
      #col.inactive_border = "#595959aa";
      
      layout = "dwindle";
    };

    dwindle = {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true; # you probably want this
      no_gaps_when_only = true;
    };
  };
}
