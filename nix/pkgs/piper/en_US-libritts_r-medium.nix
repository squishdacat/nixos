{
  stdenv,
}:
let
  en_US_libritts_r = {
    onnx = builtins.fetchurl {
      url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts_r/medium/en_US-libritts_r-medium.onnx?download=true";
      sha256 = "sha256:159iq7x4idczq4p5ap9wmf918jfhk4brydhz0zsgq5nnf7h8bfqh";
    };
    json = builtins.fetchurl {
      url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/libritts_r/medium/en_US-libritts_r-medium.onnx.json";
      sha256 = "sha256:1cxgr5dm0y4q4rxjal80yhbjhydzdxnijg9rkj0mwcyqs9hdqwdl";
    };
  };
in
  stdenv.mkDerivation {
    name = "piper-en_US-libritts_r-medium";
    #version = "0.0.0";

    #src = builtins.fetchGit {
    #  url = "https://huggingface.co/rhasspy/piper-voices";
    #  rev = "293cad0539066f86e6bce3b9780c472cc9157489";
    #};

    phases = [ "installPhase" ];# Removes all phases except installPhase
    installPhase = ''
      #mkdir -p $out/usr/share/
      #cp -r $src $out/usr/share/piper-voices

      mkdir -p $out/usr/share/piper-voices/en/US/libritts_r
      cp ${en_US_libritts_r.onnx} $out/usr/share/piper-voices/en/US/libritts_r/medium.onnx
      cp ${en_US_libritts_r.json} $out/usr/share/piper-voices/en/US/libritts_r/medium.onnx.json
    '';
  }
