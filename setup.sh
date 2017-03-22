if ! type zsh > /dev/null; then
    echo "Please install zsh before running this script"
    exit 1
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -s --batch
# Install todo.txt
git clone https://github.com/ginatrapani/todo.txt-cli.git bin/todo

BASEDIR=$(dirname "$0")

# Copy bin folder
cp -R $BASEDIR/bin/* ~/bin

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy dotfiles
cp $BASEDIR/{.tmux.conf,.todo.cfg,.vimrc,.zshrc} ~/

vim +PluginInstall +qall
