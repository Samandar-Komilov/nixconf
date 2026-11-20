{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "default";
      default_layout = "default";
      mouse_mode = true;
      pane_frames = true;
      simplified_ui = false;
      show_startup_tips = false;
      copy_command = "wl-copy";
    };
    extraConfig = ''
      plugins {
          welcome-screen location="zellij:session-manager" {
              welcome_screen false
          }
      }
    '';
  };
}
