{
  description = "voidp's nix configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

   antigravity-nix = {
    url = "github:jacopone/antigravity-nix";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: 
    let
        system = "x86_64-linux";
	pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations.voidp = import ./hosts/samandar inputs;

      formatter.${system} = pkgs.nixfmt-tree;
        devShells.${system}.default = pkgs.mkShell {
          packages = with pkgs; [
            self.formatter.${system}
              nil
              nixd
              statix
              deadnix
          ];
        };
    };
}
