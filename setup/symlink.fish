###
# Updating Symbolic Link ShellScript
###

if ! pwd | grep -E 'dotfiles$' > /dev/null ^&1
  echo 'please use this script on project root'
  exit 1
end

### Tmux Config
ln -s (pwd)/.tmux.conf $HOME/.tmux.conf
# to reload: source-file ~/.tmux.conf or <C-a>r

### Shell Config
ln -s (pwd)/.bashrc $HOME/.bashrc
mkdir -p $HOME/.config/fish/
ln -s (pwd)/fish/bash-setup.sh $HOME/.config/fish/bash-setup.sh
ln -s (pwd)/fish/fish_variables $HOME/.config/fish/fish_variables
# omf
curl -L https://get.oh-my.fish | fish
mkdir -p $HOME/.config/omf/
ln -s (pwd)/omf/init.fish $HOME/.config/omf/init.fish

### NeoVim
mkdir -p ~/.config/nvim
ln -s (pwd)/nvim/init.vim $HOME/.config/nvim/init.vim


###
# Linux Setting
# Tested on Arch Linux
###

if [ (expr substr (uname -s) 1 5) = 'Linux' ]
  ### .Xresources for xterm, etc...
  ln -s (pwd)/.Xresources $HOME/.Xresources
  # to reload: xrdb ~/.Xresources

  ### xkeysnail (low-level key bindings)
  sudo mkdir -p /etc/xkeysnail
  ln -s (pwd)/xkeysnail/config.py /etc/xkeysnail
  # sorry, set /etc/xkeysnail/pw your pw ....

  ### gitconfig
  ln -s (pwd)/.gitconfig $HOME/.gitconfig

  ### i3wm
  mkdir -p $HOME/.i3
  ln -s (pwd)/.i3/config $HOME/.i3/config
  # to reload: i3-msg reload

  ### Rofi (<Super>d)
  mkdir -p $HOME/.config/rofi
  ln -s (pwd)/rofi/config.rasi $HOME/.config/rofi/config.rasi

end

