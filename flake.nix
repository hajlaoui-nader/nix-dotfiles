{
  description = "my configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

  neovim-flake = {
    url = github:hajlaoui-nader/neovim-flake;
    inputs.nixpkgs.follows = "nixpkgs";
  };

};

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      linux = (
        import ./outputs/home-conf.nix {
          inherit inputs system;
        }
      );

      mac = (
        import ./outputs/home-conf.nix {
          inherit inputs system;
        }
      );

      homeConfigurations = (
        import ./outputs/home-conf.nix {
          inherit inputs system;
        }
      );
    };
  
 }
