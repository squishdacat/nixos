{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    keymap = {
      manager.prepend_keymap = [
        {
          on = [ "y" ];
          run = [
            ''shell 'for path in "$@"; do echo "file://$path"; done | ${pkgs.wl-clipboard}/bin/wl-copy -t text/uri-list' --confirm''
            "yank"
          ];
        }
        {
          on = [
            "g"
            "r"
          ];
          run = ''shell 'ya pub dds-cd --str "$(${pkgs.git}/bin/git rev-parse --show-toplevel)"' --confirm'';
        }
      ];
    };

    settings = {
      manager = {
        show_hidden = true;
        scrolloff = 4; # No. of files to keep above the cursor when scrolling

        # Sort
        sort_by = "natural";
        sort_sensitive = true;
        sort_dir_first = true;
        sort_translit = true;
      };

      preview = {
        wrap = "yes";
      };
    };
  };
}
