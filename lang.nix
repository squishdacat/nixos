{ config, pkgs, ... }:
let
  lang = "en_US.UTF-8";
in
{
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "${lang}";

    extraLocaleSettings = {
      LC_ADDRESS = "${lang}";
      LC_IDENTIFICATION = "${lang}";
      LC_MEASUREMENT = "${lang}";
      LC_MONETARY = "${lang}";
      LC_NAME = "${lang}";
      LC_NUMERIC = "${lang}";
      LC_PAPER = "${lang}";
      LC_TELEPHONE = "${lang}";
      LC_TIME = "${lang}";
    };

    #inputMethod = {
    #  enabled = "ibus";
    #  ibus.engines = with pkgs.ibus-engines; [
    #    anthy
    #  ];
    #};
  };


  # System fonts
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      # Contains alot of fonts
      nerdfonts

      # MS Fonts
      corefonts
      vistafonts

      # Misc other fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      dejavu_fonts
    ];
  };
}
