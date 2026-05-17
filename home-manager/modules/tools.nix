{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      dust
      difftastic
    ];
  };
  programs.eza = {
    enable                = true;
    icons                 = "auto";
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
