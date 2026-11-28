{
  config,
  pkgs,
  lib,
  ...
}: let
  kerio-control-vpnclient = pkgs.callPackage ../../pkgs/kerio-control-vpnclient {};

  kerio-connect-desktop = pkgs.makeDesktopItem {
    name = "kerio-vpn-connect";
    desktopName = "Connect Kerio VPN";
    comment = "Start Kerio Control VPN Client";
    icon = "network-vpn";
    exec = "systemctl start kerio-kvc";
    categories = ["Network"];
  };

  kerio-disconnect-desktop = pkgs.makeDesktopItem {
    name = "kerio-vpn-disconnect";
    desktopName = "Disconnect Kerio VPN";
    comment = "Stop Kerio Control VPN Client";
    icon = "network-vpn-disconnected";
    exec = "systemctl stop kerio-kvc";
    categories = ["Network"];
  };
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["kerio-control-vpnclient"];

  environment.systemPackages = [
    kerio-control-vpnclient
    kerio-connect-desktop
    kerio-disconnect-desktop
  ];

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
          action.lookup("unit") == "kerio-kvc.service" &&
          subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  boot.kernelModules = ["tun"];

  networking.firewall.trustedInterfaces = ["kvnet"];
  networking.firewall.allowedUDPPorts = [4090];

  systemd.tmpfiles.rules = [
    "d /sbin 0755 root root -"
    "d /usr/sbin 0755 root root -"
    "L+ /sbin/ifconfig - - - - ${pkgs.nettools}/bin/ifconfig"
    "L+ /sbin/route - - - - ${pkgs.nettools}/bin/route"
    "L+ /sbin/ip - - - - ${pkgs.iproute2}/bin/ip"
    "L+ /sbin/resolvconf - - - - ${pkgs.openresolv}/bin/resolvconf"
    "L+ /usr/sbin/ifconfig - - - - ${pkgs.nettools}/bin/ifconfig"
    "L+ /usr/sbin/route - - - - ${pkgs.nettools}/bin/route"
    "L+ /usr/sbin/ip - - - - ${pkgs.iproute2}/bin/ip"
    "L+ /usr/sbin/resolvconf - - - - ${pkgs.openresolv}/bin/resolvconf"
  ];

  systemd.services.kerio-kvc = {
    description = "Kerio Control VPN Client Daemon";
    after = ["network-online.target"];
    wants = ["network-online.target"];

    path = with pkgs; [
      iproute2
      nettools
      openresolv
      procps
      kmod
      coreutils
      bash
      gnugrep
      gnused
      gawk
    ];

    serviceConfig = {
      Type = "forking";
      StateDirectory = "kerio-kvc";
      WorkingDirectory = "/var/lib/kerio-kvc";
      ExecStartPre = "${pkgs.coreutils}/bin/rm -f /tmp/kvpncsvc.lock /tmp/winroute.lock";
      ExecStart = "${kerio-control-vpnclient}/bin/kvpncsvc";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
