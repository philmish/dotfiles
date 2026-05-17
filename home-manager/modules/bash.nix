{ pkgs, ... }: {
  programs.bash = {
    enable           = true;
    enableCompletion = true;
    shellAliases     = {
      dc    = "docker compose";
      lg    = "lazygit";
      hgrep = "history | rg";
      ls    = "eza";
      ll    = "eza -l";
      la    = "eza -la";
    };
  };
  home.packages = [
    (pkgs.writeShellScriptBin "tmxg" ''
      #!/usr/bin/env bash
      if [[ -z $(pgrep tmux) ]]; then
       echo "Tmux Server is not running, no sessions to connect to."
       exit 1
      fi

       selected=$(tmux list-sessions | fzf)
       if [[ -z $selected ]]; then
         echo "no session selected"
         exit 1
       fi
       name=$(echo "$selected" | awk -F: '{print $1}')
       tmux attach-session -t "$name"
     '')
  ];
}
