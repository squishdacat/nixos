{ ... }:
let
  # TODO: Is there a better way to do this?
  #yomichad = builtins.fetchurl {
  #  url = "https://github.com/potamides/yomichad/raw/main/yomichad";
  #  sha256 = "sha256:0ri84ifwacgxjxrc03pamqq2j7c6aqkn53whsp9zaa993hb8l47v";
  #};
in
{
  programs.qutebrowser = {
    enable = true;

    searchEngines = {
      DEFAULT = "https://searx.be/search?q={}";
      # Search Engines
      sx = "https://searx.be/search?q={}";
      bv = "https://search.brave.com/search?q={}";
      gg = "https://www.google.com/search?hl=en&q={}";
      bg = "https://www.bing.com/search?q={}";
      ddg = "https://duckduckgo.com/?q={}";

      # Mic
      yt = "https://youtube.com/results?search_query={}";
      jisho = "https://jisho.org/search?keyword={}";

      # Wikis
      wp = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      nw = "https://wiki.nixos.org/index.php?search={}";
      aw = "https://wiki.archlinux.org/?search={}";
    };

    keyBindings = {
      normal = {
        # Zoom
        "zi" = "zoom-in";
        "zo" = "zoom-out";
        "zz" = "zoom";

        # Use MPV for videos
        ",m" = "spawn --userscript view_in_mpv {url}";
        ",M" = "hint links spawn --userscript view_in_mpv {hint-url}";

        # Yomichad
        #"gs" = "spawn --userscript ${yomichad}";
        #"gS" = "spawn --userscript ${yomichad} --prefix-search";


        ##### More usable on Workman #####
        # Opening links
        "t" = "cmd-set-text -sr :open";
        "T" = "cmd-set-text -sr :open -t";
        "b" = "cmd-set-text -sr :tab-focus"; # Buffer
        # Change the position of tab
        "gE" = "tab-move +";
        "gO" = "tab-move -";
        # Searching (using `/` keybind)
        "k" = "search-next";
        "K" = "search-prev";
        # Scrolling
        "n" = "scroll left";
        "e" = "scroll down";
        "o" = "scroll up";
        "i" = "scroll right";
        # Scrolling more
        "<Ctrl-n>" = "cmd-run-with-count 10 scroll left";
        "<Ctrl-e>" = "cmd-run-with-count 10 scroll down";
        "<Ctrl-o>" = "cmd-run-with-count 10 scroll up";
        "<Ctrl-i>" = "cmd-run-with-count 10 scroll right";
        # More navigation
        "N" = "back"; #in history
        "E" = "tab-next";
        "O" = "tab-prev";
        "I" = "forward"; #in history

      };
      "caret" = {
        "N" = "scroll left";
        "E" = "scroll down";
        "O" = "scroll up";
        "I" = "scroll right";
      };
    };

    settings = {
      scrolling.smooth = true;
      content.autoplay = false;
      url.start_pages = "about:blank";

      colors.webpage = {
        # Prefer Dark
        preferred_color_scheme = "dark";
        # But dont force a website on it if it doesn't support it
        darkmode.enabled = false;
      };

      hints = {
        min_chars = 2;
        uppercase = true;
        chars = "ashtneoi"; # Middle keys on Workman
      };
    };
  };
}
