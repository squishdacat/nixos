# Icons for stuff
{ ... }:
{
  programs.nixvim.plugins.lspkind = {
    enable = true;
    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
