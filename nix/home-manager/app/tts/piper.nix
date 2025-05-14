{ pkgs, outputs, ... }:
let
  voice_wanted = "en/en_US/libritts_r/medium/en_US-libritts_r-medium.onnx";

  piper = pkgs.fetchgit {
    url = "https://huggingface.co/rhasspy/piper-voices";
    rev = "293cad0539066f86e6bce3b9780c472cc9157489";
    sha256 = "sha256-1Uql+Ewa7SMUWkLLOweY2Ehlc2Mz18PnR5btr2REck8=";
    fetchLFS = true;
    sparseCheckout = (
      builtins.match "(.+)/.*" # Get the file's directory
        voice_wanted
    );
  };

  model = "${piper}/${voice_wanted}";
in
{
  home.file = {
    ".config/speech-dispatcher/modules/piper.conf".text = ''
      GenericExecuteSynth "echo '$DATA'\
        | ${pkgs.piper-tts}/bin/piper --model ${model} -s 0 --output_raw\
        | ${pkgs.sox}/bin/sox -r 22050 -c 1 -b 16 -e signed-integer -t raw - -t wav - tempo $RATE pitch $PITCH norm\
        | ${pkgs.alsa-utils}/bin/aplay -t raw -c 1 -r 22050 -f S16_LE"

      GenericRateAdd 1
      GenericPitchAdd 1
      GenericVolumeAdd 1
      GenericRateMultiply 1
      GenericPitchMultiply 1000
      AddVoice "en-US" "MALE1" "Piper"
    '';

    ".config/speech-dispatcher/speechd.conf".text = ''
      AddModule "piper" "sd_generic" "piper.conf"
      DefaultModule "piper"

      SymbolsPreproc "char"
      SymbolsPreprocFile "gender-neutral.dic"
      SymbolsPreprocFile "font-variants.dic"
      SymbolsPreprocFile "symbols.dic"
      SymbolsPreprocFile "emojis.dic"
      SymbolsPreprocFile "orca.dic"
      SymbolsPreprocFile "orca-chars.dic"
    '';
    #DefaultVoiceType "male1"
    #DefaultLanguage "en-US"
  };

  # Ensure Piper and Speech Dispatcher are installed
  home.packages = with pkgs; [
    speechd
    piper-tts
    pipewire
    sox
    alsa-utils
  ];
}
