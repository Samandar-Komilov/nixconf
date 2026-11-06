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
    ./modules/zed.nix
  ];

  home.packages = with pkgs; [
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
    keepassxc
    vlc
    obs-studio
    element-desktop
    drawio
    termius
    brave

    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
  ];

  xdg.configFile."autostart/org.keepassxc.KeePassXC.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=KeePassXC
    GenericName=Password Manager
    Exec=${pkgs.keepassxc}/bin/keepassxc --minimized
    Icon=keepassxc
    Terminal=false
    Categories=Utility;Security;
    StartupNotify=false
    X-GNOME-Autostart-enabled=true
  '';
}
