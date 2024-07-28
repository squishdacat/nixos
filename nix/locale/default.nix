{ ... }:
{
  imports = [
    ./lang/custom.nix
    ./keyboard/workman.nix
    ./fonts.nix
    #./im/ibus.nix
    ./im/fcitx5.nix
  ];


  # Set the time zone
  time.timeZone = "Australia/Adelaide";
}
