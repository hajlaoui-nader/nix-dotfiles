{ pkgs, ... }: {
  
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraConfig = "syntax on";
    plugins = with pkgs.vimPlugins; [
      nerdcommenter
      nerdtree
      #which-key
      vim-nix
      tokyonight-nvim
      onedark-nvim
      which-key-nvim
      rec {
        plugin = onedark-vim;
        config = ''
          packadd! ${plugin.pname}
          colorscheme tokyonight
        '';
      }
    ];
  };
}
