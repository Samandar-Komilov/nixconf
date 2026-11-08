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
      base_keymap = "VSCode";

      theme = {
        mode = "dark";
        light = "Gruvbox Light Hard";
        dark = "Gruvbox Dark Hard";
      };
      icon_theme = "Clean VSCode Icon Theme";

      project_panel = {
        dock = "left";
        default_width = 280;
        file_icons = true;
        folder_indicator = "icon";
        git_status = true;
        auto_reveal_entries = true;
        auto_fold_dirs = true;
        indent_size = 18;
      };

      outline_panel = {
        dock = "right";
      };

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

      indent_guides = {
        enabled = true;
        line_width = 1;
        active_line_width = 2;
        coloring = "indent_aware";
      };

      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
      };

      minimap = {
        show = "always";
      };

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
