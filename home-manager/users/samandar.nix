{
  pkgs,
  inputs,
  ...
}: {
  home.username = "samandar";
  home.homeDirectory = "/home/samandar";

  imports = [
    ../shared.nix
    ../modules/git.nix
    ../modules/ssh.nix
  ];

  home.packages = with pkgs; [
    obs-studio
    termius
    protontricks
    brave
    onlyoffice-desktopeditors

    (anydesk.overrideAttrs (oldAttrs: {
      src = pkgs.fetchurl {
        inherit (oldAttrs.src) url;
        hash = "sha256-zS5P2eyTHZY7cBW8mQ2Q6M0lXcx9VZZTtpG3Bb6u7IQ=";
      };
    }))

    inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.google-antigravity-cli
  ];
}
