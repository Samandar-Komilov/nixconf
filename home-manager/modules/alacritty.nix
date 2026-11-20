{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = {
        program = "${pkgs.zellij}/bin/zellij";
      };
      window = {
        opacity = 0.78;
        blur = true;
        padding = {
          x = 18;
          y = 14;
        };
        dynamic_padding = true;
        decorations = "full";
      };

      colors = {
        primary = {
          background = "#1a1b26";
          foreground = "#c0caf5";
        };
        normal = {
          black = "#15161e";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };
        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };
      };

      font = {
        size = 12.0;
        offset = {
          x = 0;
          y = 2;
        };
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };

      keyboard.bindings = [
        # Word jumping (Ctrl + Left/Right)
        { key = "Left";  mods = "Control"; chars = "\\u001b[1;5D"; }
        { key = "Right"; mods = "Control"; chars = "\\u001b[1;5C"; }
        # Word jumping (Alt + Left/Right)
        { key = "Left";  mods = "Alt";     chars = "\\u001bb"; }
        { key = "Right"; mods = "Alt";     chars = "\\u001bf"; }
        # Line jumping (Home / End)
        { key = "Home"; chars = "\\u001b[H"; }
        { key = "End";  chars = "\\u001b[F"; }
        # Delete word backwards (Ctrl + Backspace)
        { key = "Back"; mods = "Control"; chars = "\\u0017"; }
        # Delete word forwards (Ctrl + Delete)
        { key = "Delete"; mods = "Control"; chars = "\\u001bd"; }
        # Copy / Paste like standard GUI/VS Code
        { key = "C"; mods = "Control|Shift"; action = "Copy"; }
        { key = "V"; mods = "Control|Shift"; action = "Paste"; }
      ];
    };
  };
}
