dotfiles
========

### zsh・preztoの設定
```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```
```
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
 ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
### dotfilesの設定
```
cd ~/
git clone git@github.com:NaoyaOhara/dotfiles.git
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
### fzfまわりの準備
deinの設定だけでうまく動かなかったので
```
brew install fzf
```
ripgrepをインストール
```
$ brew install ripgrep
```
