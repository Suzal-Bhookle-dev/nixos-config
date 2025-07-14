{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = {
        inherit inputs system;
      };

      modules = [
        ./nixos/configuration.nix
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
      ];
    };

    homeConfigurations."suzal" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./nixos/home.nix
      ];

        extraSpecialArgs = {
    inherit inputs system;
  };
    };
  };
}
