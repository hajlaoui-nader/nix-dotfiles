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
 nhajlaoui = mkHome ;
}
