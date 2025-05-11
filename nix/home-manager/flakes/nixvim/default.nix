{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./plugins/fidget.nix
    ./plugins/lsp.nix
    ./plugins/lspkind.nix
    ./plugins/cmp.nix
  ];

  programs.nixvim = {
    enable = true;
    #defaultEditor = true;

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
      shiftwidth = 2;
      expandtab = true;

      # Enable persistent undo history
      swapfile = false;
      backup = false;
      undofile = true;

      # Enable 24-bit colors
      termguicolors = true;
    };

    filetype.extension = {
      mdx = "markdown";
    };
    

    plugins = {
      nix.enable = true;
      nix-develop.enable = true;
      transparent.enable = true;
    };


    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
