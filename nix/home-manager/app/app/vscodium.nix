{ pkgs, lib, ... }:
{
  /*
  nixpkgs.overlays = [
    (
      self: super: {
        vscodium = super.vscodium.overrideAttrs (oldAttrs: {
          # extend old postInstall (if exists) with wrapProgram
          installPhase = (oldAttrs.installPhase or "") + ''
            wrapProgram $out/bin/codium --set LD_LIBRARY_PATH ${lib.makeLibraryPath (with pkgs; [
              udev alsa-lib vulkan-loader
              xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
              libxkbcommon wayland # To use the wayland feature
            ])}
          '';

          nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ (with pkgs; [
            pkg-config
            udev alsa-lib
          ]);
          propagatedBuildInputs = [ pkgs.stdenv.cc ];
        });
      }
    )
  ];
  */

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
      cargo
      pkg-config openssl
      zlib

      # Needed for Rust Analyzer
      rustup
      #rust-analyzer
    ]);
    

    # TODO: Make extentions declerative
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv # Auto-import directory nix stuff
      formulahendry.code-runner # Add run button to file
      usernamehw.errorlens # Easilly see error next to file
      gruntfuggly.todo-tree # Add tab of all the TODOs
      # asvetliakov.vscode-neovim # NeoVim (need I say more)

      ##### Languages #####
      # Nix
      bbenoist.nix
      # Markdown
      yzhang.markdown-all-in-one
      # Rust
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
      tamasfe.even-better-toml
    ];

    userSettings = {
      # General changes
      "window.titleBarStyle" = "custom";
      #"editor.inlayHints.enabled" = "off";
      #"workbench.sideBar.location" = "right";
      "diffEditor.ignoreTrimWhitespace" = false;
      "git.enableCommitSigning" = false;
      "git.openRepositoryInParentFolders" = "always";
      "direnv.restart.automatic" = true;

      # Rust related stuff
      "files.readonlyInclude" = {
        "**/.cargo/registry/src/**/*.rs" = true;
        "**/lib/rustlib/src/rust/library/**/*.rs" = true;
      };
      "code-runner.executorMap"."rust" = "${pkgs.cargo}/bin/cargo run # $fileName";
      # Rust Analyzer
      "rust-analyzer.server.path" = "${pkgs.rust-analyzer}/bin/rust-analyzer";
      "rust-analyzer.check.command" = "${pkgs.clippy}/bin/cargo-clippy";
      "rust-analyzer.server.extraEnv" = {
        "CARGO" = "${pkgs.cargo}/bin/cargo";
      };

      #"terminal.integrated.env.linux" = {
      #  "LD_LIBRARY_PATH" = lib.makeLibraryPath (with pkgs; [
      #    udev alsa-lib vulkan-loader
      #    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
      #    libxkbcommon wayland # To use the wayland feature
      #  ]);
      #};
    };
  };
}
