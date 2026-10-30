{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$nodejs$rust$python$character";
      right_format = "$time";

      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = "\uf126 ";
        style = "bold purple";
      };

      git_status = {
        style = "red";
      };

      nodejs = {
        symbol = "\ue718 ";
        style = "bold green";
      };

      rust = {
        symbol = "\ue7a8 ";
        style = "bold red";
      };

      python = {
        symbol = "\ue73c ";
        style = "bold yellow";
      };

      character = {
        success_symbol = "[λ](bold green) ";
        error_symbol = "[λ](bold red) ";
      };

      time = {
        disabled = false;
        format = "[$time]($style)";
        style = "bright-black";
      };
    };
  };
}
