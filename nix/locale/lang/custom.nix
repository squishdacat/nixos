{ ... }:
let
  lang = "en_AU.UTF-8";
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
      LC_TIME = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "${lang}";
    };
  };
}
