{
  nixpkgs,
  home-manager,
  ...
}@inputs:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs;
  }
  // {
    hostname = "samandar";
  };
  modules = [
    ./configuration.nix
  ]

  ++ [
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
	useUserPackages = true;

        extraSpecialArgs = { inherit inputs; };
        users.samandar = import ../../home-manager/samandar.nix;
      };
    }
  ];
}
