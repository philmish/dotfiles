{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      dust
      difftastic
      ripgrep
      yq-go
      jq
    ];
  };
  programs.fzf  = {
    enable                = true;
    enableBashIntegration = true;
  };
  programs.eza = {
    enable                = true;
    icons                 = "always";
    enableBashIntegration = true;
  };
  programs.lazygit = {
    enable   = true;
    settings = {
      git = {
        pagers = [
          { externalDiffCommand = "difft --color=always"; }
        ];
      };
    };
  };
}
