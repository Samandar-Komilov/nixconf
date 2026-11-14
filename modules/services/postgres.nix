{pkgs, ...}: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;
    extensions = with pkgs.postgresql_18.pkgs; [
      pgvector
    ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE USER postgres WITH SUPERUSER CREATEDB LOGIN PASSWORD 'postgres';
    '';
  };
}
