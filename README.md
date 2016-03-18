# dotfiles

## Packages

- vim — configuration for vim and gvim.
- zsh — need `oh-my-zsh` installed.

## Usage

Using [GNU Stow][gnu-stow] to symlink them to `~/` directory.

```shell
git clone https://github.com/ladrift/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow <package-name>
```

[gnu-stow]: http://www.gnu.org/software/stow/	"GNU Stow"
