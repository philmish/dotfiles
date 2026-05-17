{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      dust
      difftastic
      ripgrep
      hyperfine
      yq-go
      jq
    ];
  };
  programs.zoxide = {
    enable                = true;
    enableBashIntegration = true;
  };
  programs.mise   = {
    enable                = true;
    enableBashIntegration = true;
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
