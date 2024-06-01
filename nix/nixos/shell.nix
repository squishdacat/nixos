{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      nix-shell = "nix-shell --command zsh";
      #nix-shell = "nix-shell --run zsh";
      update = "sudo nixos-rebuild switch";
    };

    # History
    histSize = 10000;
    #histFile = "${config.xdg.configHome}/zsh/history";
  };

  # Adds zsh to the list of valid shells
  environment.shells = with pkgs; [ zsh ];
  # Sets all users default shell to be zsh
  users.defaultUserShell = pkgs.zsh;
}
