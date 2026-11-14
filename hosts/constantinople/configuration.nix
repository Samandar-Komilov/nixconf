{...}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/core

    ../../modules/desktop/plasma.nix

    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/intel-gpu.nix

    ../../modules/services/docker.nix
    ../../modules/services/libvirt.nix
    ../../modules/services/postgres.nix
  ];

  networking.hostName = "constantinople";
}
