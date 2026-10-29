{ pkgs, ... }: {
  home.username = "samandar";
  home.homeDirectory = "/home/samandar";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    oh-my-zsh
    alacritty
    nvim

    antigravity-fhs
  ];

  programs.git = {
    enable = true;
    userName = "samandar.komilov";
    userEmail = "komilov.samandar@uzinfocom.uz";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    shellAliases = {
      cl = "clear";
      reload = "sudo nixos-rebuild switch --flake ";
      ee = "exa --tree";

      # NixOS related
      past = "nix profile history --profile /nix/var/nix/profiles/system";
      garbage = "sudo nix-collect-garbage --delete-old";
    };

    history = {
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ydl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'";
      adl = "yt-dlp -o '%(title)s.%(ext)s' -f 'bestaudio[ext=m4a]/best' --extract-audio";
    };
  };
}
