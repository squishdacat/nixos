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
      rust-analyzer
    ]);
    

    # TODO: Make extentions declerative
    extensions = with pkgs.vscode-extensions; [
      # Auto-import directory nix stuff
      mkhl.direnv
      # General code stuff
      formulahendry.code-runner
      usernamehw.errorlens
      gruntfuggly.todo-tree

      ##### Languages #####
      # Help with nix stuff
      bbenoist.nix
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
      "git.enableCommitSigning" = false;

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
