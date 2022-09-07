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
