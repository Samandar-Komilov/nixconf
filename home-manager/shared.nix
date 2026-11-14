{pkgs, ...}: {
  home.stateVersion = "26.05";

  imports = [
    ./modules/alacritty.nix
    ./modules/zellij.nix
    ./modules/starship.nix
    ./modules/zsh.nix
    ./modules/vscode.nix
    ./modules/zed.nix
  ];

  programs.direnv.enable = true;

  home.packages = with pkgs; [
    # Core utils
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
    neovim
    eza
    ripgrep
    fd
    wl-clipboard
    nerd-fonts.jetbrains-mono
    python3Packages.markitdown

    # Apps
    firefox
    vlc
    element-desktop
    telegram-desktop
    drawio
    ffmpeg
    dive
    dnsmasq
    yt-dlp
    qbittorrent
  ];
}
