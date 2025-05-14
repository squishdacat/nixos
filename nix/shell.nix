{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    nixd

    # TODO: Make this be the same package as the flake's fmt
    nixfmt-rfc-style
  ];
}
