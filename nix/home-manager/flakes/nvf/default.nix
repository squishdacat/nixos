{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home.sessionVariables.EDITOR = "${config.programs.nvf.settings.vim.package}/bin/nvim";

  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings.vim = {
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      spellcheck = {
        enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        nvim-docs-view.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      filetree = {
        neo-tree = {
          enable = true;
        };
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        rust = {
          enable = true;
          crates.enable = true;
        };
        nix.enable = true;
        sql.enable = true;
        clang.enable = true;
        ts.enable = true;
        python.enable = true;
        zig.enable = true;
        markdown.enable = true;
        astro.enable = true;
        html.enable = true;
        css.enable = true;
        lua.enable = true;
        bash.enable = true;
        java.enable = true;
        kotlin.enable = true;
        assembly.enable = true;
      };
    };
  };
}
