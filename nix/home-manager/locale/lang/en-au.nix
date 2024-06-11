{ ... }:
let
  lang = "en_AU.UTF-8";
in
{
  home.language = {
    base = "${lang}";

    address = "${lang}";
    collate = "${lang}";
    ctype = "${lang}";
    measurement = "${lang}";
    messages = "${lang}";
    monetary = "${lang}";
    name = "${lang}";
    numeric = "${lang}";
    paper = "${lang}";
    telephone = "${lang}";
    time = "${lang}";
  };
}
