{pkgs, ...}: {
  home.username = "fatih";
  home.homeDirectory = "/home/fatih";

  imports = [
    ../shared.nix
    ../modules/git.nix
    ../modules/ssh.nix
  ];

  # Work user SSH hosts and keys
  programs.ssh.settings = {
    "github.com" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/fatih_constantinople";
    };
  };

  home.packages = with pkgs; [
  ];

  inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
}
