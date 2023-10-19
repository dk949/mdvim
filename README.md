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

## Feature highlights

* [Goyo](https://github.com/junegunn/goyo.vim) enables by default.
* [vim-dispatch](https://github.com/tpope/vim-dispatch).
* Dictionary. Use `<S-k>` on a word to get it's definition (requires internet).
* Word count
* Line motion is by virtual lines (regular line motions are swapped with `g*`
  versions)

See [keymap.md](keymap.md) for default key bindings.

## Configuration

Most options are set in `init.lua`. Theme setup is in `lua/onedark_config.lua`.

Add new plugins by adding `use` lines in `lua/plugins.lua` (it's using
[packer.nvim](https://github.com/wbthomason/packer.nvim)).

### Local configuration

Additional per-directory configuration can be added in a `.mdvimrc` or `.mdvimrc.lua`
(vim script and lua respectively). If `mdvim` is launched in a directory with one of
those files, they will be sourced.
