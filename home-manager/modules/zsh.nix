{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      extended = true;
    };

    shellAliases = {
      cl = "clear";
      reload = "sudo nixos-rebuild switch --flake .";
      ee = "eza --tree";
      past = "nix profile history --profile /nix/var/nix/profiles/system";
      garbage = "sudo nix-collect-garbage --delete-old";
      ydl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'";
      adl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestaudio[ext=m4a]/best' --extract-audio";
      zj = "zellij";
      cat = "bat";
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
