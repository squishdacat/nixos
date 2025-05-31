{ inputs, ... }:
{
  programs.nh = {
    enable = true;

    # TODO: Make this not hard-coded
    #flake = inputs.self.outPath;
    flake = "/home/michaelw/.dotfiles/";

    # Garbage Collection
    clean = {
      enable = true;

      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 10d";
    };
  };
}
