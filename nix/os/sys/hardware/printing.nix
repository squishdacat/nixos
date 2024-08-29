{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    startWhenNeeded = true; # cups shouldnt be running all the time

    #browsing = true;
    #openFirewall = true;

    # just as a test, cups' to pdf option is enabled
    cups-pdf.enable = true;


    drivers = with pkgs; [
          #gutenprint # Drivers for many different printers from many different vendors
          #gutenprintBin # Additional, binary-only drivers for some printers
          #hplip # Drivers for HP printers
          #hplipWithPlugin # Drivers for HP printers, with the proprietary plugin. Use NIXPKGS_ALLOW_UNFREE=1 nix-shell -p hplipWithPlugin --run 'sudo -E hp-setup' to add the printer, regular CUPS UI doesn't seem to work
          #postscript-lexmark # Postscript drivers for Lexmark
          #samsung-unified-linux-driver # Proprietary Samsung Drivers
          #splix # Drivers for printers supporting SPL (Samsung Printer Language)
          #brlaser # Drivers for some Brother printers
          #brgenml1lpr #and brgenml1cupswrapper # Generic drivers for more Brother printers
          #cnijfilter2 # Drivers for some Canon Pixma devices (Proprietary driver
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };


  #programs.system-config.printer.enable = true;
}
