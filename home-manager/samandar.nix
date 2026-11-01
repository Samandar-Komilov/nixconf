{
  pkgs,
  inputs,
  ...
}: {
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
  ];

  home.packages = with pkgs; [
    # Core CLI & modern utils
    tree
    file
    bat
    btop
    duf
    dust
    xh
    rsync
    ouch
    sd
    jq
    pciutils
    usbutils
    fastfetch
    nix-tree

    # Editors, Shell & Terminal
    neovim
    eza
    ripgrep
    fd
    wl-clipboard
    nerd-fonts.jetbrains-mono
    python3Packages.markitdown
    keepassxc
    vlc
    obs-studio

    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
  ];
}
