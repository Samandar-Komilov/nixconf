{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "samandar.komilov";
      user.email = "komilov.samandar@uzinfocom.uz";
      credential.helper = "${pkgs.git}/bin/git-credential-libsecret";
    };
  };
}
