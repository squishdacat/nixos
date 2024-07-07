{ ... }:
{
  imports = [
    ./lang/en-au.nix
    ./keyboard/workman.nix
    ./fonts.nix
    ./im/ibus.nix
  ];


  # Set the time zone
  time.timeZone = "Australia/Adelaide";
}
