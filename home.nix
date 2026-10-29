{ pkgs, ... }: {
  home.username = "samandar";
  home.homeDirectory = "/home/samandar";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    alacritty    

    antigravity-fhs
  ];

  programs.git = {
    enable = true;
    userName = "samandar.komilov";
    userEmail = "komilov.samandar@uzinfocom.uz";
  };
}
