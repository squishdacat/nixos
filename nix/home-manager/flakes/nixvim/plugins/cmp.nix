# Autocompleate
{ ... }:
{
  programs.nixvim.plugins = {
    cmp-emoji = { enable = true; };
    cmp = {
      enable = true;
      settings = {
        preselect = "cmp.PreselectMode.None";
        autoEnableSources = true;
        experimental = { ghost_text = true; };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = { expand = "luasnip"; };
        formatting = { fields = [ "kind" "abbr" "menu" ]; };
        sources = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          { name = "path"; }
        ];

        window = {
          completion = { border = "solid"; };
          documentation = { border = "solid"; };
        };

        mapping = {
          "<CR>" = "cmp.mapping.disable";
          "<C-Enter>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete()";

          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";

          # TODO: Make better keybinds for these
          #"<C-b>" = "cmp.mapping.scroll_docs(-4)";
          #"<C-f>" = "cmp.mapping.scroll_docs(4)";
        };
      };
    };

    # Used as sources
    cmp-nvim-lsp = { enable = true; }; # lsp
    cmp-path = { enable = true; }; # file system paths
    cmp-cmdline = { enable = false; }; # autocomplete for cmdline
  };
}
