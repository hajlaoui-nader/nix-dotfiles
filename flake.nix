{
  description = "my configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      homeConfigurations = (
        import ./outputs/home-conf.nix {
          inherit inputs system;
        }
      );

      nixosConfigurations = (
        import ./outputs/nixos-conf.nix {
          inherit inputs system;
        }
      );
    };
  
 }
