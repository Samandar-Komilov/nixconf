{
  config,
  pkgs,
  lib,
  ...
}: {
  # Nix Settings
  nix.settings = {
    experimental-features = "nix-command flakes pipe-operators";
    flake-registry = "";
    nix-path = config.nix.nixPath;

    substituters = [
      "https://cache.xinux.uz?priority=1"
      "https://mirror.sjtu.edu.cn/nix-channels/store?priority=2"
      "https://mirrors.ustc.edu.cn/nix-channels/store?priority=3"
      "https://nix-community.cachix.org?priority=4"
      "https://cache.nixos.org?priority=5"
    ];
    http-connections = 128;
    max-substitution-jobs = 128;
    max-jobs = "auto";
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
    ];
  };

  # Automated Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.optimise.automatic = true;

  # Bootloader (systemd-boot EFI)
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 3;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
  };
  programs.ssh.startAgent = true;
  services.openssh.enable = false;

  time.timeZone = "Asia/Tashkent";
  i18n.defaultLocale = "en_US.UTF-8";

  # Sound with PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "onlyoffice-desktopeditors"
      "steam"
      "steam-original"
      "steam-run"
    ];

  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
  ];

  users.users."samandar" = {
    isNormalUser = true;
    description = "samandar";
    extraGroups = ["networkmanager" "wheel" "docker" "libvirtd"];
    shell = pkgs.zsh;
  };

  users.users."fatih" = {
    isNormalUser = true;
    description = "fatih";
    extraGroups = ["networkmanager" "wheel" "docker" "libvirtd"];
    shell = pkgs.zsh;
  };

  system.stateVersion = "26.05";
}
