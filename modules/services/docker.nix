{...}: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        data-root = "~/.local/docker";
        registry-mirrors = ["https://mirror.gcr.io"];
      };
    };
  };
}
