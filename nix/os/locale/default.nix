{ ... }:
{
  imports = [
    ./locales.nix
    ./lang

    ./keyboard/workman.nix
    ./im/fcitx5.nix

    ./fonts.nix
  ];
}
