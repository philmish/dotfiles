{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      yt-dlp
      presenterm
      tokei
    ];
  };
}
