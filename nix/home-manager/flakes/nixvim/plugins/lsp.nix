# Language Server
{ ... }:
{
  programs.nixvim.plugins = {
    lsp-format = { enable = true; };
    lsp = {
      enable = true;
      servers = {
        astro.enable = true;        # Astro
        bashls.enable = true;       # Bash
        ccls.enable = true;         # C/C++
        cmake.enable = true;        # CMake
        csharp-ls.enable = true;    # C#
        cssls.enable = true;        # CSS
        dockerls.enable = true;     # Dockerfile
        gdscript.enable = true;     # GDScript (Godot)
        html.enable = true;         # HTML
        htmx.enable = true;         # HTMX
        java-language-server.enable = true; # Java
        jsonls.enable = true;       # JSON
        kotlin-language-server.enable = true; # Kotlin
        lemminx.enable = true;      # XML
        #ltex.enable = true;         # LanguageTool # TODO: Requires additional setup
        lua-ls.enable = true;       # Lua
        marksman.enable = true;     # Markdown
        #nginx-language-server.enable = true; # nginx.conf
        #nil-ls.enable = true;       # Nix (Rust)
        nixd.enable = true;         # Nix (Nix-Community Owned)
        #pylsp.enable = true;        # Python (Original)
        pylyzer.enable = true;      # Python (Rust)
        #pyright.enable = true;      # Python (Microsoft Owned)
        #ruff.enable = true;         # Python (Rust)
        #ruff-lsp.enable = true;     # Python (Rust)
        rust-analyzer.enable = true;# Rust
        rust-analyzer.installCargo = true;
        taplo.enable = true;        # TOML
        texlab.enable = true;       # LaTeX
        #tsserver.enable = true;     # TypeScript
        typos-lsp.enable = true;    # Spell Check
        yamlls.enable = true;       # YAML
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  programs.nixvim.extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
