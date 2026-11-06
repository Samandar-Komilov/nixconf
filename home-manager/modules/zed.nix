{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "clean-vscode-icons"
      "assembly"
      "csv"
      "git-firefly"
    ];

    extraPackages = with pkgs; [
      nixd
      alejandra
      rust-analyzer
      ruff
      pyright
      clang-tools
      gopls
      zls
    ];

    userSettings = {
      theme = {
        mode = "dark";
        light = "Gruvbox Light Hard";
        dark = "Gruvbox Dark Hard";
      };
      icon_theme = "Clean VSCode Icon Theme";

      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 15;
      buffer_line_height = {
        custom = 1.6;
      };
      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_size = 14;

      cursor_blink = true;
      cursor_shape = "bar";
      relative_line_numbers = false;
      show_whitespaces = "none";
      tab_size = 2;

      autosave = "on_focus_change";
      format_on_save = "on";
      remove_trailing_whitespace_on_save = true;
      ensure_final_newline_on_save = true;

      features = {
        copilot = false;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      auto_update = false;

      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        font_size = 13;
        line_height = {
          custom = 1.4;
        };
      };

      git = {
        git_gutter = "tracked_files";
        inline_blame = {
          enabled = true;
        };
      };

      languages = {
        Nix = {
          language_servers = ["nixd"];
          formatter = {
            external = {
              command = "alejandra";
            };
          };
        };
        Rust = {
          language_servers = ["rust-analyzer"];
          formatter = {
            language_server = {
              name = "rust-analyzer";
            };
          };
        };
        Python = {
          language_servers = ["pyright" "ruff"];
          formatter = {
            language_server = {
              name = "ruff";
            };
          };
        };
        C = {
          language_servers = ["clangd"];
        };
        "C++" = {
          language_servers = ["clangd"];
        };
        Go = {
          language_servers = ["gopls"];
        };
        Zig = {
          language_servers = ["zls"];
        };
      };
    };
  };
}
