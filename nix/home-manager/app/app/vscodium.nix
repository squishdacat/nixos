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
    #enableExtensionUpdateCheck = false;

    package = pkgs.vscodium.fhsWithPackages (ps: with ps; [
      cargo
      pkg-config openssl
      zlib
    ]);
    

    # TODO: Make extentions declerative
    extensions = with pkgs.vscode-extensions; [
      tamasfe.even-better-toml
      mkhl.direnv
      bbenoist.nix
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
      formulahendry.code-runner
    ];

    userSettings = {
      # General changes
      "editor.inlayHints.enabled" = "off";
      #"workbench.sideBar.location" = "right";
      "git.enableCommitSigning" = false;

      # Rust related stuff
      "code-runner.executorMap"."rust" = "${pkgs.cargo}/bin/cargo run # $fileName";
      "files.readonlyInclude" = {
        "**/.cargo/registry/src/**/*.rs" = true;
        "**/lib/rustlib/src/rust/library/**/*.rs" = true;
      };
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
