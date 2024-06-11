{ ... }:
{
  imports = [
    ./settings.nix
    ./optimise.nix
    ./update.nix

    #./gc.nix
    ./nh.nix

    ./ld.nix
  ];
}
