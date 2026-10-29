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
    neovim

    antigravity-fhs
  ];

  programs.git = {
    enable = true;
    user = {
      name = "samandar.komilov";
      email = "komilov.samandar@uzinfocom.uz";
    }
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

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        rust-lang.rust-analyzer
        ziglang.vscode-zig
        usernamehw.errorlens
        wakatime.vscode-wakatime
        charliermarsh.ruff
        jnoortheen.nix-ide
        tamasfe.even-better-toml

        mkhl.direnv
        kamadorueda.alejandra
      ];

      userSettings = {
        "chat.agent.enabled" = false;
        "editor.tabSize" = 4;
        "editor.fontSize" = 15;
        "editor.lineHeight" = 1.8;
        "editor.letterSpacing" = 0.6;
        "editor.fontWeight" = "500";
        "window.density.editorTabHeight" = "default";
        "editor.padding.top" = 8;
        "editor.padding.bottom" = 16;
        "editor.overviewRulerBorder" = false;
        "editor.hideCursorInOverviewRuler" = true;
        "vim.smartRelativeLine" = true;
        "editor.fontFamily" = "SF Mono";
        # "editor.fontFamily" = "Iosevka";
        "security.workspace.trust.untrustedFiles" = "open";
        "editor.fontLigatures" = true;
        "editor.smoothScrolling" = true;
        "explorer.confirmDelete" = false;
        "workbench.settings.editor" = "json";
        "window.titleBarStyle" = "custom";
        "python.languageServer" = "Pylance";
        "python.analysis.diagnosticMode" = "workspace";
        "python.analysis.autoSearchPaths" = true;
        "python.analysis.useLibraryCodeForTypes" = true;
        "python.analysis.indexing" = true;
        "python.analysis.logLevel" = "Error";
        "ruff.enable" = true;
        "ruff.lint.enable" = true;
        "[python]" = {
          "editor.defaultFormatter" = "charliermarsh.ruff";
        };
        "editor.formatOnSave" = true;
        "terminal.integrated.fontFamily" = "monospace";
        "workbench.editor.empty.hint" = "hidden";
        "editor.defaultFormatter" = "denoland.vscode-deno";
        "[typescript]" = {
          "editor.defaultFormatter" = "denoland.vscode-deno";
        };
        "[html]" = {
          "editor.defaultFormatter" = "vscode.html-language-features";
        };
        "ruff.nativeServer" = "on";
        "[json]" = {
          "editor.defaultFormatter" = "denoland.vscode-deno";
        };
        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };
        "typescript.inlayHints.parameterNames.enabled" = "all";
        "workbench.sideBar.location" = "right";
        "editor.minimap.enabled" = false;
        "workbench.navigationControl.enabled" = false;
        "workbench.statusBar.visible" = true;
        "workbench.editor.showTabs" = "none";
        "window.menuBarVisibility" = "compact";
        "chat.commandCenter.enabled" = false;
        "workbench.layoutControl.enabled" = false;
        "window.commandCenter" = false;
        "git.blame.editorDecoration.enabled" = true;
      };
    };
  };
}
