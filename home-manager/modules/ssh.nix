{pkgs, ...}: {
  # Base SSH client & KWallet integration (shared across all users)
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      AddKeysToAgent = "yes";
    };
  };

  home.packages = [pkgs.kdePackages.ksshaskpass];
  home.sessionVariables = {
    SSH_ASKPASS = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";
  };
}
