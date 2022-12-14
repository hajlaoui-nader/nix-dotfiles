# Dotfiles

## Usage

Install [Nix][nix] and then install [home-manager][home-manager]. You should be
able to run the `home-manager` program in a shell.

Next, clone this repository to `~/.config/nixpkgs`.

```shell
$ git clone git@github.com:hajlaoui-nader/nix-dotfiles.git ~/.config/nixpkgs
```

This will place the [`home.nix`](home.nix) file in the location home-manager
expects. The home-manager profile can then be built and activated:

```shell
$ home-manager switch
```

flake activation on linux
```shell
nix build .#homeConfigurations.linux.activationPackage
result/activate
```

To update home-manager:

```shell
$ nix-channel --update nixpkgs
unpacking channels...
$ nix-env -u home-manager
```

To update home-manager-managed packages:

```shell
$ nix-channel --update nixpkgs
unpacking channels...
$ home-manager switch
```

## TODO
uncomment `programs`

## License

[MIT](http://opensource.org/licenses/MIT).

[nix]: https://nixos.org/
[home-manager]: https://github.com/nix-community/home-manager
[neovim]: https://neovim.io/

