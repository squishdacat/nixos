{ ... }:
{
  boot.loader.efi.canTouchEfiVariables = true;

  imports = [
    # NOTE: When changing bootloaders, remember to add the "--install-bootloader"
    #       flag to the nixos rebuild
    ./systemd.nix
    #./grub.nix
  ];
}
