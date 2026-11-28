{...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/core

    ../../modules/desktop/plasma.nix

    ../../modules/hardware/battery.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/intel-gpu.nix

    ../../modules/services/docker.nix
    ../../modules/services/libvirt.nix
    ../../modules/services/postgres.nix
    ../../modules/services/gaming.nix
    ../../modules/services/kerio-vpn.nix
  ];

  networking.hostName = "marakanda";
}
