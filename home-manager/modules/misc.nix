{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      cliamp
      presenterm
      tokei
    ];
  };
}
