{ config, pkgs, ... }:


let
  username = "nhajlaoui";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

defaultPkgs = with pkgs; [
    docker
    jq
    docker-compose        # docker manager
    neofetch              # command-line system information
    ripgrep               # fast grep
    tree                  # display files in a tree view
    font-awesome          # awesome fonts
    material-design-icons # fonts with glyphs
  ];

in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = (import ./programs) ++ [(import ./fonts)];

  home = {
    inherit username homeDirectory;
    stateVersion = "22.05";

    packages = defaultPkgs;

    sessionVariables = {
      DISPLAY = ":0";
      EDITOR = "nvim";
    };
  };  

 # notifications about home-manager news
  news.display = "silent";

 programs = {
  bat.enable = true;

  fzf = {
      enable = true;
      defaultCommand = "fd --type file --follow"; # FZF_DEFAULT_COMMAND
      defaultOptions = [ "--height 20%" ]; # FZF_DEFAULT_OPTS
      fileWidgetCommand = "fd --type file --follow"; # FZF_CTRL_T_COMMAND
    };

  htop = {
    enable = true;
    settings = {
      sort_direction = true;
      sort_key = "PERCENT_CPU";
    };
  };
 
  jq.enable = true;
  ssh.enable = true;
 };

}
