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
      IdentityFile = "~/.ssh/id_ed25519"; # Replace with your work key filename if different (e.g. ~/.ssh/fatih_work)
    };
  };

  home.packages = with pkgs; [
  ];
}
