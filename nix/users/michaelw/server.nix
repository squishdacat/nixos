{ inputs, ... }:
{
  imports = [
    #./../../home-manager/home.nix
    ./../defaults/home.nix

    #./../../home-manager/flakes/stylix
    #./../../home-manager/flakes/nixvim
    ./../../home-manager/flakes/nvf
    #./../../home-manager/flakes/ags
    #./../../home-manager/flakes/discord-moonlight
  ];

}
