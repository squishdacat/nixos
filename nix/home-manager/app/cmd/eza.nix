{ ... }:
{
  programs.eza = {
    enable = true;

    extraOptions = [
      "--all"
      #"--icons"
      "--group-directories-first"
    ];
    icons = true;
    git = true;
  };
}

