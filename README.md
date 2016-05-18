dotfiles
========

### dotfilesの設定
```
cd ~/
git clone git@github.com:NaoyaOhara/dotfiles.git
rm -i .bashrc
rm -i .bash_profile
cd dotfiles
sh dotfilesLink.sh
```
### vimの設定
```
git submodule init
git submodule update
```
してから.vimrc開いて
```
:NeoBundleInstall
```
