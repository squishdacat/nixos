{ inputs, pkgs, config, ... }:
{
  imports = [
    ./locale/default.nix
    ./flakes/nvf/default.nix
    ./icons
    ./app/shell/zsh
    ./app/cmd/macchina
    ./app/cmd/yazi.nix
    ./app/cmd/eza.nix
    ./app/cmd/bat.nix
    ./app/cmd/lf.nix
  ];

  home.packages = with pkgs; [
    pw-viz
    qpwgraph
    ffmpeg
    unzip
    zip
    libsixel
    btop

  ];

  programs.git = {
    enable = true;

    userEmail = "git@agreat.email";
    userName = "generically-named";

    extraConfig = {
      mergetool.nixfmt = {
        # TODO: Figure out if I should make this use a global version, or local
        cmd = "nixfmt --mergetool \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"";
        trustExitCode = true;
      };
    };
  };
}
