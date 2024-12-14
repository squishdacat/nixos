{ ... }:
{
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;

  xdg.portal.config = {
    pantheon = {
      "org.freedesktop.impl.portal.Secret" = [
        "gnome-keyring"
      ];
    };
  };
}
