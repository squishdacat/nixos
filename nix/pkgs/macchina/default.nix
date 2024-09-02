{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      macchina = final.callPackage prev.macchina.override {
        rustPlatform = final.rustPlatform // {
          buildRustPackage = args: final.rustPlatform.buildRustPackage (args // rec {
            version = "8e1d11519be0d1052f0cbdec702a8b103941dff8";
            
            src = prev.fetchFromGitHub {
              owner = "Macchina-CLI";
              repo = prev.macchina.pname;
              rev = "${version}";
              hash = "sha256-EiZoTLGMrYxTjFV46gv11z2cuE+gIlF9j2nPMrrlccM=";
            };
            
            cargoHash = "";

            cargoLock = {
              lockFile = "${src}/Cargo.lock";
              outputHashes = {
                "libmacchina-7.3.1" = "sha256-WuIJAMppTWjVzlWRuOkD8W5v/0D0bqDqRBPwxFs9MGg=";
              };
            };
          });
        };
      };
    })
  ];


  environment.systemPackages = [
    pkgs.macchina
  ];
}
