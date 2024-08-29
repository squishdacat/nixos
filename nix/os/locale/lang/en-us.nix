{ ... }:
let
  lang = "en_US.UTF-8";
in
{
  i18n = {
    defaultLocale = "${lang}";

    extraLocaleSettings = {
      LC_ADDRESS = "${lang}";
      LC_COLLATE = "${lang}";
      LC_CTYPE = "${lang}";
      LC_MEASUREMENT = "${lang}";
      LC_MONETARY = "${lang}";
      LC_NAME = "${lang}";
      LC_NUMERIC = "${lang}";
      LC_PAPER = "${lang}";
      LC_TELEPHONE = "${lang}";
      LC_TIME = "${lang}";
      LC_IDENTIFICATION = "${lang}";
    };
  };
}
