{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      extended = true;
    };

    initContent = ''
      # Word navigation (Ctrl + Left/Right and Alt + Left/Right)
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;3D' backward-word
      bindkey '^[[1;3C' forward-word
      bindkey '^[b' backward-word
      bindkey '^[f' forward-word

      # Line navigation (Home / End)
      bindkey '^[[H' beginning-of-line
      bindkey '^[[F' end-of-line
      bindkey '^[[1~' beginning-of-line
      bindkey '^[[4~' end-of-line

      # Deletion (Ctrl + Backspace / Ctrl + Delete)
      bindkey '^H' backward-kill-word
      bindkey '^?' backward-delete-char
      bindkey '^[[3;5~' kill-word
      bindkey '^[[3~' delete-char
    '';

    shellAliases = {
      cl = "clear";
      # reload = "sudo nixos-rebuild switch --flake .";
      ee = "eza --tree";
      past = "nix profile history --profile /nix/var/nix/profiles/system";
      garbage = "sudo nix-collect-garbage --delete-old";
      ydl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'";
      adl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestaudio[ext=m4a]/best' --extract-audio";
      zj = "zellij";
      # cat = "bat";
      df = "duf";
      du = "dust";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
