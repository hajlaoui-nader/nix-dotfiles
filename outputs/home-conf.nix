{ inputs, system, ... }:

with inputs;

let

  pkgs = import nixpkgs {
    inherit system;

    config.allowUnfree = true;

    overlays = [
    ];
  };


  imports = [
    # needed for neovim flake
    neovim-flake.nixosModules.hm
    ../home/home.nix
  ];

  mkHome = (
    home-manager.lib.homeManagerConfiguration rec {
      inherit pkgs;
      modules = [{ inherit imports; }];
    }
  );  
in
  {
 linux = mkHome ;
}
