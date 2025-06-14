{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    #initContent = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    dotDir = ".config/zsh";

    history = {
      save = 10000; # Lines to save to file
      size = 10000; # Lines to keep
      extended = true; # Include date
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };

    historySubstringSearch.enable = true;

    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      #hm-update = "home-manager switch";
      hm-update = "nh home switch";
      nixGL = "nix run --impure github:nix-community/nixGL --";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    oh-my-zsh = {
        enable = true;
        plugins = ["git" "sudo" "docker" "kubectl"];
        theme = "bureau";
    };

  

  };

 #programs.zsh.zplug = {
  #  enable = true;
  #
  #  zplugHome = "${config.xdg.configHome}/zsh/zplug";
  #  plugins = [
  #    #{ name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
  #    {
  #      name = "romkatv/powerlevel10k";
  #      tags = [ as:theme depth:1 ];
  #    } # Installations with additional options. For the list of options, please refer to Zplug README.
  #  ];
  #};
}
