{ config, ... }:
{
  programs.helix.settings.keys = rec {
    normal = {
      # Move the keybinds of `;` to `h` (as unbound)
      h = "collapse_selection";
      A-h = "flip_selections";
      A-H = "ensure_selections_forward";
      # And allow `;` to be used as an alt to `:`
      ";" = "command_mode";

      # Workman is very `neoi` heavy, so use those as movement
      n = "move_char_left";
      e = "move_visual_line_down";
      o = "move_visual_line_up";
      i = "move_char_right";
      # Ctrl + stuff
      C-n = "move_next_word_start";
      C-i = "move_prev_word_start";

      # TODO: Add `move_next_word_end` and that stuff

      # Move over-written keys elsewhere
      k = "insert_mode"; # i
      K = "insert_at_line_start";
      l = "open_below"; # o
      L = "open_above";
      # Search
      j = "search_next"; # n
      J = "search_prev";
      # Remove duplicate key
      I = "no_op";
      O = "no_op";
      N = "no_op";

      # Goto
      g = {
        n = "goto_line_start";
        e = "move_line_down";
        o = "move_line_up";
        i = "goto_line_end";

        g = "goto_file_start"; # default
        G = "goto_last_line"; # e

        j = "goto_next_buffer"; # n

        I = "goto_implementation"; # i
      };

      # Window
      C-w = {
        # Jump
        n = "jump_view_left";
        e = "jump_view_down";
        o = "jump_view_up";
        i = "jump_view_right";
        # Move
        N = "swap_view_left";
        E = "swap_view_down";
        O = "swap_view_up";
        I = "swap_view_right";

        k = "wonly"; # o

        # New split scratch buffer
        C-n = {
          "s" = "hsplit_new";
          "C-s" = "hsplit_new";
          "v" = "vsplit_new";
          "C-v" = "vsplit_new";
        };

        # Unbind the default keys
        h = "no_op";
        H = "no_op";
        C-h = "no_op";
        j = "no_op";
        J = "no_op";
        C-j = "no_op";
        #k = "no_op";
        K = "no_op";
        C-k = "no_op";
        l = "no_op";
        L = "no_op";
        C-l = "no_op";
      };

      # Space
      space = {
        # Debug
        /*
          G = {
            n = "no_op";
            j = "dap_next";
          };
        */

        # Window
        w = config.programs.helix.settings.keys.normal.C-w // {
          # Placeholder
        };
      };

      # TODO: Do the z & Z sections
    };

    select = normal // {
      # Workman is very `neoi` heavy, so use those as movement
      n = "extend_char_left";
      e = "extend_visual_line_down";
      o = "extend_visual_line_up";
      i = "extend_char_right";
      # Ctrl + stuff
      C-n = "extend_next_word_start";
      C-i = "extend_prev_word_start";

      # Search
      j = "extend_search_next"; # n
      J = "extend_search_prev";

      g = {
        e = "extend_line_down";
        o = "extend_line_up";

        g = "extend_to_file_start"; # default
        G = "extend_to_last_line"; # e
      };
    };
  };
}
