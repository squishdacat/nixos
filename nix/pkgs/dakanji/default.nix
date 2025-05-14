{
  lib,
  fetchFromGitHub,
  flutter324,

  mpv,

  targetFlutterPlatform ? "linux",
}:
let
  pubspecLock = lib.importJSON ./pubspec.lock.json; # cat pubspec.lock | nix run nixpkgs#yj | nix run nixpkgs#jq
in
flutter324.buildFlutterApplication (
  rec {
    pname = "dakanji-${targetFlutterPlatform}";
    version = "3.5.0b2";

    allowUnfree = true;

    src = fetchFromGitHub {
      owner = "CaptainDario";
      repo = "DaKanji";
      fetchSubmodules = true;
      tag = "v${version}";
      hash = "sha256-caUzky14leSBJ5c4DlXOheLLu43lpPQu5nntmyEYsoM=";
    };

    inherit pubspecLock;

    gitHashes = {
      tflite_flutter = "sha256-cYYGZTx8KYf/7tG+XiVQGI7NMC9OAgBeAiYckyk1a7g=";
    };

    inherit targetFlutterPlatform;

    meta = with lib; {
      description = "You are learning Japanese? Then you need to try DaKanji!";
      homepage = "https://dakanji.app/";
      #license = licenses.;
      mainProgram = "dakanji";
      #platforms = [
      #  "x86_64-linux"
      #  "aarch64-linux"
      #];
      sourceProvenance = [ sourceTypes.fromSource ];
    };
  }
  // lib.optionalAttrs (targetFlutterPlatform == "linux") {
    #nativeBuildInputs = [ mpv ];
  }
)
