function doIt() {
	# Make a symlink for all dotfiles in this directory
	for file in \.[^.]*; do
		if [ $file != '.DS_Store' ]; then
			echo "Creating symlink to $file in home directory."
			ln -sf $PWD/$file ~/$file
		fi
	done
	#source ~/.zshrc
    ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim
    echo "Done. Please exit and start new shell for settings to take effect."
}

if [[ "$1" == "--force" || "$1" == "-f" ]]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
