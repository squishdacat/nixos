{
  inputs,
  config,
  lib,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home.sessionVariables.EDITOR = "nvim";
	programs.nvf = {
                enable = true;
                settings.vim = {
                        options.tabstop = 2;
                        options.shiftwidth = 2;
                        viAlias = false;
                        vimAlias = true;
                        keymaps = [
                            {
                              key = "<Space>k";
                              mode = ["n"];
                              action = ":lua vim.diagnostic.open_float()";
                              silent = true;
                              desc = "Open error floating display";
                            }
                          ];

                        autopairs.nvim-autopairs.enable = true;
                        snippets.luasnip.enable = true;
                        lsp = {
                                enable = true;
                                formatOnSave = true;
                                };
                        theme = {
                                enable = true;
                                name = lib.mkForce"tokyonight";
                                style = "night";
                                };
                        statusline.lualine.enable = true;
                        tabline = {
                              nvimBufferline.enable = true;
                            };

                        treesitter.context.enable = true;

                            binds = {
                              whichKey.enable = true;
                              cheatsheet.enable = true;
                            };

                        telescope.enable = true;

                            git = {
                              enable = true;
                              gitsigns.enable = true;
                              gitsigns.codeActions.enable = false; # throws an annoying debug message
                            };
                        formatter.conform-nvim.enable = true;
                        autocomplete.nvim-cmp.enable = true;
                        languages = {
                                #php.enable = true;
                                nix = {
                                  enable = true;
                                };
                                sql.enable = true;
                                python.enable = true;
                                markdown.enable = true;
                                html.enable = true;
                                go.enable = true;
                                lua.enable = true;
                        };
                };
	};
}
