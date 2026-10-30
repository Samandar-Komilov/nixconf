{
  nixpkgs,
  home-manager,
  plasma-manager,
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
	sharedModules = [plasma-manager.homeModules.plasma-manager];

        extraSpecialArgs = { inherit inputs; };
        users.samandar = import ../../home-manager/samandar.nix;
      };
    }
  ];
}
