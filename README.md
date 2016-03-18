# dotfiles

## Packages

- vim — configuration for vim and gvim.
- zsh — need `oh-my-zsh` installed.
- ycm_global_config — default You Complete Me flags for c++ in OSX.

##Usage

Using GNU Stow to symlink them to `~/` directory

```shell
git clone <url> ~/.dotfiles
cd ~/.dotfiles
stow <package-name>
```