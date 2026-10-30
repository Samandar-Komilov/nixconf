{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "default";
      default_layout = "default";
      mouse_mode = true;
      pane_frames = true;
      simplified_ui = false;
      copy_command = "wl-copy";
    };
  };
}
