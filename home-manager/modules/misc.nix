{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      cliamp
      alsa-lib
      yt-dlp
      presenterm
      tokei
    ];
  };
}
