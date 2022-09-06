{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
    };
    init.defaultBranch = "main";
    merge = {
      conflictStyle = "diff3";
      tool          = "vim_mergetool";
    };
    mergetool."vim_mergetool" = {
      cmd    = "nvim -f -c \"MergetoolStart\" \"$MERGED\" \"$BASE\" \"$LOCAL\" \"$REMOTE\"";
      prompt = false;
    };
    pull.rebase = false;
    push.autoSetupRemote = true;
    url = {
      "https://github.com/".insteadOf = "gh:";
      "ssh://git@github.com".pushInsteadOf = "gh:";
      "https://gitlab.com/".insteadOf = "gl:";
      "ssh://git@gitlab.com".pushInsteadOf = "gl:";
    };
  };

  rg = "${pkgs.ripgrep}/bin/rg";
in
{
  programs.git = {
    enable = true;
    aliases = {
      gs = "git status";
      gls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      gll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
    };
    extraConfig = gitConfig;
    ignores = [
      "*.bloop"
      "*.bsp"
      "*.metals"
      "*.metals.sbt"
      "*metals.sbt"
      "*.vscode"
      ".DS_Store"
      "*.direnv"
      "*.envrc"        # there is lorri, nix-direnv & simple direnv; let people decide
      "*.mill-version" # used by metals
      "*.jvmopts"      # should be local to every project
    ];
    signing = {
      key = "121D4302A64B2261";
      signByDefault = true;
    };
    userEmail = "hajlaoui.nader@gmail.com";
    userName = "hajlaoui-nader";
  };
}
