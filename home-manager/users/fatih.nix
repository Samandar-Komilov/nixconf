{pkgs, ...}: {
  home.username = "fatih";
  home.homeDirectory = "/home/fatih";

  imports = [
    ../shared.nix
  ];

  home.packages = with pkgs; [
  ];
}
