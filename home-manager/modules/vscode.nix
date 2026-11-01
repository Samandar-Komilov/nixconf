{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions =
        (with pkgs.vscode-extensions; [
          # General
          wakatime.vscode-wakatime
          jdinhlife.gruvbox
          vscode-icons-team.vscode-icons
          usernamehw.errorlens
          vadimcn.vscode-lldb
          gruntfuggly.todo-tree
          mechatroner.rainbow-csv
          tamasfe.even-better-toml
          esbenp.prettier-vscode
          eamodio.gitlens

          # Rust & Nix
          rust-lang.rust-analyzer
          jnoortheen.nix-ide
          mkhl.direnv
          kamadorueda.alejandra

          # Python
          ms-python.python
          ms-python.debugpy
          charliermarsh.ruff

          # C / C++ / Zig
          llvm-vs-code-extensions.vscode-clangd
          ms-vscode.cmake-tools
          ziglang.vscode-zig

          # Go
          golang.go

          # Assembly
          pkgs.vscode-extensions."13xforever".language-x86-64-assembly
        ])
        ++ [
          (pkgs.vscode-utils.extensionFromVscodeMarketplace {
            name = "arm";
            publisher = "dan-c-underwood";
            version = "1.7.4";
            hash = "sha256-gZBM980AoD+0wnfHXJK9sqCuuLtRY08JnO3Qdq/TRfc=";
          })
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
