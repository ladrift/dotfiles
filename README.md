# dotfiles

## Packages

```
- vim       configuration for vim and gvim
- zsh       need `oh-my-zsh` installed
- aria2     aria2 downloader
- gdb       some custom commands for `gdb`
- tmux      custom shortcut prefix and etc...
- git       git username, email and default editor config
```

## Usage

Using [GNU Stow][gnu-stow] to symlink them to `~/` directory.

```shell
git clone https://github.com/ladrift/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# install package for an specified configuration
stow <package-name>
# uninstall
stow -D <package-name>
# install to specified path
sudo stow zsh -t /
```

Inspired by 
- [xero's dotfiles][xero-dotfiles]
- [unofficial guide to dotfiles on Github](http://dotfiles.github.io)

[gnu-stow]: http://www.gnu.org/software/stow/	"GNU Stow"
[xero-dotfiles]: https://github.com/xero/dotfiles	"xero's dotfiles"
