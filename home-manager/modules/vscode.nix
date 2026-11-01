{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jdinhlife.gruvbox
        vscode-icons-team.vscode-icons
        rust-lang.rust-analyzer
        ziglang.vscode-zig
        usernamehw.errorlens
        wakatime.vscode-wakatime
        charliermarsh.ruff
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        mkhl.direnv
        kamadorueda.alejandra
        esbenp.prettier-vscode
        eamodio.gitlens
      ];

      userSettings = {
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "workbench.iconTheme" = "vscode-icons";
        "workbench.sideBar.location" = "left";
        "workbench.editor.showTabs" = "multiple";
        "workbench.navigationControl.enabled" = true;
        "workbench.statusBar.visible" = true;
        "workbench.layoutControl.enabled" = true;
        "window.titleBarStyle" = "custom";
        "window.menuBarVisibility" = "classic";

        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 14;
        "editor.lineHeight" = 1.6;
        "editor.tabSize" = 2;
        "editor.fontWeight" = "400";
        "editor.smoothScrolling" = true;
        "editor.minimap.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.padding.top" = 8;
        "editor.padding.bottom" = 8;

        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "terminal.integrated.fontSize" = 13;

        "security.workspace.trust.untrustedFiles" = "open";
        "explorer.confirmDelete" = false;
        "git.autofetch" = true;
        "git.confirmSync" = false;

        "[nix]" = {
          "editor.defaultFormatter" = "kamadorueda.alejandra";
        };

        "[rust]" = {
          "editor.defaultFormatter" = "rust-lang.rust-analyzer";
        };

        "[python]" = {
          "editor.defaultFormatter" = "charliermarsh.ruff";
        };

        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      };
    };
  };
}
