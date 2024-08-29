{ inputs, ... }:
{
  programs.nh = {
    enable = true;
    flake = inputs.self.outPath;

    # Garbage Collection
    clean = {
      enable = true;

      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 10d";
    };
  };
}
