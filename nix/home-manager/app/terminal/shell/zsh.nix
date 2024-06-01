{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
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
      hm-update = "home-manager switch";
      nixGL = "nix run --impure github:nix-community/nixGL --";
    };


    #plugins = [
    #  {
    #    name = "powerlevel10k";
    #    src = pkgs.zsh-powerlevel10k;
    #    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #  }
    #];
  };




  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "sudo"
    ];
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
