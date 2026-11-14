{
  nixpkgs,
  home-manager,
  ...
}@inputs:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs;
  };
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {inherit inputs;};
        users.samandar = import ../../home-manager/users/samandar.nix;
      };
    }
  ];
}
