{ ... }:
{
  # NOTE: When changing bootloaders, remember to add the "--install-bootloader"
  #       flag to the nixos rebuild

  # Allow uefi support
  boot.loader.efi.canTouchEfiVariables = true;
}
