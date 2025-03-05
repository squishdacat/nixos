{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];

  programs.vscode = {
    enable = true;

    package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
      cargo
      pkg-config openssl
      zlib

      # Needed for Rust Analyzer
      rustup
      #rust-analyzer
    ]);

    mutableExtensionsDir = false; # Dont allow extentions via VSC

    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      extensions = (with pkgs.open-vsx; [
        mkhl.direnv # Auto-import directory nix stuff
        usernamehw.errorlens # Easilly see error next to file
        streetsidesoftware.code-spell-checker-australian-english # Spell check
        gruntfuggly.todo-tree # Add tab of all the TODOs
        pkief.material-icon-theme # Material Icons
        #formulahendry.code-runner # Add run button to file
        anweber.statusbar-commands # Custom statusbar commands
        #asvetliakov.vscode-neovim # NeoVim (need I say more)

        ##### Languages #####
        # Nix
        bbenoist.nix
        # Markdown
        yzhang.markdown-all-in-one
        # Rust
        rust-lang.rust-analyzer
        vadimcn.vscode-lldb
        tamasfe.even-better-toml
        tauri-apps.tauri-vscode
        # Web
        ecmel.vscode-html-css
      ]) ++ (with pkgs.vscode-marketplace; [
        # Nothing atm
      ]);

      userSettings = {
        # General changes
        "window.titleBarStyle" = "custom";
        "editor.inlayHints.enabled" = "offUnlessPressed"; # Ctrl+Alt
        #"workbench.sideBar.location" = "right";
        "diffEditor.ignoreTrimWhitespace" = false;
        "git.enableCommitSigning" = false;
        "git.openRepositoryInParentFolders" = "always";
        # Misc extention settings
        "direnv.restart.automatic" = true;
        "workbench.iconTheme" = "material-icon-theme";

        # Disable Error Lens For Sources
        "errorLens.excludeBySource" = [
          "cSpell" # Error lens would be filled if this is allowed
        ];
        # Makes cSpell use 3 dots rather than an underline
        "cSpell.diagnosticLevel" = "Hint";

        # Improve VSCode-NeoVim performance
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        # LLDB
        "lldb.cargo" = "${pkgs.cargo}/bin/cargo";
        "lldb.launch.expressions" = "native";

        # Extra status bar buttons
        "statusbar_command.commands" = [
          { # Debug
            "text" = "$(debug) Debug "; # Displayes debug icon and text in the status bar
            "color" = "#FF2D00"; # Colour of the text above
            "tooltip" = "Debug Code"; # Displays following message when hovering over button
            "alignment" = "right";
            "command" = "workbench.action.debug.start"; # Debugging command
          }
          { # Run
            "text" = "$(run) Run "; # Displays play run icon and text
            "color" = "#66ff00"; # Colour of the text above
            "tooltip" = "Run Code"; # Displays following text when hevering over button
            "alignment" = "right";
            "command" = "workbench.action.debug.run"; # Running without debugging command
          }
        ];

        # Rust related stuff
        "code-runner.executorMap"."rust" = "${pkgs.cargo}/bin/cargo run # $fileName";
        "files.readonlyInclude" = {
          "**/.cargo/registry/src/**/*.rs" = true;
          "**/lib/rustlib/src/rust/library/**/*.rs" = true;
        };
        # Format on save
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
          "editor.formatOnSave" = true;
        };
        # Rust Analyzer
        "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
        "rust-analyzer.check.command" = "${pkgs.clippy}/bin/cargo-clippy";
        "rust-analyzer.server.extraEnv" = {
          "CARGO" = "${pkgs.cargo}/bin/cargo";
        };
      };
    };
  };
}
