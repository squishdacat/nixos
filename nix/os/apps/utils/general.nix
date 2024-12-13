{ pkgs, ... }:
{
  # Some packages that I will always need
  environment.systemPackages = with pkgs; [
    curl
    wget

    neovim

    nh
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
