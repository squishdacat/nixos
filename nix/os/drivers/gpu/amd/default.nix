{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    graphics = {
      extraPackages = [ pkgs.amdvlk ];
      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };

    # For OpenCL
    #hardware.extraPackages = with pkgs; [
    #  rocmPackages.clr.icd
    #];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
}
