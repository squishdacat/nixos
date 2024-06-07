{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Thunar
      "float, title:^(File Operation Progress)$"
      # Firefox - PiP
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "rounding 2, title:^(Picture-in-Picture)$"
      # Firefox - Sharing Indicator
      "float, title:^(Firefox — Sharing Indicator)$"
      "move 50% 0%, title:^(Firefox — Sharing Indicator)$"
      "noborder, title:^(Firefox — Sharing Indicator)$"
      "noshadow, title:^(Firefox — Sharing Indicator)$"
      "nofocus, title:^(Firefox — Sharing Indicator)$"
      "pin, title:^(Firefox — Sharing Indicator)$"
      # Live captions
      "float, net.sapples.LiveCaptions"
      "move 32% 91%, net.sapples.LiveCaptions"
      "noborder, net.sapples.LiveCaptions"
      "noshadow, net.sapples.LiveCaptions"
      #"nofocus, net.sapples.LiveCaptions"
      "pin, net.sapples.LiveCaptions"
      # Rythm Doctor
      "windowdance, steam_app_774181"
      "forceinput, steam_app_774181"
      # Spamton
      "float, com-group_finity-mascot-Main"
      "noblur, com-group_finity-mascot-Main"
      "nofocus, com-group_finity-mascot-Main"
      "noshadow, com-group_finity-mascot-Main"
      "noborder, com-group_finity-mascot-Main"
      # IBus
      "float, ibus-ui-emojier"
      # Nextcloud
      "float, com.nextcloud.desktopclient.nextcloud"
      "move cursor -100% 0%, com.nextcloud.desktopclient.nextcloud"
      "pin, com.nextcloud.desktopclient.nextcloud"
    ];

    windowrulev2 = [
      # Steam
      "pin,class:^(steam)$,title:^(notificationtoasts)"
      # Genius
      "float,class:^(gnome-genius)$,title:^(?!Genius )"
    ];
  };
}
