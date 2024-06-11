{ lib
, rustPlatform
, fetchFromGitHub
, installShellFiles
, stdenv
, darwin
}:
rustPlatform.buildRustPackage rec {
  pname = "macchina";
  version = "f6840f6d0193800c5ce3b7bbcae427c8fad5be05";

  src = fetchFromGitHub {
    owner = "Macchina-CLI";
    repo = pname;
    rev = "${version}";
    hash = "sha256-MntHq5nphfjbO0Rx7v6WjsnabSMH5Ke3aR9/embG/rk=";
  };

  patches = [
    ./main.patch
  ];

  cargoHash = "sha256-yowhMwp/ZTgqwwIvpPGU50GwCORfLcCZLA1mCERygkY=";

  nativeBuildInputs = [
    installShellFiles
  ];

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.AppKit
    darwin.apple_sdk.frameworks.DisplayServices
  ];

  postInstall = ''
    installManPage doc/macchina.{1,7}
  '';

  meta = with lib; {
    description = "Fast, minimal and customizable system information fetcher";
    homepage = "https://github.com/Macchina-CLI/macchina";
    #changelog = "https://github.com/Macchina-CLI/macchina/releases/tag/v${version}";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ _414owen figsoda ];
    mainProgram = "macchina";
  };
}
