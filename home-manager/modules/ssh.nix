{pkgs, ...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
      };
      "github.com" = {
        HostName = "github.com";
        User = "samandar";
        IdentityFile = "~/.ssh/samandar_nixos";
      };
    };
  };

  home.packages = [pkgs.kdePackages.ksshaskpass];
  home.sessionVariables = {
    SSH_ASKPASS = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";
  };
}
