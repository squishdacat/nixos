{ config, pkgs, ... }:
{
  imports = [
    ./../pkgs
    #./hardware-configuration.nix
    ./nix

    ./user/coolgi

    ./locale
    ./login

    ./shell
    ./app

    #./libvirt.nix
  ];

  # NOTE
  #  Remember to set which host to use on a fresh install
  #   ie. ./host/laptop/aubrey
  

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  environment.systemPackages = with pkgs; [
    macchina
  ];
  hardware.wooting.enable = true;

  # The set of english words (at $WORDLIST env var)
  #environment.wordList.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
