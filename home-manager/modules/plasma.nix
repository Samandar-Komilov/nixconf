{pkgs, ...}: {
  programs.plasma = {
    enable = true;
    overrideConfig = false;

    workspace = {
      clickItemTo = "open";
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    kwin = {
      titlebarButtons = {
        left = [];
        right = ["minimize" "maximize" "close"];
      };
    };

    panels = [
      {
        location = "top";
        height = 30;
        lengthMode = "fill";
        alignment = "center";
        floating = false;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              date = {
                enable = true;
                format = "shortDate";
              };
              time = {
                format = "12h";
              };
            };
          }
        ];
      }

      {
        location = "bottom";
        height = 54;
        lengthMode = "fit";
        alignment = "center";
        floating = true;
        hiding = "dodgewindows";
        # widgets = [
        #   {
        #     iconTasks = {
        #       launchers = [
        #         "applications:org.kde.dolphin.desktop"
        #         "applications:Alacritty.desktop"
        #         "applications:code.desktop"
        #         "applications:firefox.desktop"
        #       ];
        #       appearance = {
        #         showTooltips = true;
        #         highlightWindows = true;
        #       };
        #     };
        #   }
        # ];
      }
    ];
  };
}
