{ ... }:
{
  imports = [
    ./settings.nix
    ./optimise.nix
    ./update.nix

    ./driver

    #./gc.nix
    ./nh.nix

    ./ld.nix
  ];
}
