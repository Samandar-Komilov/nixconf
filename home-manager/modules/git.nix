{ pkgs, ... }: {
  programs.git = {
    enable = true;
    settings.user.name = "samandar.komilov";
    settings.user.email = "komilov.samandar@uzinfocom.uz";
  };
}
