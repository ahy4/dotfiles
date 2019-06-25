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
ln -s (pwd)/fish/config.fish $HOME/.config/fish/config.fish
ln -s (pwd)/fish/bash-setup.sh $HOME/.config/fish/bash-setup.sh
ln -s (pwd)/fish/fish_variables $HOME/.config/fish/fish_variables
mkdir -p $HOME/.config/fish/functions/
ln -s (pwd)/fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
ln -s (pwd)/fish/functions/fish_user_key_bindings.fish $HOME/.config/fish/functions/fish_user_key_bindings.fish
# fundle
mkdir -p ~/.config/fish/functions
wget https://git.io/fundle -O ~/.config/fish/functions/fundle.fish

### NeoVim
mkdir -p ~/.config/nvim
ln -s (pwd)/nvim/init.vim $HOME/.config/nvim/init.vim

### ranger
mkdir -p $HOME/.config/ranger
ln -s (pwd)/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -s (pwd)/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
ln -s (pwd)/ranger/scope.sh $HOME/.config/ranger/scope.sh

###
# Linux Setting
# Tested on Arch Linux
###

if [ "(expr substr (uname -s) 1 5)" = 'Linux' ]
  ### .Xresources for xterm, etc...
  ln -s (pwd)/.Xresources $HOME/.Xresources
  # to reload: xrdb ~/.Xresources

  ### .xprofile
  ln -s (pwd)/.xprofile $HOME/.xprofile

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

