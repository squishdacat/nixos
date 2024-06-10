{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.base16.enable = true;


    opts = {
      # Left side collums
      number = true;
      relativenumber = true;
      #signcolumn = true;
      
      # Turn tabs into two spaces
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;

      # Enable persistent undo history
      swapfile = false;
      backup = false;
      undofile = true;

      # Enable 24-bit colors
      termguicolors = true;
    };
    

    plugins = {
      nix.enable = true;
      nix-develop.enable = true;
    };


    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
