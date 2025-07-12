{ pkgs, ... }:
{
  # Some packages that I will always need
  environment.systemPackages = with pkgs; [
    curl
    wget

    neovim

    nh
    yubikey-personalization
    gnupg
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.ssh.startAgent = false;
  #programs.ssh.askPassword = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  services.openssh.enable = true;
  services.openssh.settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
  };
  services.pcscd.enable = true;

  programs.gnupg.agent = {
  	enable = true;
  	enableSSHSupport = true;
	#pinentryPackage = pkgs.pinentry-qt;
  };
  hardware.gpgSmartcards.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';
}
