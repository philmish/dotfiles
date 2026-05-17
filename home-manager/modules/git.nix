{ pkgs, ... }: {
  programs.git = {
    enable    = true;
    settings  = {
      user = {
        name  = "<GIT_USERNAME>";
        email = "<GIT_EMAIL>";
      };
      core = {
        editor = "nvim";
        pager  = "bat";
      };
      init = {
        defaultBranch = "main";
      };
      alias = {
        st  = "status";
        cm  = "commit -m";
        plr = "pull --rebase";
        dl  = "-c diff.external=difft log -p --ext-diff";
        ds  = "-c diff.external=difft show --ext-diff";
        dft = "-c diff.external=difft diff";
      };
    };
    ignores   = [
      ".env"
      "__pycache__"
      "*.egg-info/"
      ".installed.cfg"
      "*.egg"
      "MANIFEST"
      "venv"
      ".venv"
      ".ruff_cache/"
    ];
  };
}
