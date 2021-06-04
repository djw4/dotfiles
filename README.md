# dotfiles

```
ln -sf $PWD/.config/ $HOME/.config/zsh
ln -sf $PWD/.zshrc $HOME/.zshrc
```

Also 
```
test ! -d $HOME/.dotfiles &amp;&amp; git clone --bare https://github.com/djw4/dotfiles $HOME/.dotfiles; git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
```
