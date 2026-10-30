{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.88;
        blur = true;
        padding = {
          x = 14;
          y = 12;
        };
        dynamic_padding = true;
        decorations = "full";
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
    };
  };
}
