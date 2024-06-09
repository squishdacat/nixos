{ ... }:
{
  services.printing = {
    enable = true;
    startWhenNeeded = true; # cups shouldnt be running all the time

    #browsing = true;
    #openFirewall = true;

    # just as a test, cups' to pdf option is enabled
    cups-pdf.enable = true;


    #allowFrom = [ "all" ];
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };


  #programs.system-config.printer.enable = true;
}
