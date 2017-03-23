if ! type zsh > /dev/null; then
    echo "Please install zsh before running this script"
    exit 1
fi

if ! type git > /dev/null; then
    echo "Please install git before running this script"
    exit 1
fi
if ! type vim > /dev/null; then
    echo "Please install vim before running this script"
    exit 1
fi

BASEDIR=$(dirname "$0")

# Copy bin folder
cp -R $BASEDIR/bin ~/bin

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch 
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-256color" ]; then
  git clone https://github.com/chrissicool/zsh-256color ~/.oh-my-zsh/custom/plugins/zsh-256color
fi

# Install todo.txt
if [ ! -d "$HOME/bin/todo" ]; then
  git clone https://github.com/ginatrapani/todo.txt-cli.git ~/bin/todo
fi
# Install vundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Copy dotfiles
cp $BASEDIR/.tmux.conf ~/
cp $BASEDIR/.todo.cfg ~/
cp $BASEDIR/.vimrc ~/
cp $BASEDIR/.zshrc ~/
cp $BASEDIR/.vimrc.bundle ~/

# Install vim plugins
vim -u ~/.vimrc.bundle +PluginInstall +qall

# Install powerline fonts
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir -p ~/.fonts && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts/

mkdir -p ~/.config/fontconfig/conf.d && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

echo "\n --- \n"

echo "Setup complete! Enjoy!"

exec zsh
