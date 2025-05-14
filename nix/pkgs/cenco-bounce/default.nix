{
  ffmpeg,
  stdenv,
  writeTextFile,
}:
let
  rname = "cenco-bounce";
  logo = ./cenco-bounce.mp4;
in
stdenv.mkDerivation {
  name = "plymouth-${rname}-theme";

  src = writeTextFile {
    name = "theme.script";
    text = ''
      Window.SetBackgroundTopColor (0.0, 0.0, 0.0);
      Window.SetBackgroundBottomColor (0.0, 0.0, 0.0);

      # The animation information
      # TODO: Make these 2 depend on the video file
      nframes = 14;
      nseconds = 1.709333;

      # Cache the frames into a buffer
      for (i = 1; i <= nframes; i++)
        frames_buffer[i] = Image("progress-" + i + ".png");
      video = Sprite("progress-1.png");

      # Place in the center
      video.SetX(Window.GetWidth() / 2 - frames_buffer[1].GetWidth() / 2);
      video.SetY(Window.GetHeight() / 2 - frames_buffer[1].GetHeight() / 2);

      # Create the loop
      progress = 1;
      frame = null;
      fun refresh_callback (){
        frame = frames_buffer[Math.Int(progress) % nframes];
        progress = progress + ((nframes/nseconds)/50);

        video.SetImage(frame);
      }

      Plymouth.SetRefreshFunction (refresh_callback);
    '';
  };

  nativeBuildInputs = [ ffmpeg ];

  unpackPhase = "true";
  buildPhase = ''
    themeDir="$out/share/plymouth/themes/${rname}"
    mkdir -p $themeDir

    ffmpeg -i ${logo} $themeDir/progress-%01d.png

    cp -r ${./extras}/. $themeDir/ | true # Copy the extra stuff
    cp $src $themeDir/${rname}.script # Copy the script
  '';

  installPhase = ''
    cat << EOF > $themeDir/${rname}.plymouth
    [Plymouth Theme]
    Name=${rname}
    ModuleName=script

    [script]
    ImageDir=$themeDir
    ScriptFile=$themeDir/${rname}.script
    EOF
  '';
}
