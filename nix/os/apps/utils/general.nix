{ pkgs, ... }:
{
  # Some packages that I will always need
  environment.systemPackages = with pkgs; [
    curl
    wget

    neovim
    git

    nh
  ];
}
