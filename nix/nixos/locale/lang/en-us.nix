{ ... }:
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
  };
}
