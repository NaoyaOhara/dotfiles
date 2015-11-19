dotfiles
========

1.dotfilesの設定

```
cd ~/
git clone https://github.com/youraccount/dotfiles.git
rm -i .bashrc
rm -i .bash_profile
cd dotdfiles
ln ./dotfilesLink.sh
```

1.vimの設定

```
git submodule init
git submodule update
```
してから.vimrc開いて
```
:NeoBundleInstall
```
