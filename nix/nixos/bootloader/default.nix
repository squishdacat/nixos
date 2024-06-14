{ ... }:
{
  imports = [
    # NOTE: When changing bootloaders, remember to add the "--install-bootloader"
    #       flag to the nixos rebuild
    ./systemd.nix
    #./grub.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;


  # Why isnt this enabled by default?
  boot.tmp.cleanOnBoot = true;
}
