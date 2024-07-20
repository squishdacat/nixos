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


}
