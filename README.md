# mdvim

A minimal neovim setup for editing markdown files.

Designed to co-exist with your regular neovim installation (using NVIM_APPNAME)

## Install

```sh
# clone into config directory
git clone https://github.com/dk949/mdvim "$XDG_CONFIG_HOME/mdvim"
cd "$XDG_CONFIG_HOME/mdvim/bin"
# install
make install
```

_Note:_ You can use `DESTDIR` and `PREFIX` environment variables before running
`make install` to set install directory. Default is `DESTDIR=${HOME}/.local` and
`PREFIX=`.

## Usage

Use just like regular neovim, but use `mdvim` instead of `nvim`.


## Configuration

Most options are set in `init.lua`. Theme setup is in `lua/onedark_config.lua`.

Add new plugins by adding `use` lines in `lua/plugins.lua` (it's using
[packer.nvim](https://github.com/wbthomason/packer.nvim)).

