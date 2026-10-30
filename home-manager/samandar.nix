{pkgs, ...}: {
  home.username = "samandar";
  home.homeDirectory = "/home/samandar";
  home.stateVersion = "26.05";

  imports = [
    ./modules/alacritty.nix
    ./modules/zellij.nix
    ./modules/starship.nix
    ./modules/zsh.nix
    ./modules/git.nix
    ./modules/vscode.nix
    ./modules/plasma.nix
  ];

  home.packages = with pkgs; [
    neovim
    eza
    ripgrep
    fd
    wl-clipboard
    nerd-fonts.jetbrains-mono
    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
  ];
}
