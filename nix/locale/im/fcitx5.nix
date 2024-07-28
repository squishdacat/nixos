{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      # Instead, configure though nixos
      #ignoreUserConfig = true;

      addons = with pkgs; [
        #fcitx5-gtk
        #fcitx5-configtool

        fcitx5-anthy
      ];

      #settings = {
      #  globalOptions = {
      #    behaviour = {
      #      ShareInputState = "All"; # Don't change layout when app changes
      #      AllowInputMethodForPassword = true;
      #    };
      #  };
      #};
    };
  };

  # Would normally set this to fcitx, but kitty only supports ibus, and fcitx
  # provides an ibus interface. Can't use ibus for e.g. QT_IM_MODULE though,
  # because that at least breaks mumble
  #environment.variables.GLFW_IM_MODULE = "ibus";
}
